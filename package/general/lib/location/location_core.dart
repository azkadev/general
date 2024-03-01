// ignore_for_file: non_constant_identifier_names

import 'dart:math';

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

  double distanceBetween({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    var earthRadius = 6378137.0;
    var dLat = _toRadians(endLatitude - startLatitude);
    var dLon = _toRadians(endLongitude - startLongitude);
    var a = pow(sin(dLat / 2), 2) + pow(sin(dLon / 2), 2) * cos(_toRadians(startLatitude)) * cos(_toRadians(endLatitude));
    var c = 2 * asin(sqrt(a));
    return earthRadius * c;
  }

  static _toRadians(double degree) {
    return degree * pi / 180;
  }

  /// Constant factor to convert and angle from degrees to radians.
  final double _degrees2Radians = pi / 180.0;

  /// Constant factor to convert and angle from radians to degrees.
  final double _radians2Degrees = 180.0 / pi;

  /// Convert [radians] to degrees.
  double _degrees(double radians) => radians * _radians2Degrees;

  /// Convert [degrees] to radians.
  double _radians(double degrees) => degrees * _degrees2Radians;

  double bearingBetween({
   required double startLatitude,
   required double startLongitude,
   required double endLatitude,
   required double endLongitude,
  }) {
    var startLongitudeRadians = _radians(startLongitude);
    var startLatitudeRadians = _radians(startLatitude);
    var endLongitudeRadians = _radians(endLongitude);
    var endLatitudeRadians = _radians(endLatitude);

    var y = sin(endLongitudeRadians - startLongitudeRadians) * cos(endLatitudeRadians);
    var x = cos(startLatitudeRadians) * sin(endLatitudeRadians) - sin(startLatitudeRadians) * cos(endLatitudeRadians) * cos(endLongitudeRadians - startLongitudeRadians);

    return _degrees(atan2(y, x));
  }
}
