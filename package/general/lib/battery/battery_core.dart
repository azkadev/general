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
// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:general/battery/battery_status.dart';

class GeneralLibraryBatteryBase {
  GeneralLibraryBatteryBase();

  Future<bool> get is_save_mode async {
    return false;
  }

  Future<int> get level async {
    return 0;
  }

  Future<BatteryStatusType> get status_type async {
    return BatteryStatusType.unknown;
  }

  Stream<BatteryStatusType> get status_realtime async* {
    // BatteryStatusType battery_status_type = await statusType;
    yield* Stream.fromFuture(status_type);
  }
}
