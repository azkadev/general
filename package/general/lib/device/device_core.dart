// ignore_for_file: non_constant_identifier_names

class GeneralLibraryDeviceBase {
  GeneralLibraryDeviceBase();

  Future<bool> get is_jailbroken async {
    return false;
  }

  Future<bool> get is_real_device async {
    return false;
  }
  
  Future<bool> get android_is_on_external_storage async {
    return false;
  }

  Future<bool> get is_safe_device async {
    return false;
  }

  Future<bool> get android_is_development_mode_enable async {
    return false;
  }


  


  
  Future<bool> get usb_debug_check async {
    return false;
  }

  
  Future<bool> get is_mock_location async { 
    return false;
  }


}
