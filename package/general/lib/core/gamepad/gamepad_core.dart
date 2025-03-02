/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:general/core/general_library.dart';

/// UncompleteDocumentation
class GamePadControllerData {
  /// UncompleteDocumentation

  String id;

  /// UncompleteDocumentation
  String name;

  /// UncompleteDocumentation
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

  /// UncompleteDocumentation
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

  /// UncompleteDocumentation
  factory GamePadControllerEventData.parse(Map<dynamic, dynamic> map) {
    final gamepadId = map['gamepadId'] as String;
    final timestamp = map['time'] as int;
    final type =
        GamePadControllerEventKeyType.values.byName(map['type'] as String);
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

  /// UncompleteDocumentation
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

/// UncompleteDocumentation
class GeneralLibraryGamePadBase implements GeneralLibraryCore {
  /// UncompleteDocumentation
  GeneralLibraryGamePadBase();

  /// UncompleteDocumentation
  Future<List<GamePadControllerData>> list() async {
    return [];
  }

  /// UncompleteDocumentation
  Stream<GamePadControllerEventData> get events async* {
    yield GamePadControllerEventData.empty();
  }

  @override
  bool isSupport() {
    // TODO: implement isSupport
    throw UnimplementedError();
  }
}
