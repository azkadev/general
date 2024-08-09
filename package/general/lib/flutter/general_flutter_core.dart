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

import 'package:flutter/foundation.dart';
import "package:general/core/core.dart";
import 'package:general/flutter/app/app.dart';
import 'package:general/flutter/app_background/app_background_core.dart';
import 'package:general/flutter/battery/battery.dart';
import 'package:general/flutter/camera/camera.dart';
import 'package:general/flutter/device/device.dart';
import 'package:general/flutter/gamepad/gamepad_core.dart';
import 'package:general/flutter/local_auth/local_auth.dart';
// import 'package:general/flutter/location/location.dart';
import 'package:general/flutter/notification/notification_core.dart';
import 'package:general/flutter/permission/permission.dart';
import 'package:general/flutter/sim_card/sim_card_core.dart';
import 'package:general/flutter/sms/sms.dart';
import 'package:general/flutter/speech_to_text/speech_to_text.dart';
import 'package:general/flutter/text_to_speech/text_to_speech_core.dart';

/// GeneralFlutter
class GeneralFlutter extends GeneralLibrary {
  GeneralFlutter({
    super.is_use_static,
  });

  @override
  bool isUseStatic({required bool? isStatic}) {
    return super.is_use_static;
  }

  // @override
  // // TODO: implement is_use_static
  // bool get is_use_static => super.is_use_static;

  @override
  void test() {
    if (kDebugMode) {
      print("test flutter");
    }
  }

  static GeneralLibraryAppBaseFlutter app_static =
      GeneralLibraryAppBaseFlutter();

  @override
  GeneralLibraryAppBaseFlutter app({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return app_static;
    }
    return GeneralLibraryAppBaseFlutter();
  }

  static GeneralLibraryAppBackgroundBaseFlutter app_background_static =
      GeneralLibraryAppBackgroundBaseFlutter();

  @override
  GeneralLibraryAppBackgroundBaseFlutter app_background({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return app_background_static;
    }
    return GeneralLibraryAppBackgroundBaseFlutter();
  }

  static GeneralLibraryCameraBaseFlutter camera_static =
      GeneralLibraryCameraBaseFlutter();

  @override
  GeneralLibraryCameraBaseFlutter camera({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return camera_static;
    }
    return GeneralLibraryCameraBaseFlutter();
  }

  static GeneralLibraryPermissionBaseFlutter permission_static =
      GeneralLibraryPermissionBaseFlutter();

  @override
  GeneralLibraryPermissionBaseFlutter permission({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return permission_static;
    }
    return GeneralLibraryPermissionBaseFlutter();
  }

  static GeneralLibraryNotificationBaseFlutter notification_static =
      GeneralLibraryNotificationBaseFlutter();

  @override
  GeneralLibraryNotificationBaseFlutter notification({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return notification_static;
    }

    return GeneralLibraryNotificationBaseFlutter();
  }

  static GeneralLibraryBatteryBaseFlutter battery_static =
      GeneralLibraryBatteryBaseFlutter();

  @override
  GeneralLibraryBatteryBaseFlutter battery({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return battery_static;
    }
    return GeneralLibraryBatteryBaseFlutter();
  }

  static GeneralLibraryTextToSpeechBaseFlutter text_to_speech_static =
      GeneralLibraryTextToSpeechBaseFlutter();

  @override
  GeneralLibraryTextToSpeechBaseFlutter text_to_speech({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return text_to_speech_static;
    }
    return GeneralLibraryTextToSpeechBaseFlutter();
  }

  static GeneralLibraryDeviceBaseFlutter device_static =
      GeneralLibraryDeviceBaseFlutter();

  @override
  GeneralLibraryDeviceBaseFlutter device({
    bool? isStatic,
  }) {
    if (isUseStatic(isStatic: isStatic)) {
      return device_static;
    }

    return GeneralLibraryDeviceBaseFlutter();
  }

  static GeneralLibraryGamePadBaseFlutter gamepad_static =
      GeneralLibraryGamePadBaseFlutter();

  @override
  GeneralLibraryGamePadBaseFlutter gamepad({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return gamepad_static;
    }
    return GeneralLibraryGamePadBaseFlutter();
  }

  static GeneralLibrarySpeechToTextBaseFlutter speech_to_text_static =
      GeneralLibrarySpeechToTextBaseFlutter();

  @override
  GeneralLibrarySpeechToTextBaseFlutter speech_to_text({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return speech_to_text_static;
    }
    return GeneralLibrarySpeechToTextBaseFlutter();
  }

  static GeneralLibrarySimCardBaseFlutter sim_card_static =
      GeneralLibrarySimCardBaseFlutter();

  @override
  GeneralLibrarySimCardBaseFlutter sim_card({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return sim_card_static;
    }
    return GeneralLibrarySimCardBaseFlutter();
  }

  static GeneralLibrarySmsBaseFlutter sms_static =
      GeneralLibrarySmsBaseFlutter();
  @override
  GeneralLibrarySmsBaseFlutter sms({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return sms_static;
    }
    return GeneralLibrarySmsBaseFlutter();
  }

  static GeneralLibraryLocalAuthBaseFlutter local_auth_static =
      GeneralLibraryLocalAuthBaseFlutter();

  @override
  GeneralLibraryLocalAuthBaseFlutter local_auth({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return local_auth_static;
    }
    return GeneralLibraryLocalAuthBaseFlutter();
  }

  // @override
  // GeneralLibraryLocationBaseFlutter  location {
  //   return GeneralLibraryLocationBaseFlutter();
  // }

  static GeneralLibraryPlayerBase player_static = GeneralLibraryPlayerBase();

  @override
  GeneralLibraryPlayerBase player({bool? isStatic}) {
    if (isUseStatic(isStatic: isStatic)) {
      return player_static;
    }

    return GeneralLibraryPlayerBase();
  }
}
