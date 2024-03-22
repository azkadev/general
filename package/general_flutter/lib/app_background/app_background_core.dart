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
// ignore_for_file: empty_catches, non_constant_identifier_names

import 'package:flutter_background/flutter_background.dart';
import 'package:general/app_background/app_background_core.dart';
import "package:general_lib/general_lib.dart";

class GeneralLibraryAppBackgroundBaseFlutter implements GeneralLibraryAppBackgroundBase {
  @override
  Future<bool> get disable_background async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      return await FlutterBackground.disableBackgroundExecution();
    }

    return false;
  }

  @override
  Future<bool> get enable_background async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      
      return await FlutterBackground.enableBackgroundExecution();
    }

    return false;
  }

  @override
  Future<bool> get has_permissions async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      return await FlutterBackground.hasPermissions;
    }

    return false;
  }

  @override
  bool get is_background {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      return FlutterBackground.isBackgroundExecutionEnabled;
    }

    return false;
  }

  @override
  Future<bool> initialize({
    required String notificationTitle,
    required String notificationMessage,
  }) async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      return await FlutterBackground.initialize(
        androidConfig: FlutterBackgroundAndroidConfig(
          notificationTitle: notificationTitle,
          notificationText: notificationMessage,
        ),
      );
    }

    return false;
  }
}
