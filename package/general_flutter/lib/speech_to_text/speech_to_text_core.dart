// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:general/speech_to_text/speech_to_text.dart';
import 'package:general_flutter/speech_to_text/extension/listen_mode_type_to_listen_mode_type.dart';
import "package:general_lib/general_lib.dart";
import 'package:speech_to_text/speech_to_text.dart';

class GeneralLibrarySpeechToTextBaseFlutter implements GeneralLibrarySpeechToTextBase {
  // late SpeechToText speechToText;
  GeneralLibrarySpeechToTextBaseFlutter();
  bool get isIOS => !dart.isWeb && dart.isIOS;
  bool get isAndroid => !dart.isWeb && dart.isAndroid;
  bool get isWindows => !dart.isWeb && dart.isWindows;

  bool get isWeb => dart.isWeb;

  bool get flutter_is_support_flutter_stt {
    if (dart.isLinux || dart.isWindows) {
      if (dart.isWeb == false) {
        return false;
      }
    }
    return true;
  }

  @override
  Future<void> initialized() async {
    try {
      if (flutter_is_support_flutter_stt) {
        // speechToText = SpeechToText();
        await SpeechToText().initialize();
      }
      // ignore: empty_catches
    } catch (e) {}
    return;
  }

  @override
  Future<void> cancel() async {
    if (flutter_is_support_flutter_stt) {
      await SpeechToText().cancel();
    }
  }

  @override
  Future<void> stop() async {
    if (flutter_is_support_flutter_stt) {
      // await SpeechToText().st();
      await SpeechToText().stop();
    }
  }

  @override
  Future<void> realtime_speech_to_text_word({
    required void Function(String result) onResult,
    String? localeId,
    Function(double p)? onSoundLevelChange,
    dynamic cancelOnError = false,
    dynamic partialResults = true,
    dynamic onDevice = true,
    ListenModeType listenModeType = ListenModeType.confirmation,
  }) async {
    // StreamController<String> streamController = StreamController<String>();

    if (flutter_is_support_flutter_stt) { 
      await SpeechToText().listen(
        onResult: (result) {
          onResult(result.recognizedWords);
        },
        localeId: localeId,
        listenOptions: SpeechListenOptions(
          listenMode: listenModeType.toListenMode,
          cancelOnError: cancelOnError,
          partialResults: partialResults,
          onDevice: onDevice,
        ),
      );
    }

    // yield* streamController.stream;
  }

  @override
  Future<bool> get has_permission async {
    if (flutter_is_support_flutter_stt) {
      return await SpeechToText().hasPermission;
    }
    return false;
  }

  @override
  bool get has_recognized {
    if (flutter_is_support_flutter_stt) {
      return SpeechToText().hasRecognized;
    }
    return false;
  }

  @override
  bool get is_available {
    if (flutter_is_support_flutter_stt) {
      return SpeechToText().isAvailable;
    }
    return false;
  }

  @override
  bool get is_listening {
    if (flutter_is_support_flutter_stt) {
      return SpeechToText().isListening;
    }
    return false;
  }

  @override
  bool get is_not_listening {
    if (flutter_is_support_flutter_stt) {
      return SpeechToText().isNotListening;
    }
    return false;
  }

  @override
  Future<String> speech_to_text_word({
    String? localeId,
    Function(double p1)? onSoundLevelChange,
    cancelOnError = false,
    partialResults = true,
    onDevice = false,
    ListenModeType listenModeType = ListenModeType.confirmation,
  }) async {
    String text = "";

    return text;
  }
}
