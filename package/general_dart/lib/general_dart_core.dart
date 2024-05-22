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

import 'package:general/app/app.dart';

import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery_core.dart';
import 'package:general/camera/camera_core.dart';
import 'package:general/device/device_core.dart';
import 'package:general/gamepad/gamepad_core.dart';
import 'package:general/general_core.dart';
import 'package:general/local_auth/local_auth_core.dart';
// import 'package:general/location/location_core.dart';
import 'package:general/notification/notification_core.dart';
import 'package:general/pemission/pemission_core.dart';

import 'package:general/sim_card/sim_card_core.dart';
import 'package:general/sms/sms_core.dart';
import 'package:general/speech_to_text/speech_to_text_core.dart';
import 'package:general/text_to_speech/text_to_speech_core.dart';
import 'package:general_dart/player/player_core.dart';

class GeneralDart implements GeneralLibraryBase {
  GeneralDart();

  @override
  void test() {
    print("Test Dart");
  }

  @override
  GeneralLibraryBatteryBase get battery {
    return GeneralLibraryBatteryBase();
  }

  @override
  GeneralLibraryAppBackgroundBase get app_background {
    return GeneralLibraryAppBackgroundBase();
  }

  @override
  GeneralLibraryPermissionBase get permission {
    return GeneralLibraryPermissionBase();
  }

  @override
  GeneralLibraryNotificationBase get notification {
    return GeneralLibraryNotificationBase();
  }

  @override
  GeneralLibraryGamePadBase get gamepad {
    return GeneralLibraryGamePadBase();
  }

  @override
  GeneralLibraryTextToSpeechBase get text_to_speech {
    return GeneralLibraryTextToSpeechBase();
  }

  @override
  GeneralLibrarySpeechToTextBase get speech_to_text {
    return GeneralLibrarySpeechToTextBase();
  }

  @override
  GeneralLibraryDeviceBase get device {
    return GeneralLibraryDeviceBase();
  }

  @override
  GeneralLibrarySimCardBase get sim_card {
    return GeneralLibrarySimCardBase();
  }

  @override
  GeneralLibrarySmsBase get sms {
    return GeneralLibrarySmsBase();
  }

  @override
  GeneralLibraryAppBase get app {
    return GeneralLibraryAppBase();
  }

  @override
  GeneralLibraryPlayerBaseDart get player {
    return GeneralLibraryPlayerBaseDart();
  }

  @override 
  GeneralLibraryLocalAuthBase get local_auth {
    return GeneralLibraryLocalAuthBase();
  }

  @override 
  GeneralLibraryCameraBase get camera => GeneralLibraryCameraBase();
 
}
