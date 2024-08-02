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
// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:flutter/material.dart';
import 'package:general/core/camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_io/io.dart';

import 'package:camera/camera.dart' as camera_package;
import 'package:camera_windows/camera_windows.dart' as camera_package_windows;

class GeneralLibraryCameraBaseFlutter implements GeneralLibraryCameraBase {
  late List<camera_package.CameraDescription> camera_mobile_datas = [];
  late camera_package.CameraController camera_mobile_controller;
  late camera_package_windows.CameraWindows camera_windows;
  int camera_id = 0;

  bool is_camera_init = false;
  bool is_select_camera = false;
  bool is_camera_active = false;

  bool get isDesktop => Platform.isWindows || Platform.isLinux || Platform.isMacOS;
  bool get isMobile => Platform.isAndroid || Platform.isIOS || kIsWeb;

  Future<void> initializeCameras() async {
    if (isMobile) {
      camera_mobile_datas = await camera_package.availableCameras();
      is_camera_init = true;
    }
    if (isDesktop) {
      if (Platform.isWindows) {
        camera_windows = camera_package_windows.CameraWindows();
        camera_mobile_datas = await camera_windows.availableCameras();
        is_camera_init = true;
      }
    }
    return;
  }

  @override
  bool isSupport() {
    if (isMobile) {
      return true;
    }
    if (isDesktop) {
      return Platform.isWindows;
    }
    return false;
  }

  Future<void> initializeCamera({
    required void Function(void Function() callback) setState,
  }) async {
    if (!is_camera_init) {
      return;
    }
    if (isMobile) {
      camera_mobile_controller = camera_package.CameraController(
        camera_mobile_datas.first,
        camera_package.ResolutionPreset.max,
      );
      is_select_camera = true;
      camera_id = camera_mobile_controller.cameraId;
    }

    if (isDesktop) {
      if (Platform.isWindows) {
        camera_id = await camera_windows.createCamera(camera_mobile_datas.first, camera_package.ResolutionPreset.max);
        is_select_camera = true;
        setState(() {});
      }
    }
    return;
  }

  Future<void> initializeCameraById({
    required int camera_id,
    required void Function(void Function() callback) setState,
    required bool Function() mounted,
  }) async {
    if (!is_camera_init) {
      return;
    }
    if (isMobile) {
      for (var i = 0; i < camera_mobile_datas.length; i++) {
        camera_package.CameraDescription camera_mobile_data = camera_mobile_datas[i];
        if (i == (camera_id - 1)) {
          camera_mobile_controller = camera_package.CameraController(
            camera_mobile_data,
            camera_package.ResolutionPreset.max,
          );
          is_select_camera = true;
          await activateCamera(setState: setState, mounted: mounted);
          return;
        }
      }
    }
    if (isDesktop) {
      if (Platform.isWindows) {
        for (var i = 0; i < camera_mobile_datas.length; i++) {
          camera_package.CameraDescription camera_mobile_data = camera_mobile_datas[i];
          if (i == (camera_id - 1)) {
            camera_id = await camera_windows.createCamera(
              camera_mobile_data,
              camera_package.ResolutionPreset.max,
            );
            is_select_camera = true;
            await activateCamera(setState: setState, mounted: mounted);
            return;
          }
        }
      }
    }
    return;
  }

