import 'dart:io';

import 'package:desktop_notifications/desktop_notifications.dart';

void main(List<String> args) async {
  var client = NotificationsClient();
  await client.notify(
    'Hello World!',
    appName: Platform.executable,
    appIcon: "/home/galaxeus/Documents/fork/general/package/general_dart/code-snapshot.png",
  );
  await client.close();
}
