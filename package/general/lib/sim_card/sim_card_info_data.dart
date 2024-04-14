/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

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
