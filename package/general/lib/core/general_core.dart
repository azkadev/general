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

// import 'dart:html';

import 'app_background/app_background_core.dart';
import 'battery/battery.dart';
import 'camera/camera.dart';
import 'device/device.dart';
import 'core.dart';
import 'notification/notification_core.dart';

abstract class GeneralLibraryBaseCore {
  dynamic get system_app => throw UnimplementedError();
  dynamic get app_background => throw UnimplementedError();
  dynamic get system_battery => throw UnimplementedError();
  dynamic get system_camera => throw UnimplementedError();
  dynamic get system_permission => throw UnimplementedError();
  dynamic get system_notification => throw UnimplementedError();
  dynamic get controller_gamepad => throw UnimplementedError();
  dynamic get text_to_speech => throw UnimplementedError();
  dynamic get system_device => throw UnimplementedError();
  dynamic get speech_to_text => throw UnimplementedError();
  dynamic get sim_card => throw UnimplementedError();
  dynamic get system_sms => throw UnimplementedError();
  dynamic get media_player => throw UnimplementedError();
  dynamic get local_auth => throw UnimplementedError();
}

class GeneralLibrary implements GeneralLibraryBaseCore {
  const GeneralLibrary();

  static GeneralLibraryAppBase systemApp = GeneralLibraryAppBase();
  static GeneralLibraryAppBackgroundBase appBackground =
      GeneralLibraryAppBackgroundBase();
  static GeneralLibraryBatteryBase systemBattery = GeneralLibraryBatteryBase();
  static GeneralLibraryCameraBase systemCamera = GeneralLibraryCameraBase();
  static final GeneralLibraryNotificationBase systemNotification =
      GeneralLibraryNotificationBase();

  ///
  static final GeneralLibrarySimCardBase simCard = GeneralLibrarySimCardBase();

  ///
  static final GeneralLibraryPlayerBase mediaPlayer =
      GeneralLibraryPlayerBase();

  ///

  ///
  static final GeneralLibraryDeviceBase systemDevice =
      GeneralLibraryDeviceBase();

  static final GeneralLibraryTextToSpeechBase textToSpeech =
      GeneralLibraryTextToSpeechBase();

  ///
  static final GeneralLibraryGamePadBase controllerGamepad =
      GeneralLibraryGamePadBase();

  static GeneralLibraryPermissionBase systemPermission =
      GeneralLibraryPermissionBase();

  ///
  static final GeneralLibrarySpeechToTextBase speechToText =
      GeneralLibrarySpeechToTextBase();

  static final GeneralLibraryLocalAuthBase localAuth =
      GeneralLibraryLocalAuthBase();

  ///
  static final GeneralLibrarySmsBase systemSms = GeneralLibrarySmsBase();

  Future<void> ensureInitialized() async {}

  @override
  GeneralLibraryAppBase get system_app => systemApp;
  @override
  GeneralLibraryAppBackgroundBase get app_background => appBackground;
  @override
  GeneralLibraryBatteryBase get system_battery => systemBattery;
  @override
  GeneralLibraryCameraBase get system_camera => systemCamera;
  @override
  GeneralLibraryPermissionBase get system_permission => systemPermission;
  @override
  GeneralLibraryNotificationBase get system_notification => systemNotification;
  @override
  GeneralLibraryGamePadBase get controller_gamepad => controllerGamepad;
  @override
  GeneralLibraryTextToSpeechBase get text_to_speech => textToSpeech;
  @override
  GeneralLibraryDeviceBase get system_device => systemDevice;
  @override
  GeneralLibrarySpeechToTextBase get speech_to_text => speechToText;
  @override
  GeneralLibrarySimCardBase get sim_card => simCard;
  @override
  GeneralLibrarySmsBase get system_sms => systemSms;
  @override
  GeneralLibraryPlayerBase get media_player => mediaPlayer;
  @override
  GeneralLibraryLocalAuthBase get local_auth => localAuth;

  void test() {
    print("oke");
  }
}
