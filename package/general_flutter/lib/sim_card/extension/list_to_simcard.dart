import 'package:general/sim_card/sim_card_info_data.dart';
import 'package:sim_card_info/sim_info.dart';

extension ExtensionOnListSimInfoToExts on SimInfo {
  SimCardInfoData toSimCardInfoData() {
    return SimCardInfoData(
      carrier_name: carrierName,
      display_name: displayName,
      slot_index: slotIndex,
      number: number,
      country_iso: countryIso,
      country_phone_prefix: countryPhonePrefix,
    );
  }
}

extension ExtensionOnListSimInfoToExt on List<SimInfo> {
  List<SimCardInfoData> toSimCardInfoDatas() {
    return map((e) {
      return e.toSimCardInfoData();
    }).toList();
  }
}
