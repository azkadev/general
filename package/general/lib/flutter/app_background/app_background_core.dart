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
// ignore_for_file: empty_catches, non_constant_identifier_names

import 'package:flutter_background/flutter_background.dart';
import 'package:general/core/app_background/app_background_core.dart';
import "package:general_lib/general_lib.dart";

class GeneralLibraryAppBackgroundBaseFlutter
    implements GeneralLibraryAppBackgroundBase {
  @override
  Future<bool> get disable_background async {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isAndroid) {
      return await FlutterBackground.disableBackgroundExecution();
    }

    return false;
  }

  @override
  Future<bool> get enable_background async {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isAndroid) {
      return await FlutterBackground.enableBackgroundExecution();
    }

    return false;
  }

  @override
  Future<bool> get has_permissions async {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isAndroid) {
      return await FlutterBackground.hasPermissions;
    }

    return false;
  }

  @override
  bool get is_background {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isAndroid) {
      return FlutterBackground.isBackgroundExecutionEnabled;
    }

    return false;
  }

  @override
  Future<bool> initialize({
    required String notificationTitle,
    required String notificationMessage,
  }) async {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isAndroid) {
      return await FlutterBackground.initialize(
        androidConfig: FlutterBackgroundAndroidConfig(
          notificationTitle: notificationTitle,
          notificationText: notificationMessage,
        ),
      );
    }

    return false;
  }

  @override
  bool isSupport() {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isAndroid) {
      return true;
    }
    return false;
  }
}
