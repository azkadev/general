// ignore_for_file: non_constant_identifier_names

import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery_core.dart';
import 'package:general/general_core.dart';
import 'package:general/notification/notification_core.dart';
import 'package:general/pemission/pemission_core.dart';

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
  // TODO: implement notification
  GeneralLibraryNotificationBase get notification {
    return GeneralLibraryNotificationBase();
  }
}
