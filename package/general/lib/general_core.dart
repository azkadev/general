// ignore_for_file: non_constant_identifier_names

import 'package:general/app_background/app_background_core.dart';
import 'package:general/battery/battery.dart';

class GeneralLibraryBase {
  GeneralLibraryBase();

  GeneralLibraryAppBackgroundBase get app_background {
    return GeneralLibraryAppBackgroundBase();
  }

  GeneralLibraryBatteryBase get battery {
    return GeneralLibraryBatteryBase();
  }

  void test() {
    print("oke");
  }
}
