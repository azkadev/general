// ignore_for_file: non_constant_identifier_names

import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery_core.dart';
import 'package:general/device/device_core.dart';
import 'package:general/gamepad/gamepad_core.dart';
import 'package:general/general_core.dart';
import 'package:general/notification/notification_core.dart';
import 'package:general/pemission/pemission_core.dart';
import 'package:general/speech_to_text/speech_to_text_core.dart';
import 'package:general/text_to_speech/text_to_speech_core.dart';

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
}
