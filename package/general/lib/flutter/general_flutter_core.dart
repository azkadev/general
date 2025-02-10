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

import "package:general/core/core.dart";
import 'package:general/flutter/app/app.dart';
import 'package:general/flutter/app_background/app_background_core.dart';
import 'package:general/flutter/battery/battery.dart';
import 'package:general/flutter/camera/camera.dart';
import 'package:general/flutter/device/device.dart';
import 'package:general/flutter/gamepad/gamepad_core.dart';
import 'package:general/flutter/local_auth/local_auth.dart';
import 'package:general/flutter/notification/notification_core.dart';
import 'package:general/flutter/permission/permission.dart';
import 'package:general/flutter/sim_card/sim_card_core.dart';
import 'package:general/flutter/sms/sms.dart';
import 'package:general/flutter/speech_to_text/speech_to_text.dart';
import 'package:general/flutter/text_to_speech/text_to_speech_core.dart';

/// GeneralFlutter
class GeneralFlutter extends GeneralLibrary {
  /// UncompleteDocumentation
  const GeneralFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryLocalAuthBaseFlutter localAuth = GeneralLibraryLocalAuthBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryAppBaseFlutter systemApp = GeneralLibraryAppBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryAppBackgroundBaseFlutter appBackground = GeneralLibraryAppBackgroundBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryCameraBaseFlutter systemCamera = GeneralLibraryCameraBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryPermissionBaseFlutter systemPermission = GeneralLibraryPermissionBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryNotificationBaseFlutter systemNotification = GeneralLibraryNotificationBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryTextToSpeechBaseFlutter textToSpeech = GeneralLibraryTextToSpeechBaseFlutter();

  /// UncompleteDocumentation

  static GeneralLibraryBatteryBaseFlutter systembattery = GeneralLibraryBatteryBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryDeviceBaseFlutter systemDevice = GeneralLibraryDeviceBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibraryGamePadBaseFlutter controllerGamepad = GeneralLibraryGamePadBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibrarySpeechToTextBaseFlutter speechToText = GeneralLibrarySpeechToTextBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibrarySimCardBaseFlutter simCard = GeneralLibrarySimCardBaseFlutter();

  /// UncompleteDocumentation
  static GeneralLibrarySmsBaseFlutter systemSms = GeneralLibrarySmsBaseFlutter();

  @override
  GeneralLibraryAppBackgroundBaseFlutter get app_background => appBackground;

  @override
  GeneralLibraryGamePadBaseFlutter get controller_gamepad => controllerGamepad;

  @override
  GeneralLibraryLocalAuthBaseFlutter get local_auth => localAuth;

  // @override
  // GeneralLibraryPlayerBase get media_player => super.media_player;

  @override
  GeneralLibrarySimCardBaseFlutter get sim_card => simCard;

  @override
  // TODO: implement speech_to_text
  GeneralLibrarySpeechToTextBaseFlutter get speech_to_text => speechToText;

  @override
  GeneralLibraryAppBaseFlutter get system_app => systemApp;

  @override
  GeneralLibraryBatteryBaseFlutter get system_battery => systembattery;

  @override
  GeneralLibraryCameraBaseFlutter get system_camera => systemCamera;

  @override
  // TODO: implement system_device
  GeneralLibraryDeviceBaseFlutter get system_device => systemDevice;

  @override
  // TODO: implement system_notification
  GeneralLibraryNotificationBaseFlutter get system_notification => systemNotification;

  @override
  // TODO: implement system_permission
  GeneralLibraryPermissionBaseFlutter get system_permission => systemPermission;

  @override
  // TODO: implement system_sms
  GeneralLibrarySmsBaseFlutter get system_sms => systemSms;

  @override
  // TODO: implement text_to_speech
  GeneralLibraryTextToSpeechBaseFlutter get text_to_speech => textToSpeech;
}
