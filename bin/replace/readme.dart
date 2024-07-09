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

import 'package:http/http.dart';
import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

Future<String> get content_readme async {
  Response response = await get(Uri.parse("https://raw.githubusercontent.com/globalcorporation/.github/main/profile/readme.md"));

  return response.body;
}

void main(List<String> args) async {
  Directory directory = Directory.current;
  File file_readme = File(path.join(directory.path, "README.md"));

// <!-- START GLOBAL CORPORATION -->

// <!-- END GLOBAL CORPORATION -->
//
  List<String> datas = (await file_readme.readAsString()).split("\n");
  int start_index_global_corporation = datas.indexWhere((element) => element == "<!-- START GLOBAL CORPORATION -->");
  if (start_index_global_corporation < 0) {
    print("Tolong tambahkan tags: <!-- START GLOBAL CORPORATION -->");
    exit(0);
  }
  int end_index_global_corporation = datas.indexWhere(
    (element) => element == "<!-- END GLOBAL CORPORATION -->",
    // start_index_global_corporation,
  );
  if (end_index_global_corporation < 0) {
    print("Tolong tambahkan tags: <!-- END GLOBAL CORPORATION -->");
    exit(0);
  }
  List<String> lgoba = [
    "<!-- START GLOBAL CORPORATION -->",
    ...(await content_readme).split("\n"),
    "<!-- END GLOBAL CORPORATION -->",
  ];
  print(end_index_global_corporation);
  datas.replaceRange(start_index_global_corporation, end_index_global_corporation + 1, lgoba);

  await file_readme.writeAsString(datas.join("\n"));
  exit(0);
}
