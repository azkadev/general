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
// ignore_for_file: non_constant_identifier_names, empty_catches

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:general/app/app.dart';
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

  @override
  Future<void> setFullScreen(bool isFullScreen) async {
    await static_setFullScreen(isFullScreen);
  }

  static Future<void> static_setFullScreen(bool isFullScreen) async {
    if (isFullScreen) {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    } else {
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    }
  }

  @override
  Future<void> setPreferredOrientations({
    required List<GeneralLibraryAppDeviceOrientationType> orientations,
  }) async {
    static_setPreferredOrientations(orientations: orientations);
  }
  static Future<void> static_setPreferredOrientations({
    required List<GeneralLibraryAppDeviceOrientationType> orientations,
  }) async {
    static_flutter_setPreferredOrientations(orientations: orientations.toFlutter());
  }

  static Future<void> static_flutter_setPreferredOrientations({
    required List<DeviceOrientation> orientations,
  }) async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

}

extension ExtensionListGeneralAppDeviceOriendaion on List<GeneralLibraryAppDeviceOrientationType> {
  List<DeviceOrientation> toFlutter() {
    return map((e) => DeviceOrientation.values.singleWhere((element) => element.name == e.name)).whereType<DeviceOrientation>().toList();
  }
}
