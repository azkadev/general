// ignore_for_file: non_constant_identifier_names, empty_catches

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:general/app/sim_card_core.dart';
import 'package:general_lib_flutter/extension/build_context.dart';

class GeneralLibraryAppBaseFlutter implements GeneralLibraryAppBase {
  static GlobalKey<NavigatorState> flutter_navigator_key = GlobalKey<NavigatorState>();
  static GlobalKey flutter_repaint_boundery_key = GlobalKey();
  
  static Widget repaintBoundaryWidget({
    required Widget child,
  }) {
    return RepaintBoundary(
      key: GeneralLibraryAppBaseFlutter.flutter_repaint_boundery_key,
      child: child,
    );
  }

  @override
  Future<Uint8List?> screenshot_current_widget() async {
    try {
      BuildContext? context = GeneralLibraryAppBaseFlutter.flutter_repaint_boundery_key.currentContext;
      if (context != null) {
        try {
          return await context.toImagePng();
        } catch (e) {}
      }
    } catch (e) {}
    return null;
  }

  @override
  void showSnackBar({
    required String message,
  }) {
    try {
      BuildContext? context = GeneralLibraryAppBaseFlutter.flutter_navigator_key.currentContext;
      if (context != null) {
        context.showSnackBar(message);
      }
    } catch (e) {}
  }
}
