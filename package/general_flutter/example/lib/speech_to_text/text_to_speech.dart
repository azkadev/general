// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});
  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {
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
      // check dulu di ijinkan / tidak
      await general_library.speech_to_text.has_permission;
      // wajib run 1 x
      await general_library.speech_to_text.initialized();
      // memulai code
      await general_library.speech_to_text.realtime_speech_to_text_word(
        onResult: (result) {
          print(result);
        },
      );
    });
  }

  // --- code
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
