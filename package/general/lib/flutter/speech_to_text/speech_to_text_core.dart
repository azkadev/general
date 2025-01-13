/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

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

import 'package:general/core/speech_to_text/speech_to_text.dart';
import 'package:general/flutter/speech_to_text/extension/listen_mode_type_to_listen_mode_type.dart';
import "package:general_lib/general_lib.dart";
import 'package:speech_to_text/speech_to_text.dart';

/// UncompleteDocumentation
class GeneralLibrarySpeechToTextBaseFlutter
    implements GeneralLibrarySpeechToTextBase {
  /// UncompleteDocumentation
  final SpeechToText speechToText = SpeechToText();

  /// UncompleteDocumentation
  GeneralLibrarySpeechToTextBaseFlutter();

  /// UncompleteDocumentation
  bool get isIOS => !Dart.isWeb && Dart.isIOS;

  /// UncompleteDocumentation
  bool get isAndroid => !Dart.isWeb && Dart.isAndroid;

  /// UncompleteDocumentation
  bool get isWindows => !Dart.isWeb && Dart.isWindows;

  /// UncompleteDocumentation
  bool get isWeb => Dart.isWeb;

  /// UncompleteDocumentation
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
        await speechToText.initialize();
      }
      // ignore: empty_catches
    } catch (e) {}
    return;
  }

  @override
  Future<void> cancel() async {
    if (flutter_is_support_flutter_stt) {
      await speechToText.cancel();
    }
  }

  @override
  Future<void> stop() async {
    if (flutter_is_support_flutter_stt) {
      await speechToText.stop();
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
      await speechToText.listen(
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
      return await speechToText.hasPermission;
    }
    return false;
  }

  @override
  bool get has_recognized {
    if (flutter_is_support_flutter_stt) {
      return speechToText.hasRecognized;
    }
    return false;
  }

  @override
  bool get is_available {
    if (flutter_is_support_flutter_stt) {
      return speechToText.isAvailable;
    }
    return false;
  }

  @override
  bool get is_listening {
    if (flutter_is_support_flutter_stt) {
      return speechToText.isListening;
    }
    return false;
  }

  @override
  bool get is_not_listening {
    if (flutter_is_support_flutter_stt) {
      return speechToText.isNotListening;
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

  @override
  bool isSupport() {
    return flutter_is_support_flutter_stt;
  }
}
