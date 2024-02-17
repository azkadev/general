// ignore_for_file: non_constant_identifier_names

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:general/notification/notification_core.dart';
import 'package:general_lib/general_lib.dart';

class GeneralLibraryNotificationBaseFlutter implements GeneralLibraryNotificationBase {
  GeneralLibraryNotificationBaseFlutter();

  @override
  // TODO: implement disable_background
  Future<bool> get disable_background => throw UnimplementedError();

  @override
  // TODO: implement enable_background
  Future<bool> get enable_background => throw UnimplementedError();

  @override
  // TODO: implement has_permissions
  Future<bool> get has_permissions {
    return AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 10,
        channelKey: 'basic_channel',
        actionType: ActionType.Default,
        title: 'Hello World!',
        body: 'This is my first notification!',
      ),
    );
  }

  @override
  Future<bool> initialize({required String notificationTitle, required String notificationMessage}) async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isMobile) {
      AwesomeNotifications().initialize(
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
  // TODO: implement is_background
  bool get is_background {
    return false;
  }
}
