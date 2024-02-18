// ignore_for_file: non_constant_identifier_names

import 'dart:async';
 

class GamePadControllerData {
  String id;
  String name;
  GamePadControllerData({
    required this.id,
    required this.name,
  });
}

// class GamePadControllerEventData {
  // GamePadControllerEventData();
// }

/// What type of input is being pressed.
enum GamePadControllerEventKeyType {
  /// Analog inputs have a range of possible values depending on how far/hard
  /// they are pressed.
  ///
  /// They represent analog sticks, back triggers, some kinds of d-pads, etc.
  analog,

  /// Buttons have only two states, pressed (1.0) or not (0.0).
  ///
  /// They represent the face buttons, system buttons, and back bumpers, etc.
  button,
}

/// Represents a single "input" listened from a gamepad, i.e. a particular
/// change on the state of the buttons and keys.
///
/// For [KeyType.button], it means a button was either pressed (1.0) or
/// released (0.0).
/// For [KeyType.analog], it means the exact value associated with that key
/// was changed.
class GamePadControllerEventData {
  /// The id of the gamepad controller that fired the event.
  final String gamepadId;

  /// The timestamp in which the event was fired, in milliseconds since epoch.
  final int timestamp;

  /// The [KeyType] of the key that was triggered.
  final GamePadControllerEventKeyType type;

  /// A platform-dependant identifier for the key that was triggered.
  final String key;

  /// The current value of the key.
  final double value;

  GamePadControllerEventData({
    required this.gamepadId,
    required this.timestamp,
    required this.type,
    required this.key,
    required this.value,
  });

  @override
  String toString() {
    return '[$gamepadId] $key: $value';
  }

  factory GamePadControllerEventData.parse(Map<dynamic, dynamic> map) {
    final gamepadId = map['gamepadId'] as String;
    final timestamp = map['time'] as int;
    final type = GamePadControllerEventKeyType.values.byName(map['type'] as String);
    final key = map['key'] as String;
    final value = map['value'] as double;

    return GamePadControllerEventData(
      gamepadId: gamepadId,
      timestamp: timestamp,
      type: type,
      key: key,
      value: value,
    );
  }


  factory GamePadControllerEventData.empty() { 

    return GamePadControllerEventData(
      gamepadId: "",
      timestamp: DateTime.now().millisecondsSinceEpoch,
      type: GamePadControllerEventKeyType.analog,
      key: "",
      value: 0,
    );
  }
}


class GeneralLibraryGamePadBase {
  GeneralLibraryGamePadBase();

  Future<List<GamePadControllerData>> list() async {
    return [];
  }

  Stream<GamePadControllerEventData> get events async* {
    yield GamePadControllerEventData.empty();
  }
}
