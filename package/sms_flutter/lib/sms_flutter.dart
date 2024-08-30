import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:sms_flutter/contact.dart';

typedef OnError = Function(Object error);

enum SmsMessageState {
  Sending,
  Sent,
  Delivered,
  Fail,
  None,
}

enum SmsMessageKind {
  Sent,
  Received,
  Draft,
}

/// A SMS Message
///
/// Used to send message or used to read message.
class SmsMessage implements Comparable<SmsMessage> {
  int? _id;
  int? _threadId;
  int? _sim;
  String? _address;
  String? _body;
  bool? _read;
  DateTime? _date;
  DateTime? _dateSent;
  SmsMessageKind? _kind;
  SmsMessageState _state = SmsMessageState.None;
  final StreamController<SmsMessageState> _stateStreamController =
      StreamController<SmsMessageState>();

  SmsMessage(this._address, this._body,
      {int? id,
      int? threadId,
      int? sim,
      bool? read,
      DateTime? date,
      DateTime? dateSent,
      SmsMessageKind? kind}) {
    _id = id;
    _threadId = threadId;
    _sim = sim;
    _read = read;
    _date = date;
    _dateSent = dateSent;
    _kind = kind;
  }

  /// Read message from JSON
  ///
  /// Format:
  ///
  /// ```json
  /// {
  ///   "address": "phone-number-here",
  ///   "body": "text message here"
  /// }
  /// ```
  SmsMessage.fromJson(Map data) {
    _address = data["address"];
    _body = data["body"];
    _sim = data["sub_id"];
    if (data.containsKey("_id")) {
      _id = data["_id"];
    }
    if (data.containsKey("thread_id")) {
      _threadId = data["thread_id"];
    }
    if (data.containsKey("read")) {
      _read = (data["read"] as int?) == 1;
    }
    if (data.containsKey("kind")) {
      _kind = data["kind"];
    }
    if (data.containsKey("date")) {
      _date = DateTime.fromMillisecondsSinceEpoch(data["date"]);
    }
    if (data.containsKey("date_sent")) {
      _dateSent = DateTime.fromMillisecondsSinceEpoch(data["date_sent"]);
    }
  }

  /// Convert SMS to map
  Map get toMap {
    Map res = {};
    if (_address != null) {
      res["address"] = _address;
    }
    if (_body != null) {
      res["body"] = _body;
    }
    if (_sim != null) {
      res["sub_id"] = _sim;
    }
    if (_id != null) {
      res["_id"] = _id;
    }
    if (_threadId != null) {
      res["thread_id"] = _threadId;
    }
    if (_read != null) {
      res["read"] = _read;
    }
    if (_date != null) {
      res["date"] = _date!.millisecondsSinceEpoch;
    }
    if (_dateSent != null) {
      res["dateSent"] = _dateSent!.millisecondsSinceEpoch;
    }
    return res;
  }

  /// Get message id
  int? get id => _id;

  /// Get thread id
  int? get threadId => _threadId;

  /// Get sender, alias phone number
  String? get sender => _address;

  /// Get address, alias phone number
  String? get address => _address;

  /// Get message body
  String? get body => _body;

  /// Get Sim recieved the message
  int? get sim => _sim;

  /// Check if message is read
  bool? get isRead => _read;

  /// Get date
  DateTime? get date => _date;

  /// Get date sent
  DateTime? get dateSent => _dateSent;

  /// Get message kind
  SmsMessageKind? get kind => _kind;

  Stream<SmsMessageState> get onStateChanged => _stateStreamController.stream;

  /// Set message kind
  set kind(SmsMessageKind? kind) => _kind = kind;

  /// Set message date
  set date(DateTime? date) => _date = date;

  /// Get message state
  SmsMessageState get state => _state;

  set state(SmsMessageState state) {
    if (_state != state) {
      _state = state;
      _stateStreamController.add(state);
    }
  }

  @override
  int compareTo(SmsMessage other) {
    return other._id! - _id!;
  }
}

/// A SMS thread
class SmsThread {
  int? _id;
  String? _address;
  Contact? _contact;
  List<SmsMessage> _messages = [];

  SmsThread(int? id) : _id = id;

  /// Create a thread from a list of message, the id will be taken from
  /// the first message
  SmsThread.fromMessages(List<SmsMessage>? messages) {
    if (messages == null || messages.isEmpty) {
      return;
    }
    _id = messages[0].threadId;

    for (var msg in messages) {
      if (msg.threadId == _id && msg.address != null) {
        _address = msg.address;
        break;
      }
    }

    for (var msg in messages) {
      if (msg.threadId == _id) {
        _messages.add(msg);
      }
    }
  }

  /// Add a message at the end
  void addMessage(SmsMessage msg) {
    if (msg.threadId == _id) {
      _messages.add(msg);
      _address ??= msg.address;
    }
  }

  /// Add a message at the start
  void addNewMessage(SmsMessage msg) {
    if (msg.threadId == _id) {
      _messages.insert(0, msg);
      _address ??= msg.address;
    }
  }

  /// Set contact through contact query
  Future findContact() async {
    ContactQuery query = ContactQuery();
    Contact? contact = await query.queryContact(_address);
    if (contact != null) {
      _contact = contact;
    }
  }

