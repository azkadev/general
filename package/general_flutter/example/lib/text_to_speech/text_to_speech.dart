// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

class TextToSpeechPage extends StatefulWidget {
  const TextToSpeechPage({super.key});
  @override
  State<TextToSpeechPage> createState() => _TextToSpeechPageState();
}

class _TextToSpeechPageState extends State<TextToSpeechPage> {
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
      // wajib di run 1 x aja
      await general_library.text_to_speech.initialized();
      // bebas run dimanapun
      await general_library.text_to_speech.speak(text: "Hello World Speak");
    });
  }

  // --- code
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
