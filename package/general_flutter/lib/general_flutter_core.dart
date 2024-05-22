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

import 'package:flutter/foundation.dart';
import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery_core.dart';
import "package:general_dart/general_dart.dart";
import 'package:general_flutter/app/app.dart';
import 'package:general_flutter/app_background/app_background_core.dart';
import 'package:general_flutter/camera/camera.dart';
import 'package:general_flutter/device/device.dart';
import 'package:general_flutter/local_auth/local_auth.dart';
// import 'package:general_flutter/location/location.dart';
import 'package:general_flutter/notification/notification_core.dart';
import 'package:general_flutter/permission/permission.dart';
import 'package:general_flutter/sim_card/sim_card_core.dart';
import 'package:general_flutter/sms/sms.dart';
import 'package:general_flutter/speech_to_text/speech_to_text.dart';
import 'package:general_flutter/text_to_speech/text_to_speech_core.dart';

/// GeneralFlutter
class GeneralFlutter extends GeneralDart {
  GeneralFlutter();

  @override
  void test() {
    if (kDebugMode) {
      print("test flutter");
    }
  }

  
  
  @override
  GeneralLibraryAppBackgroundBase get app_background {
    return GeneralLibraryAppBackgroundBaseFlutter();
  }
  @override
  GeneralLibraryCameraBaseFlutter get camera {
    return GeneralLibraryCameraBaseFlutter();
  }


  @override
  GeneralLibraryPermissionBaseFlutter get permission {
    return GeneralLibraryPermissionBaseFlutter();
  }

  @override
  GeneralLibraryNotificationBaseFlutter get notification {
    return GeneralLibraryNotificationBaseFlutter();
  }

  @override
  GeneralLibraryBatteryBase get battery {
    return GeneralLibraryBatteryBase();
  }

  @override
  GeneralLibraryTextToSpeechBaseFlutter get text_to_speech {
    return GeneralLibraryTextToSpeechBaseFlutter();
  }

  @override
  GeneralLibraryDeviceBaseFlutter get device {
    return GeneralLibraryDeviceBaseFlutter();
  }

  @override
  GeneralLibraryGamePadBase get gamepad {
    return GeneralLibraryGamePadBase();
  }

  @override
  GeneralLibrarySpeechToTextBaseFlutter get speech_to_text {
    return GeneralLibrarySpeechToTextBaseFlutter();
  }

  @override
  GeneralLibrarySimCardBaseFlutter get sim_card {
    return GeneralLibrarySimCardBaseFlutter();
  }

  @override
  GeneralLibrarySmsBaseFlutter get sms {
    return GeneralLibrarySmsBaseFlutter();
  }

  @override
  GeneralLibraryAppBaseFlutter get app {
    return GeneralLibraryAppBaseFlutter();
  }

  @override
  
  GeneralLibraryLocalAuthBaseFlutter get local_auth {
    return GeneralLibraryLocalAuthBaseFlutter();
  }

  // @override 
  // GeneralLibraryLocationBaseFlutter get location {
  //   return GeneralLibraryLocationBaseFlutter();
  // }

  @override
  GeneralLibraryPlayerBaseDart get player {
    return GeneralLibraryPlayerBaseDart();
  }
}
