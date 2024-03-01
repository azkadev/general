// ignore_for_file: non_constant_identifier_names

// import 'dart:html';

import 'package:general/app/sim_card.dart';
import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery.dart';
import 'package:general/device/device.dart';
import 'package:general/gamepad/gamepad_core.dart';
import 'package:general/general.dart';
import 'package:general/notification/notification_core.dart';
import 'package:general/pemission/pemission.dart';
import 'package:general/player/player_core.dart';
import 'package:general/sim_card/sim_card_core.dart';
import 'package:general/sms/sms.dart';
import 'package:general/speech_to_text/speech_to_text_core.dart';
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

  GeneralLibraryAppBase get app {
    return GeneralLibraryAppBase();
  }

  GeneralLibraryPlayerBase get player {
    return GeneralLibraryPlayerBase();
  }


  GeneralLibraryLocationBase get location {
    return GeneralLibraryLocationBase();
  }

  GeneralLibraryLocalAuthBase get local_auth {
    return GeneralLibraryLocalAuthBase();
  }



  void test() {
    print("oke");
  }
}
