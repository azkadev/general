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
// ignore_for_file: empty_catches, non_constant_identifier_names, unnecessary_brace_in_string_interps

import 'package:flutter/foundation.dart';
import 'package:general/pemission/pemission.dart';
import 'package:general/pemission/pemission_type.dart';
import 'package:general_flutter/permission/extension/permission_type_to_permission.dart';
// import 'package:general/app_background/app_background_core.dart';
import "package:general_lib/general_lib.dart";
import 'package:permission_handler/permission_handler.dart';

class GeneralLibraryPermissionBaseFlutter implements GeneralLibraryPermissionBase {
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
      if (dart.isWeb) {
        return;
      }

      if (dart.isAndroid || dart.isIOS || dart.isWindows) {
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
