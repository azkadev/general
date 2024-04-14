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

// import 'dart:html';

import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery.dart';
import 'package:general/device/device.dart';
import 'package:general/general.dart';
import 'package:general/notification/notification_core.dart';

class GeneralLibraryBase {
  GeneralLibraryBase();

  GeneralLibraryAppBase get app {
    return GeneralLibraryAppBase();
  }

  GeneralLibraryAppBackgroundBase get app_background {
    return GeneralLibraryAppBackgroundBase();
  }

  GeneralLibraryBatteryBase get battery {
    return GeneralLibraryBatteryBase();
  }

  GeneralLibraryPermissionBase get permission {
    return GeneralLibraryPermissionBase();
  }

  GeneralLibraryNotificationBase get notification {
    return GeneralLibraryNotificationBase();
  }

  GeneralLibraryGamePadBase get gamepad {
    return GeneralLibraryGamePadBase();
  }

  GeneralLibraryTextToSpeechBase get text_to_speech {
    return GeneralLibraryTextToSpeechBase();
  }

  GeneralLibraryDeviceBase get device {
    return GeneralLibraryDeviceBase();
  }

  GeneralLibrarySpeechToTextBase get speech_to_text {
    return GeneralLibrarySpeechToTextBase();
  }

  GeneralLibrarySimCardBase get sim_card {
    return GeneralLibrarySimCardBase();
  }

  GeneralLibrarySmsBase get sms {
    return GeneralLibrarySmsBase();
  }

  GeneralLibraryPlayerBase get player {
    return GeneralLibraryPlayerBase();
  }

  // GeneralLibraryLocationBase get location {
  //   return GeneralLibraryLocationBase();
  // }

  GeneralLibraryLocalAuthBase get local_auth {
    return GeneralLibraryLocalAuthBase();
  }

  void test() {
    print("oke");
  }
}
