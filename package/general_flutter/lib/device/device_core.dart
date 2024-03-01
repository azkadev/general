// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:general/device/device_core.dart';
import 'package:general_lib/general_lib.dart';
import 'package:safe_device/safe_device.dart';

class GeneralLibraryDeviceBaseFlutter implements GeneralLibraryDeviceBase {
  bool get is_desktop {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isDesktop) {
      return true;
    }
    return false;
  }
  bool get is_mobile {
    if (dart.isWeb) {
      return false;
    }
    if (dart.isMobile) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> get android_is_development_mode_enable async {
    try {
      if (is_mobile) {
        return await SafeDevice.isDevelopmentModeEnable;
      }
    } catch (e) {}
    return false;
  }

  @override 
  Future<bool> get android_is_on_external_storage async {
    try {
      if (is_mobile) {
        return await SafeDevice.isOnExternalStorage;
      }
    } catch (e) {}
    return false;
  }


  @override 
  Future<bool> get usb_debug_check async {
    try {
      if (is_mobile) {
        return await SafeDevice.usbDebuggingCheck;
      }
    } catch (e) {}
    return false;
  }

  @override 
  Future<bool> get is_mock_location async {
    try {
      if (is_mobile) {
        return await SafeDevice.isMockLocation;
      }
    } catch (e) {}
    return false;
  }

  @override 
  Future<bool> get is_jailbroken async {
    try {
      if (is_mobile) {
        return await SafeDevice.isJailBroken;
      }
    } catch (e) {}
    return false;
  }


  @override 
  Future<bool> get is_real_device async {
    try {
      if (is_mobile) {
        return await SafeDevice.isRealDevice;
      }
    } catch (e) {}
    return false;
  }


  @override 
  Future<bool> get is_safe_device async {
    try {
      if (is_mobile) {
        return await SafeDevice.isSafeDevice;
      }
    } catch (e) {}
    return false;
  }
   
}
