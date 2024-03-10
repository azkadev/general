// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

import 'package:general/app/app_model.dart';

class GeneralLibraryAppBase {
  GeneralLibraryAppBase();

  void showSnackBar({
    required String message,
  }) {}

  Future<Uint8List?> screenshot_current_widget() async {
    return null;
  }

  Future<void> setFullScreen(bool isFullScreen) async {
    return ;
  }

  
  static Future<void> static_setFullScreen(bool isFullScreen) async { 
  }

   Future<void> setPreferredOrientations({
    required List<GeneralLibraryAppDeviceOrientationType> orientations,
  }) async {
    static_setPreferredOrientations(orientations: orientations);
  }
  static Future<void> static_setPreferredOrientations({
    required List<GeneralLibraryAppDeviceOrientationType> orientations,
  }) async {
    
  }

}

