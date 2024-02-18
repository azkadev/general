// // ignore_for_file: non_constant_identifier_names

// import 'dart:async';

// import 'package:gamepads/gamepads.dart';
// import 'package:general/gamepad/gamepad_core.dart';
// import 'package:general_lib/general_lib.dart';

// class GeneralLibraryGamePadBaseFlutter implements GeneralLibraryGamePadBase {
//   GeneralLibraryGamePadBaseFlutter();

//   @override
//   Future<List<GamePadControllerData>> list() async {
//     if (dart.isWeb) {
//       return [];
//     }
//     if (dart.isDesktop) {
//       return (await Gamepads.list()).map((e) {
//         return GamePadControllerData(id: e.id, name: e.name);
//       }).toList();
//     }
//     return [];
//   }

//   @override
//   Stream<GamePadControllerEventData> get events async* {
//     if (dart.isWeb) {
//       return;
//     }
//     StreamController<GamePadControllerEventData> streamController = StreamController<GamePadControllerEventData>();
//     if (dart.isDesktop) {
//       Gamepads.events.listen((GamepadEvent event) {
//         GamePadControllerEventKeyType gamePadControllerEventKeyType = GamePadControllerEventKeyType.analog;
//         if (event.type == KeyType.button) {
//           gamePadControllerEventKeyType = GamePadControllerEventKeyType.button;
//         }

//         streamController.add(
//           GamePadControllerEventData(
//             gamepadId: event.gamepadId,
//             timestamp: event.timestamp,
//             type: gamePadControllerEventKeyType,
//             key: event.key,
//             value: event.value,
//           ),
//         );
//       });
//     }

//     yield* streamController.stream;
//   }
// }
