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
// ignore_for_file: non_constant_identifier_names

import 'dart:async';

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

  Future<String> speech_to_text_word({
    String? localeId,
    dynamic Function(double)? onSoundLevelChange,
    dynamic cancelOnError = false,
    dynamic partialResults = true,
    dynamic onDevice = false,
    ListenModeType listenModeType = ListenModeType.confirmation,
  }) async {
    String text = "";
    await realtime_speech_to_text_word(
      onResult: (result) {
        text = result;
      },
      onSoundLevelChange: onSoundLevelChange,
      cancelOnError: cancelOnError,
      partialResults: partialResults,
      onDevice: onDevice,
      listenModeType: listenModeType,
    );
    return text;
  }
}
