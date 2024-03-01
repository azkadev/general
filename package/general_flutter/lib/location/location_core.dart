// ignore_for_file: non_constant_identifier_names

import 'package:general_dart/general_dart.dart';
import 'package:general_flutter/location/extension/position_to_gene.dart';
import 'package:general_lib/general_lib.dart';
import 'package:geolocator/geolocator.dart';

class GeneralLibraryLocationBaseFlutter implements GeneralLibraryLocationBase {
  GeneralLibraryLocationBaseFlutter();
  GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

  @override
  bool get is_support_geolocator {
    if (dart.isLinux) {
      if (dart.isWeb == false) {
        return false;
      }
    }
    return true;
  }

  @override
  Future<bool> hashPermission() async {
    if (is_support_geolocator) {
      bool serviceEnabled = await geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return false;
      }
      LocationPermission permission = await geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return false;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return false;
      }
      return true;
    }
    return false;
  }

  @override
  Future<GeneralLibraryLocationPositionData?> getCurrent() async {
    if (is_support_geolocator) {
      Position position = await geolocator.getCurrentPosition();
      return position.toGeneralLibraryLocationPositionData();
    }
    return null;
  }
}
