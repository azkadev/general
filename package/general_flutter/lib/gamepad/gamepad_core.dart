/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!


<!-- END LICENSE --> */
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
