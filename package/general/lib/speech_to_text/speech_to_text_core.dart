// ignore_for_file: non_constant_identifier_names

import 'package:general/speech_to_text/speech_to_text.dart';

class GeneralLibrarySpeechToTextBase {
  GeneralLibrarySpeechToTextBase();

  Future<void> initialized() async {}

  Future<bool> get has_permission async {
    return false;
  }

  bool get has_recognized { 
    return false;
  }


  bool get is_available { 
    return false;
  }

  bool get is_listening { 
    return false;
  }
  bool get is_not_listening { 
    return false;
  }

  Future<void> cancel() async {}

  Future<void> stop() async {}

  Future<void> realtime_speech_to_text_word({

    required void Function(String result) onResult,
    String? localeId,
    dynamic Function(double)? onSoundLevelChange,
    dynamic cancelOnError = false,
    dynamic partialResults = true,
    dynamic onDevice = false,
    ListenModeType listenModeType = ListenModeType.confirmation,
  }) async {}
}
