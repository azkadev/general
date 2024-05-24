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

import 'package:general/notification/notification_core.dart';
import 'package:general_lib/general_lib.dart';
import "package:desktop_notifications/desktop_notifications.dart";

class GeneralLibraryNotificationBaseDart implements GeneralLibraryNotificationBase {
  GeneralLibraryNotificationBaseDart();

  @override
  bool get is_support_awesome_notification {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isMobile) {
      return true;
    }
    return false;
  }

  @override
  bool get is_support_desktop_notification {
    if (Dart.isWeb) {
      return false;
    }
    if (Dart.isLinux) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> initialize({
    String? defaultIcon,
    bool debug = false,
    String? languageCode,
  }) async {
    if (is_support_desktop_notification) {}

    return false;
  }

  NotificationsClient notifications_client_desktop = NotificationsClient();

  @override
  Future<bool> createSimpleNotification({
    required String title,
    required String text,
  }) async {
    if (is_support_desktop_notification) {
      await notifications_client_desktop.notify(
        title,
        body: text,
      );

    }
    return false;
  }
}
