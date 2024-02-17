// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:general/app_background/app_background_core.dart';
import "package:general_dart/general_dart.dart";
import 'package:general_flutter/app_background/app_background_core.dart';
import 'package:general_flutter/permission/permission.dart';
// import 'package:general_flutter/battery/battery_core.dart';

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
  
  GeneralLibraryPermissionBaseFlutter get permission {
    return GeneralLibraryPermissionBaseFlutter();
  }

  // @override
  // GeneralLibraryBatteryBaseFlutter get battery {
  //   return GeneralLibraryBatteryBaseFlutter();
  // }
}
