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
import 'dart:io';

import 'package:general/pemission/pemission_type.dart';
import 'package:path/path.dart';

void main(List<String> args) async {
  String script_dart = """
// ignore_for_file: deprecated_member_use
import 'package:general/pemission/pemission_type.dart';
import 'package:permission_handler/permission_handler.dart';

extension ExtensionPermissionTypeToPermission on PermissionType {
  Permission get toPermission {
    {content_replace}

    return Permission.unknown;
  }
}

extension ExtensionListPermissionTypeToPermission on List<PermissionType> {
  List<Permission> get toPermissions {
    return map((e) => e.toPermission).toList();
  }
}
""";
  File file = File(join(Directory.current.path, "lib", "permission", "extension", "permission_type_to_permission.dart"));
  String replace_data = "";

  for (var element in PermissionType.values) {
    replace_data += "\n";
    replace_data += """

    if (this == PermissionType.${element.name}) {
      return Permission.${element.name};
    }
""";
    replace_data += "\n";
  }

  script_dart = script_dart.replaceAll(RegExp("{content_replace}"), replace_data);
  await file.writeAsString(script_dart);
}
