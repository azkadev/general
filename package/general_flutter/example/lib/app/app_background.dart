// ignore_for_file: non_constant_identifier_names, empty_catches, unused_local_variable

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});
  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
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
      // 
      BuildContext? context_root = (GeneralLibraryAppBaseFlutter.flutter_navigator_key.currentContext);
      await general_library.app.screenshot_current_widget();
    });
  }

  // --- code
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
