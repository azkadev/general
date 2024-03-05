// ignore_for_file: empty_catches, non_constant_identifier_names

import 'package:flutter_background/flutter_background.dart';
import 'package:general/app_background/app_background_core.dart';
import "package:general_lib/general_lib.dart";

class GeneralLibraryAppBackgroundBaseFlutter implements GeneralLibraryAppBackgroundBase {
  @override
  Future<bool> get disable_background async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      return await FlutterBackground.disableBackgroundExecution();
    }

    return false;
  }

  @override
  Future<bool> get enable_background async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      
      return await FlutterBackground.enableBackgroundExecution();
    }

    return false;
  }

  @override
  Future<bool> get has_permissions async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      return await FlutterBackground.hasPermissions;
    }

    return false;
  }

  @override
  bool get is_background {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      return FlutterBackground.isBackgroundExecutionEnabled;
    }

    return false;
  }

  @override
  Future<bool> initialize({
    required String notificationTitle,
    required String notificationMessage,
  }) async {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isAndroid) {
      return await FlutterBackground.initialize(
        androidConfig: FlutterBackgroundAndroidConfig(
          notificationTitle: notificationTitle,
          notificationText: notificationMessage,
        ),
      );
    }

    return false;
  }
}
