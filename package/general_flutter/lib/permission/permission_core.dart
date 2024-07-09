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
// ignore_for_file: empty_catches, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:flutter/foundation.dart';
import 'package:general/pemission/pemission.dart';
import 'package:general_flutter/permission/extension/permission_type_to_permission.dart';
// import 'package:general/app_background/app_background_core.dart';
import "package:general_lib/general_lib.dart";
import 'package:permission_handler/permission_handler.dart';

class GeneralLibraryPermissionBaseFlutter
    implements GeneralLibraryPermissionBase {
  @override
  Future<void> auto_request({
    required List<PermissionType> permissionTypes,
  }) async {
    await flutter_auto_request(permissions: permissionTypes.toPermissions);
  }

  Future<void> flutter_auto_request({
    required List<Permission> permissions,
  }) async {
    try {
      if (Dart.isWeb) {
        return;
      }

      if (Dart.isAndroid || Dart.isIOS || Dart.isWindows) {
        // await Permission.manageExternalStorage.isGranted;
        List<Permission> permission_datas = permissions;

        for (var i = 0; i < permission_datas.length; i++) {
          try {
            Permission permission = permission_datas[i];

            if (await permission.isPermanentlyDenied) {
              await openAppSettings();
            }

            if (await permission.isGranted) {
            } else {
              (await permission.request());
              continue;
            }
          } catch (e, stack) {
            if (kDebugMode) {
              print("${e} ${stack}");
            }
          }
        }
      }
    } catch (e) {}
  }

  Future<void> flutter_auto_request_all() async {
    await flutter_auto_request(permissions: Permission.values);
  }
}
