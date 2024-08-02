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
// ignore_for_file: non_constant_identifier_names

import 'package:general/core/core.dart';
import 'package:general_lib/general_lib.dart';
import 'package:local_auth/local_auth.dart';

class GeneralLibraryLocalAuthBaseFlutter implements GeneralLibraryLocalAuthBase {
  GeneralLibraryLocalAuthBaseFlutter();
  final LocalAuthentication localAuthentication = LocalAuthentication();

  @override
  bool get is_support_local_auth {
    if (Dart.isAndroid || Dart.isIOS || Dart.isWindows) {
      if (Dart.isWeb == false) {
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
