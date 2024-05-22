// ignore_for_file: dead_code

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:general_flutter/camera/camera_core.dart';

import 'package:universal_io/io.dart';
import 'package:camera/camera.dart' as camera_package;

class CameraWidget extends StatefulWidget {
  final GeneralLibraryCameraBaseFlutter generalLibraryCameraBase;
  final Widget Function(BuildContext context) onCameraNotInit;
  final Widget Function(BuildContext context) onCameraNotSelect;
  final Widget Function(BuildContext context) onCameraNotActive;

  final Widget Function(BuildContext context) onPlatformNotSupported;
  const CameraWidget({
    super.key,
    required this.generalLibraryCameraBase,
    required this.onCameraNotInit,
    required this.onCameraNotSelect,
    required this.onCameraNotActive,
    required this.onPlatformNotSupported,
  });

  @override
  State<CameraWidget> createState() => _CameraState();
}

class _CameraState extends State<CameraWidget> {
  @override
  Widget build(BuildContext context) {
    if (!widget.generalLibraryCameraBase.is_camera_init || !widget.generalLibraryCameraBase.is_select_camera || !widget.generalLibraryCameraBase.is_camera_active) {
      if (!widget.generalLibraryCameraBase.is_camera_init) {
        return widget.onCameraNotInit(context);
      }
      if (!widget.generalLibraryCameraBase.is_select_camera) {
        return widget.onCameraNotSelect(context);
      }
      if (!widget.generalLibraryCameraBase.is_camera_active) {
        return widget.onCameraNotActive(context);
      }
      return const CircularProgressIndicator();
    }
    if (Platform.isAndroid || Platform.isIOS || kIsWeb) {
      if (kDebugMode) {
        print("ok");
      }
      return Visibility(
        visible: widget.generalLibraryCameraBase.is_camera_init,
        replacement: const CircularProgressIndicator(),
        child: widget.generalLibraryCameraBase.widget_build_preview(
          onCameraNotInit: () {},
          onCameraNotSelect: () {},
          onCameraNotActive: () {},
        ),
      );
      return Visibility(
        visible: widget.generalLibraryCameraBase.camera_mobile_controller.value.isInitialized,
        replacement: const CircularProgressIndicator(),
        child: camera_package.CameraPreview(
          widget.generalLibraryCameraBase.camera_mobile_controller,
        ),
      );
    }
    if (Platform.isWindows) {
      return Visibility(
        visible: widget.generalLibraryCameraBase.is_camera_init,
        replacement: const CircularProgressIndicator(),
        child: widget.generalLibraryCameraBase.widget_build_preview(
          onCameraNotInit: () {},
          onCameraNotSelect: () {},
          onCameraNotActive: () {},
        ),
      );
    }
    return widget.onPlatformNotSupported(context);
  }
}
