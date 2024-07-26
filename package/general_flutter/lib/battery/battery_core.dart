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
// ignore_for_file: empty_catches, non_constant_identifier_names

import 'dart:async';

import 'package:battery_plus/battery_plus.dart';
import 'package:general/battery/battery.dart';
import 'package:general/battery/battery_status.dart';

class GeneralLibraryBatteryBaseFlutter implements GeneralLibraryBatteryBase {
  Battery battery = Battery();

  @override
  Future<int> get level async {
    return (await battery.batteryLevel);
  }

  @override
  Future<BatteryStatusType> get status_type async {
    try {
      BatteryState batteryState = await battery.batteryState;

      return autoChangeBatteryStatus(batteryState: batteryState);
    } catch (e) {}

    return BatteryStatusType.unknown;
  }

  BatteryStatusType autoChangeBatteryStatus({required BatteryState batteryState}) {
    try {
      if (batteryState == BatteryState.charging) {
        return BatteryStatusType.charging;
      }

      if (batteryState == BatteryState.connectedNotCharging) {
        return BatteryStatusType.connectedNotCharging;
      }

      if (batteryState == BatteryState.discharging) {
        return BatteryStatusType.discharging;
      }
      if (batteryState == BatteryState.full) {
        return BatteryStatusType.full;
      }
    } catch (e) {}

    return BatteryStatusType.unknown;
  }

  @override
  Stream<BatteryStatusType> get status_realtime async* {
    try {
      await for (BatteryState batteryState in battery.onBatteryStateChanged) {
        yield autoChangeBatteryStatus(batteryState: batteryState);
      }
    } catch (e) {}
  }

  @override
  Future<bool> get is_save_mode async {
    return await battery.isInBatterySaveMode;
  }
}
