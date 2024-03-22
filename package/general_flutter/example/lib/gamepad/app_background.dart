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
// ignore_for_file: non_constant_identifier_names, empty_catches, unused_local_variable

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

class GamePadPage extends StatefulWidget {
  const GamePadPage({super.key});
  @override
  State<GamePadPage> createState() => _GamePadPageState();
}

class _GamePadPageState extends State<GamePadPage> {
  // ini bisa pakai generaldart dan anda bebas mengatur di manapun
  GeneralFlutter general_library = GeneralFlutter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      task();
    });
    // task();
  }

  void task() {
    Future(() async {
      // get all gamepad / controller connected
      await general_library.gamepad.list();
      // listen button / or analog trigger
      general_library.gamepad.events.listen((event) {
        
        print(event);
      });
    });
  }

  // --- code
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
