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
