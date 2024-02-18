// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter_tts/flutter_tts.dart';
import 'package:general/text_to_speech/text_to_speech_core.dart';
import 'package:general_lib/general_lib.dart';

class GeneralLibraryTextToSpeechBaseFlutter implements GeneralLibraryTextToSpeechBase {
  FlutterTts flutterTts = FlutterTts();

  bool get isIOS => !dart.isWeb && dart.isIOS;
  bool get isAndroid => !dart.isWeb && dart.isAndroid;
  bool get isWindows => !dart.isWeb && dart.isWindows;

  bool get isWeb => dart.isWeb;

  bool get flutter_is_support_flutter_tts {
    if (dart.isLinux) {
      if (dart.isWeb == false) {
        return false;
      }
    }
    return true;
  }

  @override
  Future<void> initialized() async {
    try {
      if (flutter_is_support_flutter_tts) {
        await flutterTts.awaitSpeakCompletion(true);
        if (isAndroid) {
          var engine = await flutterTts.getDefaultEngine;
          if (engine != null) {}

          var voice = await flutterTts.getDefaultVoice;
          if (voice != null) {}
        }
      }
    } catch (e) {}
  }

  @override
  Future<void> speak({
    required String text,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {
    if (text.trim().isNotEmpty) {
      if (flutter_is_support_flutter_tts) {
        await flutterTts.setVolume(1.0);
        await flutterTts.setSpeechRate(rate);
        await flutterTts.setPitch(pitch);
        await flutterTts.speak(text.trim());
      }
    }
  }

  @override
  Future<void> dispose() async {
    try {
      if (flutter_is_support_flutter_tts) {
        await flutterTts.stop();
        return;
      }
    } catch (e) {}
  }
}
