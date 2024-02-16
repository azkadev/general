import 'package:flutter/foundation.dart';
import "package:general_dart/general_dart.dart";
import 'package:general_flutter/battery/battery_core.dart';

class GeneralFlutter extends GeneralDart {
  GeneralFlutter();

  @override
  void test() {
    if (kDebugMode) {
      print("test flutter");
    }
  }

  @override
  GeneralLibraryBatteryBaseFlutter get battery {
    return GeneralLibraryBatteryBaseFlutter();
  }

}
