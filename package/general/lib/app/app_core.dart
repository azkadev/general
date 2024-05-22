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

import 'dart:typed_data';

import 'package:general/app/app_model.dart';

class GeneralLibraryAppBase {
  GeneralLibraryAppBase();


  Future<void> wake_lock_is_enabled() async {
    // await WakelockPlus.enabled;
  }

   Future<void> wake_lock_toggle({
    required bool enable,
  }) async {
    // await WakelockPlus.toggle(enable: enable);
  }

   Future<void> wake_lock_disable() async {
    // await WakelockPlus.disable();
  }

   Future<void> wake_lock_enable() async {
    // await WakelockPlus.enable();
  }


  void showSnackBar({
    required String message,
  }) {}

  Future<Uint8List?> screenshot_current_widget() async {
    return null;
  }

  Future<void> setFullScreen(bool isFullScreen) async {
    return;
  }

  static Future<void> static_setFullScreen(bool isFullScreen) async {}

  Future<void> setPreferredOrientations({
    required List<GeneralLibraryAppDeviceOrientationType> orientations,
  }) async {
    static_setPreferredOrientations(orientations: orientations);
  }

  static Future<void> static_setPreferredOrientations({
    required List<GeneralLibraryAppDeviceOrientationType> orientations,
  }) async {}
}