  Future<void> activateCamera({
    required void Function(void Function() callback) setState,
    required bool Function() mounted,
  }) async {
    if (!is_camera_init) {
      return;
    }
    if (!is_select_camera) {
      return;
    }
    if (isMobile) {
      try {
        await camera_mobile_controller.initialize();
        if (!mounted.call()) {
          return;
        }
        is_camera_active = true;

        setState(() {});
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else if (isDesktop) {
      if (Platform.isWindows) {
        await camera_windows.initializeCamera(camera_id);
        is_camera_active = true;
        setState(() {});
      }
    }
  }

  Future<void> dispose() async {
    if (!is_camera_init) {
      return;
    }
    if (!is_select_camera) {
      return;
    }
    if (!is_camera_active) {
      return;
    }
    if (isMobile) {
      await camera_mobile_controller.dispose();
    } else if (isDesktop) {
      if (Platform.isWindows) {
        await camera_windows.dispose(camera_id);
      }
    }
  }

  Widget widget_build_preview({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) {
    if (!is_camera_init) {
      onCameraNotInit();
      return const SizedBox.shrink();
    }
    if (!is_select_camera) {
      onCameraNotSelect();
      return const SizedBox.shrink();
    }
    if (!is_camera_active) {
      onCameraNotActive();
      return const SizedBox.shrink();
    }
    if (isMobile) {
      return camera_mobile_controller.buildPreview();
    } else if (isDesktop) {
      if (Platform.isWindows) {
        return camera_windows.buildPreview(camera_id);
      }
    }
    return const SizedBox.shrink();
  }

  bool util_check_camera({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) {
    if (!is_camera_init) {
      onCameraNotInit();
      return false;
    }
    if (!is_select_camera) {
      onCameraNotSelect();
      return false;
    }
    if (!is_camera_active) {
      onCameraNotActive();
      return false;
    }
    return true;
  }

  Future<void> action_template({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) async {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return;
    }
    if (isMobile) {
      var res = (await camera_mobile_controller.startVideoRecording());
    }
    return;
  }

  Future<void> action_change_camera({
    required int cameraId,
    required void Function(void Function() callback) setState,
    required bool Function() mounted,
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) async {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return;
    }
    camera_id = cameraId;
    if (isMobile) {
      await initializeCameraById(
        camera_id: camera_id,
        setState: setState,
        mounted: mounted,
      );
    } else if (isDesktop) {
      if (Platform.isWindows) {
        await dispose();

        await initializeCameraById(
          camera_id: camera_id,
          setState: setState,
          mounted: mounted,
        );
      }
    }
    return;
  }

  action_start_video_recording({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) async {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return;
    }
    if (isMobile) {
      var res = (await camera_mobile_controller.startVideoRecording());
    } else if (isDesktop) {
      if (Platform.isWindows) {
        await camera_windows.startVideoRecording(camera_id);
      }
    }
  }

  action_pause_video_recording({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) async {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return;
    }
    if (isMobile) {
      await camera_mobile_controller.pauseVideoRecording();
    } else if (isDesktop) {
      if (Platform.isWindows) {
        await camera_windows.pauseVideoRecording(camera_id);
      }
    }
  }

  int action_get_camera_count({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return 0;
    }
    if (isMobile) {
      return camera_mobile_datas.length;
    } else if (isDesktop) {
      if (Platform.isWindows) {
        return camera_mobile_datas.length;
      }
    }
    return 0;
  }

  int action_get_camera_id({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return 0;
    }
    if (isMobile) {
      return camera_mobile_controller.cameraId;
    } else if (isDesktop) {
      if (Platform.isWindows) {
        return camera_id;
      }
    }
    return 0;
  }

  bool action_enable_audio({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return false;
    }
    if (isMobile) {
      return camera_mobile_controller.enableAudio;
    } else if (isDesktop) {
      if (Platform.isWindows) {}
    }
    return false;
  }

  action_pause_preview({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) async {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return;
    }
    if (isMobile) {
      await camera_mobile_controller.pausePreview();
    } else if (isDesktop) {
      if (Platform.isWindows) {
        await camera_windows.pausePreview(camera_id);
      }
    }
  }

  action_resume_preview({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) async {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return;
    }
    if (isMobile) {
      await camera_mobile_controller.resumePreview();
    } else if (isDesktop) {
      if (Platform.isWindows) {
        await camera_windows.resumePreview(camera_id);
      }
    }
  }

  action_stop_video_recording({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) async {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return;
    }
    if (isMobile) {
      var res = (await camera_mobile_controller.stopVideoRecording());
    } else if (isDesktop) {
      if (Platform.isWindows) {
        await camera_windows.stopVideoRecording(camera_id);
      }
    }
  }

  Future<CameraTakePictureData?> action_take_picture({
    required void Function() onCameraNotInit,
    required void Function() onCameraNotSelect,
    required void Function() onCameraNotActive,
  }) async {
    bool is_check_camera = util_check_camera(
      onCameraNotInit: onCameraNotInit,
      onCameraNotSelect: onCameraNotSelect,
      onCameraNotActive: onCameraNotActive,
    );
    if (!is_check_camera) {
      return null;
    }
    if (isMobile) {
      var res = (await camera_mobile_controller.takePicture());

      return CameraTakePictureData(
        mimeType: res.mimeType ?? "",
        path: res.path,
        name: res.name,
      );
    } else if (isDesktop) {
      if (Platform.isWindows) {
        var res = await camera_windows.takePicture(camera_id);
        return CameraTakePictureData(
          mimeType: res.mimeType ?? "",
          path: res.path,
          name: res.name,
        );
      }
    }
    return null;
  }
}

class CameraTakePictureData {
  String mimeType;
  String path;
  String name;

  CameraTakePictureData({required this.mimeType, required this.path, required this.name});
}
