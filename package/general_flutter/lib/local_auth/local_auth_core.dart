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
