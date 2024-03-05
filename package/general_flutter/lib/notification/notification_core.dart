// ignore_for_file: non_constant_identifier_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:general/notification/notification_core.dart';
import 'package:general_lib/general_lib.dart';

class GeneralLibraryNotificationBaseFlutter implements GeneralLibraryNotificationBase {
  GeneralLibraryNotificationBaseFlutter();

  @override
  bool get is_support_awesome_notification {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isMobile) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> initialize({
    required String notificationTitle,
    required String notificationMessage,
    
  }) async {
    if (is_support_awesome_notification) {
      return await AwesomeNotifications().initialize(
        null,
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
        debug: false,
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
      return AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: "basic_channel",
          actionType: ActionType.Default,
          title: title,
          body: text,
        ),
      );
    }
    return false;
  }
}
