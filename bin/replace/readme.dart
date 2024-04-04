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
