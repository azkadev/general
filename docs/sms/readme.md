# Speech To Text

Speech To Text

## Contoh Code

```dart
// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

class SmsPage extends StatefulWidget {
  const SmsPage({super.key});
  @override
  State<SmsPage> createState() => _SmsPageState();
}

class _SmsPageState extends State<SmsPage> {
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
      
      await general_library.sms.getAllSms();
      await general_library.sms.getAllThreads();
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

