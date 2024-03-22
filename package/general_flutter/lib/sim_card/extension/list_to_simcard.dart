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


<!-- END LICENSE --> */
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
