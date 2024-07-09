// ignore_for_file: non_constant_identifier_names

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
  File file = File(join(Directory.current.path, "lib", "permission",
      "extension", "permission_type_to_permission.dart"));
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

  script_dart =
      script_dart.replaceAll(RegExp("{content_replace}"), replace_data);
  await file.writeAsString(script_dart);
}
