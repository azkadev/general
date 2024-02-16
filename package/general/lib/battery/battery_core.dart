// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:general/battery/battery_status.dart';

class GeneralLibraryBatteryBase {
  GeneralLibraryBatteryBase();

  Future<bool> get is_save_mode async {
    return false;
  }
  Future<int> get level async {
    return 0;
  }

  Future<BatteryStatusType> get status_type async {
    return BatteryStatusType.unknown;
  }

  Stream<BatteryStatusType> get status_realtime async* {
    // BatteryStatusType battery_status_type = await statusType;
    yield* Stream.fromFuture(status_type);
  }
}
