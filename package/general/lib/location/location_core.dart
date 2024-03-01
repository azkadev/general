// ignore_for_file: non_constant_identifier_names

import 'package:general/general.dart';

class GeneralLibraryLocationBase {
  GeneralLibraryLocationBase();

  bool get is_support_geolocator {
    return false;
  }

  Future<bool> hashPermission() async {
    return false;
  }

  // @override
  Future<GeneralLibraryLocationPositionData?> getCurrent() async { 
    return null;
  }
}
