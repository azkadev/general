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
