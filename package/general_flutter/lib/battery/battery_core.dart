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
// // ignore_for_file: empty_catches, non_constant_identifier_names

// import 'dart:async';

// import 'package:general/battery/battery.dart';
// import 'package:battery_plus/battery_plus.dart';
// import 'package:general/battery/battery_status.dart';

// class GeneralLibraryBatteryBaseFlutter implements GeneralLibraryBatteryBase {
//   Battery battery = Battery();

//   @override
//   Future<int> get level async {
//     return (await battery.batteryLevel);
//   }

//   @override
//   Future<BatteryStatusType> get status_type async {
//     try {
//       BatteryState batteryState = await battery.batteryState;

//       if (batteryState == BatteryState.charging) {
//         return BatteryStatusType.charging;
//       }

//       if (batteryState == BatteryState.connectedNotCharging) {
//         return BatteryStatusType.connectedNotCharging;
//       }

//       if (batteryState == BatteryState.discharging) {
//         return BatteryStatusType.discharging;
//       }
//       if (batteryState == BatteryState.full) {
//         return BatteryStatusType.full;
//       }
//     } catch (e) {}

//     return BatteryStatusType.unknown;
//   }

//   @override
//   Stream<BatteryStatusType> get status_realtime async* {
//     StreamController<BatteryStatusType> streamController = StreamController<BatteryStatusType>();
//     // status_realtime.listen((event) {
//     //   streamController.add(event);
//     // });
//     yield* streamController.stream;
//     // BatteryStatusType batteryStatusType = (await status_type);
//     // yield batteryStatusType;
//     // // Stream.periodic(period);
//     // // battery.onBatteryStateChanged;

//     // // yield* Stream.periodic(Duration(microseconds: 1), (int id) {
//     // //   return batteryStatusType;
//     // // });
//     // // // while (true) {
//     // // //   await Future.delayed(Duration(milliseconds: 1));
//     // // //   BatteryStatusType battery_status_type = await statusType;
//     // // //   if (batteryStatusType != battery_status_type) {
//     // // //     batteryStatusType = battery_status_type;

//     // // //     yield batteryStatusType;
//     // // //   }
//     // // // }
//   }

//   @override
//   Future<bool> get is_save_mode async {
//     return await battery.isInBatterySaveMode;
//   }
// }
