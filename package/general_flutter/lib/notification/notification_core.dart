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
// ignore_for_file: non_constant_identifier_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:general_lib/general_lib.dart';

import "package:general_dart/notification/notification.dart";

class GeneralLibraryNotificationBaseFlutter
    extends GeneralLibraryNotificationBaseDart {
  GeneralLibraryNotificationBaseFlutter();

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
  Future<bool> initialize({
    String? defaultIcon,
    bool debug = false,
    String? languageCode,
  }) async {
    if (is_support_awesome_notification) {
      return await AwesomeNotifications().initialize(
        defaultIcon,
        [
          NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white,
          ),
        ],
        // Channel groups are only visual and are not required
        channelGroups: [
          NotificationChannelGroup(
            channelGroupKey: 'basic_channel_group',
            channelGroupName: 'Basic group',
          ),
        ],
        debug: debug,
        languageCode: languageCode,
      );
    }
    return false;
  }

  @override
  Future<bool> createSimpleNotification({
    required String title,
    required String text,
  }) async {
    if (is_support_awesome_notification) {
      return await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: "basic_channel",
          actionType: ActionType.Default,
          title: title,
          body: text,
        ),
      );
    }
    if (is_support_desktop_notification) {
      return await super.createSimpleNotification(title: title, text: text);
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
}
