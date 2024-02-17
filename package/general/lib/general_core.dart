// ignore_for_file: non_constant_identifier_names

// import 'dart:html';

import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery.dart';
import 'package:general/notification/notification_core.dart';
import 'package:general/pemission/pemission.dart';

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

  void test() {
    print("oke");
  }
}
