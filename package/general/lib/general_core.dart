// ignore_for_file: non_constant_identifier_names

// import 'dart:html';

import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery.dart';
import 'package:general/gamepad/gamepad_core.dart';
import 'package:general/notification/notification_core.dart';
import 'package:general/pemission/pemission.dart';
import 'package:general/text_to_speech/text_to_speech_core.dart';

class GeneralLibraryBase {
  GeneralLibraryBase();

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
  void test() {
    print("oke");
  }
}
