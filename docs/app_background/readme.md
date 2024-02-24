# App Background

App Background Menjalankan Applikasi Di Background (hanya bekerja di general_flutter) namun jika anda menggunakan fungction ini di general_dart tetap bisa dan tidak akan muncul error / throw apapun hal ini di karenakan agar kamu bisa mengatur lebih flexible 

## Contoh Code

```dart
// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      // check dahulu apakah di beri ijin
      await general_library.app_background.has_permissions;
      // mengaktifkan background app
      await general_library.app_background.enable_background;
      // check apakah aplikasi bisa sudah berjalan di background
      general_library.app_background.is_background;
      // menonaktifkan background app
      // await general_library.app_background.disable_background;
    });
  }
  
  // --- code
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

```


### Wajib mengubah Code Flutter

1. Android

