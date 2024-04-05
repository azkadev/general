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

import 'package:universal_io/io.dart';
import "package:path/path.dart" as path;

Future<void> replaceReadme(List<String> args) async {
  Directory directory = Directory.current;
  Directory directory_home = Directory(path.join(directory.path));

  File file_readme_home = File(path.join(directory_home.path, "README.md"));
  String readme_home = await file_readme_home.readAsString();
  // await file_readme.writeAsString(content_readme);
  Directory directory_packages = Directory(path.join(directory.path, "package"));

  if (!directory_packages.existsSync()) {
    print("Directory Packages Not Found: ${directory_packages.path}");
    exit(1);
  }

  List<FileSystemEntity> file_system_entity_packages = directory_packages.listSync();

  for (var i = 0; i < file_system_entity_packages.length; i++) {
    FileSystemEntity fileSystemEntity = file_system_entity_packages[i];
    if (fileSystemEntity is Directory) {
      File file_readme = File(path.join(fileSystemEntity.path, "README.md"));

      await file_readme.writeAsString(readme_home);
    }
  }

  print("Finished");
}

Future<void> replaceChangeLog(List<String> args) async {
  Directory directory = Directory.current;
  Directory directory_home = Directory(path.join(directory.path));

  File file_readme_home = File(path.join(directory_home.path, "CHANGELOG.md"));
  String readme_home = await file_readme_home.readAsString();
  // await file_readme.writeAsString(content_readme);
  Directory directory_packages = Directory(path.join(directory.path, "package"));

  if (!directory_packages.existsSync()) {
    print("Directory Packages Not Found: ${directory_packages.path}");
    exit(1);
  }

  List<FileSystemEntity> file_system_entity_packages = directory_packages.listSync();

  for (var i = 0; i < file_system_entity_packages.length; i++) {
    FileSystemEntity fileSystemEntity = file_system_entity_packages[i];
    if (fileSystemEntity is Directory) {
      File file_readme = File(path.join(fileSystemEntity.path, "CHANGELOG.md"));

      await file_readme.writeAsString(readme_home);
    }
  }

  print("Finished");
}

void main(List<String> args) async {
  await replaceChangeLog(args);

  await replaceReadme(args);

  exit(0);
}