  /// Get messages from thread
  List<SmsMessage> get messages => _messages;

  /// Get address
  String? get address => _address;

  /// Set messages in thread
  set messages(List<SmsMessage> messages) => _messages = messages;

  /// Get thread id
  int? get id => _id;

  /// Get thread id (for compatibility)
  int? get threadId => _id;

  /// Get contact info
  Contact? get contact => _contact;

  /// Set contact info
  set contact(Contact? contact) => _contact = contact;
}

/// A SMS receiver that creates a stream of SMS
///
///
/// Usage:
///
/// ```dart
/// var receiver = SmsReceiver();
/// receiver.onSmsReceived.listen((SmsMessage msg) => ...);
/// ```
class SmsReceiver {
  static SmsReceiver? _instance;
  final EventChannel _channel;
  Stream<SmsMessage>? _onSmsReceived;

  factory SmsReceiver() {
    if (_instance == null) {
      const EventChannel eventChannel =
          EventChannel("plugins.elyudde.com/recvSMS", JSONMethodCodec());
      _instance = SmsReceiver._private(eventChannel);
    }
    return _instance!;
  }

  SmsReceiver._private(this._channel);

  /// Create a stream that collect received SMS
  Stream<SmsMessage>? get onSmsReceived {
    _onSmsReceived ??= _channel.receiveBroadcastStream().map((dynamic event) {
      SmsMessage msg = SmsMessage.fromJson(event);
      msg.kind = SmsMessageKind.Received;
      return msg;
    });
    return _onSmsReceived;
  }
}

/// A SMS sender
class SmsSender {
  static SmsSender? _instance;
  final MethodChannel _channel;
  final EventChannel _stateChannel;
  late Map<int, SmsMessage> _sentMessages;
  int _sentId = 0;
  final StreamController<SmsMessage?> _deliveredStreamController =
      StreamController<SmsMessage?>();

  factory SmsSender() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          MethodChannel("plugins.elyudde.com/sendSMS", JSONMethodCodec());
      const EventChannel stateChannel =
          EventChannel("plugins.elyudde.com/statusSMS", JSONMethodCodec());

      _instance = SmsSender._private(methodChannel, stateChannel);
    }
    return _instance!;
  }

  SmsSender._private(this._channel, this._stateChannel) {
    _stateChannel.receiveBroadcastStream().listen(_onSmsStateChanged);

    _sentMessages = <int, SmsMessage>{};
  }

  /// Send an SMS
  ///
  /// Take a message in argument + 2 functions that will be called on success or on error
  ///
  /// This function will not set automatically thread id, you have to do it
  Future<SmsMessage?> sendSms(SmsMessage msg, {SimCard? simCard}) async {
    if (msg.address == null || msg.body == null) {
      if (msg.address == null) {
        throw ("no given address");
      } else if (msg.body == null) {
        throw ("no given body");
      }
      return null;
    }

    msg.state = SmsMessageState.Sending;
    Map map = msg.toMap;
    _sentMessages.putIfAbsent(_sentId, () => msg);
    map['sentId'] = _sentId;
    if (simCard != null) {
      map['subId'] = simCard.slot;
    }
    _sentId += 1;

    if (simCard != null) {
      map['simCard'] = simCard.imei;
    }

    if (!kIsWeb && Platform.isIOS) {
      final mapData = <dynamic, dynamic>{
        "message": map['body'],
        "recipients": [map['address']],
      };
      await _channel.invokeMethod("sendSMS", mapData);
      msg.date = DateTime.now();
    } else {
      await _channel.invokeMethod("sendSMS", map);
      msg.date = DateTime.now();
    }

    return msg;
  }

  Stream<SmsMessage?> get onSmsDelivered => _deliveredStreamController.stream;

  void _onSmsStateChanged(dynamic stateChange) {
    int? id = stateChange['sentId'];
    if (_sentMessages.containsKey(id)) {
      switch (stateChange['state']) {
        case 'sent':
          {
            _sentMessages[id!]!.state = SmsMessageState.Sent;
            break;
          }
        case 'delivered':
          {
            _sentMessages[id!]!.state = SmsMessageState.Delivered;
            _deliveredStreamController.add(_sentMessages[id]);
            _sentMessages.remove(id);
            break;
          }
        case 'fail':
          {
            _sentMessages[id!]!.state = SmsMessageState.Fail;
            _sentMessages.remove(id);
            break;
          }
      }
    }
  }
}

enum SmsQueryKind { Inbox, Sent, Draft }

/// A SMS query
class SmsQuery {
  static SmsQuery? _instance;
  final MethodChannel _channel;

