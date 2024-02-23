// ignore_for_file: non_constant_identifier_names


import 'package:general/utils.dart';

class SimCardInfoData {
  /// [carrierName] : The name of the carrier.
  String carrier_name;

  /// - displayName : The display name of the carrier.
  String display_name;

  ///  [slotIndex] : The index of the SIM card slot.
  String slot_index;

  /// - [number] : The phone number associated with the SIM card.
  String number;

  /// - [countryIso] : The ISO country code associated with the SIM card.
  String country_iso;

  /// - [countryPhonePrefix] : The phone prefix for the country of the SIM card.
  String country_phone_prefix;

  SimCardInfoData({
    required this.carrier_name,
    required this.display_name,
    required this.slot_index,
    required this.number,
    required this.country_iso,
    required this.country_phone_prefix,
  });

  Map toJson() {
    return {
      "@type": "simCardInfoData",
      "carrier_name": carrier_name,
      "display_name": display_name,
      "slot_index": slot_index,
      "number": number,
      "country_iso": country_iso,
      "country_phone_prefix": country_phone_prefix,
    };
  }

  @override
  String toString() {
    return GeneralUtils.to_string_pretty(data: toJson());
  }
}
