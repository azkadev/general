import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/services.dart';

/// Class that represents the photo of a [Contact]
class Photo {
  final Uri _uri;
  final bool _isFullSize;
  Uint8List? _bytes;

  /// Gets the bytes of the photo.
  Uint8List? get bytes => _bytes;

  Photo(this._uri, {bool isFullSize = false}) : _isFullSize = isFullSize;

  /// Read async the bytes of the photo.
  Future<Uint8List?> _readBytes() async {
    if (_bytes == null) {
      var photoQuery = ContactPhotoQuery();
      _bytes = await photoQuery.queryContactPhoto(_uri, fullSize: _isFullSize);
    }
    return _bytes;
  }
}

/// A contact's photo query
class ContactPhotoQuery {
  static ContactPhotoQuery? _instance;
  final MethodChannel _channel;

  factory ContactPhotoQuery() {
    if (_instance == null) {
      const MethodChannel methodChannel = MethodChannel(
          "plugins.elyudde.com/queryContactPhoto", StandardMethodCodec());
      _instance = ContactPhotoQuery._private(methodChannel);
    }
    return _instance!;
  }

  ContactPhotoQuery._private(this._channel);

  /// Get the bytes of the photo specified by [uri].
  /// To get the full size of contact's photo the optional
  /// parameter [fullSize] must be set to true. By default
  /// the returned photo is the thumbnail representation of
  /// the contact's photo.
  Future<Uint8List?> queryContactPhoto(Uri uri, {bool fullSize = false}) async {
    return await _channel.invokeMethod(
        "getContactPhoto", {"photoUri": uri.path, "fullSize": fullSize});
  }
}

/// A contact of yours
class Contact {
  String? _fullName;
  String? _firstName;
  String? _lastName;
  String? _address;
  Photo? _thumbnail;
  Photo? _photo;

  Contact(String address,
      {String? firstName,
      String? lastName,
      String? fullName,
      Photo? thumbnail,
      Photo? photo}) {
    _address = address;
    _firstName = firstName;
    _lastName = lastName;
    if (fullName == null) {
      _fullName = _firstName! + " " + _lastName!;
    } else {
      _fullName = fullName;
    }
    _thumbnail = thumbnail;
    _photo = photo;
  }

  Contact.fromJson(String address, Map? data) {
    _address = address;
    if (data == null) return;
    if (data.containsKey("first")) {
      _firstName = data["first"];
    }
    if (data.containsKey("last")) {
      _lastName = data["last"];
    }
    if (data.containsKey("name")) {
      _fullName = data["name"];
    }
    if (data.containsKey("photo")) {
      _photo = Photo(Uri.parse(data["photo"]), isFullSize: true);
    }
    if (data.containsKey("thumbnail")) {
      _thumbnail = Photo(Uri.parse(data["thumbnail"]));
    }
  }

  /// Gets the full name of the [Contact]
  String? get fullName => _fullName;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  /// Gets the address of the [Contact] (the phone number)
  String? get address => _address;

  /// Gets the full size photo of the [Contact] if any, otherwise returns null.
  Photo? get photo => _photo;

  /// Gets the thumbnail representation of the [Contact] photo if any,
  /// otherwise returns null.
  Photo? get thumbnail => _thumbnail;
}

/// Called when sending SMS failed
typedef ContactHandlerFail = void Function(Object e);

/// A contact query
class ContactQuery {
  static ContactQuery? _instance;
  final MethodChannel _channel;
  static Map<String, Contact> queried = {};
  static Map<String, bool> inProgress = {};

  factory ContactQuery() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          MethodChannel("plugins.elyudde.com/queryContact", JSONMethodCodec());
      _instance = ContactQuery._private(methodChannel);
    }
    return _instance!;
  }

  ContactQuery._private(this._channel);

  Future<Contact?> queryContact(String? address) async {
    if (address == null) {
      throw ("address is null");
    }
    if (queried.containsKey(address) && queried[address] != null) {
      return queried[address];
    }
    if (inProgress.containsKey(address) && inProgress[address] == true) {
      throw ("already requested");
    }
    inProgress[address] = true;
    return await _channel.invokeMethod("getContact", {"address": address}).then(
        (dynamic val) async {
      Contact contact = Contact.fromJson(address, val);
      if (contact.thumbnail != null) {
        await contact.thumbnail!._readBytes();
      }
      if (contact.photo != null) {
        await contact.photo!._readBytes();
      }
      queried[address] = contact;
      inProgress[address] = false;
      return contact;
    });
  }
}

/// Class that represents the data of the device's owner.
class UserProfile {
  String? _fullName;
  Photo? _photo;
  Photo? _thumbnail;
  List<String>? _addresses;

  UserProfile() : _addresses = <String>[];

  UserProfile._fromJson(Map data) {
    if (data.containsKey("name")) {
      _fullName = data["name"];
    }
    if (data.containsKey("photo")) {
      _photo = Photo(Uri.parse(data["photo"]), isFullSize: true);
    }
    if (data.containsKey("thumbnail")) {
      _thumbnail = Photo(Uri.parse(data["thumbnail"]));
    }
    if (data.containsKey("addresses")) {
      _addresses = List.from(data["addresses"]);
    }
  }

  /// Gets the full name of the [UserProfile]
  String? get fullName => _fullName;

  /// Gets the full size photo of the [UserProfile] if any,
  /// otherwise returns null.
  Photo? get photo => _photo;

  /// Gets the thumbnail representation of the [UserProfile] photo if any,
  /// otherwise returns null.
  Photo? get thumbnail => _thumbnail;

  /// Gets the collection of phone numbers of the [UserProfile]
  List<String>? get addresses => _addresses;
}

/// Used to get the user profile
class UserProfileProvider {
  static UserProfileProvider? _instance;
  final MethodChannel _channel;

  factory UserProfileProvider() {
    if (_instance == null) {
      const MethodChannel methodChannel =
          MethodChannel("plugins.elyudde.com/userProfile", JSONMethodCodec());
      _instance = UserProfileProvider._private(methodChannel);
    }
    return _instance!;
  }

  UserProfileProvider._private(this._channel);

  /// Returns the [UserProfile] data.
  Future<UserProfile> getUserProfile() async {
    return await _channel
        .invokeMethod("getUserProfile")
        .then((dynamic val) async {
      if (val == null) {
        return UserProfile();
      } else {
        var userProfile = UserProfile._fromJson(val);
        if (userProfile.thumbnail != null) {
          await userProfile.thumbnail!._readBytes();
        }
        if (userProfile.photo != null) {
          await userProfile.photo!._readBytes();
        }
        return userProfile;
      }
    });
  }
}
