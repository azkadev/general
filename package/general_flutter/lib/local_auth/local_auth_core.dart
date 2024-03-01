// ignore_for_file: non_constant_identifier_names

import 'package:general_dart/general_dart.dart';
import 'package:general_lib/general_lib.dart';
import 'package:local_auth/local_auth.dart';

class GeneralLibraryLocalAuthBaseFlutter implements GeneralLibraryLocalAuthBase {
  GeneralLibraryLocalAuthBaseFlutter();
  final LocalAuthentication localAuthentication = LocalAuthentication();

  @override
  bool get is_support_local_auth {
    if (dart.isAndroid || dart.isIOS || dart.isWindows) {
      if (dart.isWeb == false) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<bool> get is_device_support async {
    if (is_support_local_auth) {
      return await localAuthentication.isDeviceSupported();
    }
    return false;
  }

  @override
  Future<List> getAvailableBiometrics() async {
    if (is_support_local_auth) {
      await localAuthentication.getAvailableBiometrics();
    }
    return [];
  }

  @override
  Future<bool> get can_check_biometrics async {
    if (is_support_local_auth) {
      return await localAuthentication.canCheckBiometrics;
    }
    return false;
  }

  @override
  Future<bool> authenticate({
    required String message,
  }) async {
    if (is_support_local_auth) {
      return await localAuthentication.authenticate(localizedReason: message);
    }
    return false;
  }

  @override
  Future<bool> stopAuthentication() async {
    if (is_support_local_auth) {
      return await localAuthentication.stopAuthentication();
    }
    return false;
  }
}
