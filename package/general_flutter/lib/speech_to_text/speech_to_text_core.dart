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

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:general/speech_to_text/speech_to_text.dart';
import 'package:general_flutter/speech_to_text/extension/listen_mode_type_to_listen_mode_type.dart';
import "package:general_lib/general_lib.dart";
import 'package:speech_to_text/speech_to_text.dart';

class GeneralLibrarySpeechToTextBaseFlutter implements GeneralLibrarySpeechToTextBase {
  // late SpeechToText speechToText;
  GeneralLibrarySpeechToTextBaseFlutter();
  bool get isIOS => !Dart.isWeb && Dart.isIOS;
  bool get isAndroid => !Dart.isWeb && Dart.isAndroid;
  bool get isWindows => !Dart.isWeb && Dart.isWindows;

  bool get isWeb => Dart.isWeb;

  bool get flutter_is_support_flutter_stt {
    if (Dart.isLinux || Dart.isWindows) {
      if (Dart.isWeb == false) {
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