  factory SmsQuery() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          MethodChannel("plugins.elyudde.com/querySMS", JSONMethodCodec());
      _instance = SmsQuery._private(methodChannel);
    }
    return _instance!;
  }

  SmsQuery._private(this._channel);

  /// Wrapper for query only one kind
  Future<List<SmsMessage>> _querySmsWrapper(
      {int? start,
      int? count,
      String? address,
      int? threadId,
      SmsQueryKind kind = SmsQueryKind.Inbox}) async {
    Map arguments = {};
    if (start != null && start >= 0) {
      arguments["start"] = start;
    }
    if (count != null && count > 0) {
      arguments["count"] = count;
    }
    if (address != null && address.isNotEmpty) {
      arguments["address"] = address;
    }
    if (threadId != null && threadId >= 0) {
      arguments["thread_id"] = threadId;
    }
    String function;
    SmsMessageKind msgKind;
    if (kind == SmsQueryKind.Inbox) {
      function = "getInbox";
      msgKind = SmsMessageKind.Received;
    } else if (kind == SmsQueryKind.Sent) {
      function = "getSent";
      msgKind = SmsMessageKind.Sent;
    } else {
      function = "getDraft";
      msgKind = SmsMessageKind.Draft;
    }
    return await _channel.invokeMethod(function, arguments).then((dynamic val) {
      List<SmsMessage> list = [];
      for (Map data in val) {
        SmsMessage msg = SmsMessage.fromJson(data);
        msg.kind = msgKind;
        list.add(msg);
      }
      return list;
    });
  }

  /// Query a list of SMS
  Future<List<SmsMessage>> querySms(
      {int? start,
      int? count,
      String? address,
      int? threadId,
      List<SmsQueryKind> kinds = const [SmsQueryKind.Inbox],
      bool sort = true}) async {
    List<SmsMessage> result = [];
    for (var kind in kinds) {
      result.addAll(await _querySmsWrapper(
        start: start,
        count: count,
        address: address,
        threadId: threadId,
        kind: kind,
      ));
    }
    if (sort == true) {
      result.sort((a, b) => a.compareTo(b));
    }
    return (result);
  }

  /// Query multiple thread by id
  Future<List<SmsThread>> queryThreads(List<int> threadsId,
      {List<SmsQueryKind> kinds = const [SmsQueryKind.Inbox]}) async {
    List<SmsThread> threads = <SmsThread>[];
    for (var id in threadsId) {
      final messages = await querySms(threadId: id, kinds: kinds);
      final thread = SmsThread.fromMessages(messages);
      await thread.findContact();
      threads.add(thread);
    }
    return threads;
  }

  /// Get all SMS
  Future<List<SmsMessage>> get getAllSms async {
    return querySms(
        kinds: [SmsQueryKind.Sent, SmsQueryKind.Inbox, SmsQueryKind.Draft]);
  }

  /// Get all threads
  Future<List<SmsThread>> get getAllThreads async {
    List<SmsMessage> messages = await getAllSms;
    Map<int?, List<SmsMessage>> filtered = {};
    for (var msg in messages) {
      if (!filtered.containsKey(msg.threadId)) {
        filtered[msg.threadId] = [];
      }
      filtered[msg.threadId]!.add(msg);
    }
    List<SmsThread> threads = <SmsThread>[];
    for (var k in filtered.keys) {
      final thread = SmsThread.fromMessages(filtered[k]);
      await thread.findContact();
      threads.add(thread);
    }
    return threads;
  }
}

enum SimCardState {
  Unknown,
  Absent,
  PinRequired,
  PukRequired,
  Locked,
  Ready,
}

/// Represents a device's sim card info
class SimCard {
  int? slot;
  String? imei;
  SimCardState? state;

  SimCard(
      {required int this.slot,
      required String this.imei,
      this.state = SimCardState.Unknown});

  SimCard.fromJson(Map map) {
    if (map.containsKey('slot')) {
      slot = map['slot'];
    }
    if (map.containsKey('imei')) {
      imei = map['imei'];
    }
    if (map.containsKey('state')) {
      switch (map['state']) {
        case 0:
          state = SimCardState.Unknown;
          break;
        case 1:
          state = SimCardState.Absent;
          break;
        case 2:
          state = SimCardState.PinRequired;
          break;
        case 3:
          state = SimCardState.PukRequired;
          break;
        case 4:
          state = SimCardState.Locked;
          break;
        case 5:
          state = SimCardState.Ready;
          break;
      }
    }
  }
}

class SmsRemover {
  static const platform = MethodChannel("elyudde.sms.remove.channel");

  Future<bool?> removeSmsById(int id, int threadId) async {
    Map arguments = {};
    arguments['id'] = id;
    arguments['thread_id'] = threadId;
    bool? finalResult;
    try {
      final bool? result = await platform.invokeMethod('removeSms', arguments);
      finalResult = result;
    } catch (e) {
      print(e);
    }

    return finalResult;
  }
}

class SimCardsProvider {
  static SimCardsProvider? _instance;
  final MethodChannel _channel;

  factory SimCardsProvider() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          MethodChannel("plugins.elyudde.com/simCards", JSONMethodCodec());
      _instance = SimCardsProvider._private(methodChannel);
    }
    return _instance!;
  }

  SimCardsProvider._private(this._channel);

  Future<List<SimCard>> getSimCards() async {
    final simCards = <SimCard>[];

    dynamic response = await _channel.invokeMethod('getSimCards', null);
    for (Map map in response) {
      simCards.add(SimCard.fromJson(map));
    }

    return simCards;
  }
}
