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
// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter_tts/flutter_tts.dart';
import 'package:general/core/player/player_controller.dart';
import 'package:general/core/text_to_speech/text_to_speech_core.dart';
import 'package:general_lib/general_lib.dart';

class GeneralLibraryTextToSpeechBaseFlutter
    implements GeneralLibraryTextToSpeechBase {
  FlutterTts flutterTts = FlutterTts();

  static bool is_text_to_speech_on_speak = false;
  bool get isIOS => !Dart.isWeb && Dart.isIOS;
  bool get isAndroid => !Dart.isWeb && Dart.isAndroid;
  bool get isWindows => !Dart.isWeb && Dart.isWindows;

  bool get isWeb => Dart.isWeb;
  @override
  bool isSupport() {
    return flutter_is_support_flutter_tts;
  }

  bool get flutter_is_support_flutter_tts {
    if (Dart.isLinux) {
      if (Dart.isWeb == false) {
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
    bool isWaithFinishedSpeakBefore = false,
    Duration? durationWaitFinishedSpeakBefore,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {
    if (text.trim().isNotEmpty) {
      if (flutter_is_support_flutter_tts) {
        if (isWaithFinishedSpeakBefore) {
          durationWaitFinishedSpeakBefore ??= const Duration(minutes: 1);
          DateTime dateTime_expire =
              DateTime.now().add(durationWaitFinishedSpeakBefore);
          while (true) {
            await Future.delayed(const Duration(milliseconds: 1));
            if (dateTime_expire.isBefore(DateTime.now())) {
              return;
            }
            break;
          }
        }
        isWaithFinishedSpeakBefore = true;
        await flutterTts.setVolume(volume);
        await flutterTts.setSpeechRate(rate);
        await flutterTts.setPitch(pitch);

        await flutterTts.speak(text.trim());
        isWaithFinishedSpeakBefore = false;
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

  @override
  Future<void> speakWithAutoSetVolume({
    required String text,
    required GeneralLibraryPlayerControllerBase player,
    double volume_default = 100,
    required double volume_low,
    double volume_space = 5,
    bool isWaithFinishedSpeakBefore = false,
    Duration? durationWaitFinishedSpeakBefore,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {
    await setVolumeDown(
      player: player,
      from: volume_default,
      to: volume_low,
      decrease: volume_space,
    );
    await speak(
      text: text,
      isWaithFinishedSpeakBefore: isWaithFinishedSpeakBefore,
      durationWaitFinishedSpeakBefore: durationWaitFinishedSpeakBefore,
      volume: volume,
      pitch: pitch,
      rate: rate,
    );
    await setVolumeUp(
      player: player,
      to: volume_default,
      from: volume_low,
      increase: volume_space,
    );
  }

  @override
  Future<void> setVolumeDown({
    required GeneralLibraryPlayerControllerBase player,
    double from = 100,
    required double to,
    double decrease = 5,
  }) async {
    if (from > 100) {
      from = 100;
    }
    for (double i = from; i >= to; (i -= decrease)) {
      await Future.delayed(const Duration(milliseconds: 10));
      await player.setVolume(i);
    }
  }

  @override
  Future<void> setVolumeUp({
    required GeneralLibraryPlayerControllerBase player,
    required double from,
    double to = 100,
    double increase = 5,
  }) async {
    if (to > 100) {
      to = 100;
    }
    for (double i = from; i <= to; (i += increase)) {
      await Future.delayed(const Duration(milliseconds: 10));

      await player.setVolume(i);
    }
  }

  @override
  Future<void> speakWithAutoSetVolumes({
    required String text,
    required List<GeneralLibraryPlayerControllerBase> players,
    double volume_default = 100,
    required double volume_low,
    double volume_space = 5,
    bool isWaithFinishedSpeakBefore = false,
    Duration? durationWaitFinishedSpeakBefore,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {
    await setVolumeDowns(
      players: players,
      from: volume_default,
      to: volume_low,
      decrease: volume_space,
    );
    await speak(
      text: text,
      isWaithFinishedSpeakBefore: isWaithFinishedSpeakBefore,
      durationWaitFinishedSpeakBefore: durationWaitFinishedSpeakBefore,
      volume: volume,
      pitch: pitch,
      rate: rate,
    );
    await setVolumeUps(
      players: players,
      to: volume_default,
      from: volume_low,
      increase: volume_space,
    );
  }

  @override
  Future<void> setVolumeDowns({
    required List<GeneralLibraryPlayerControllerBase> players,
    double from = 100,
    required double to,
    double decrease = 5,
  }) async {
    for (var i = 0; i < players.length; i++) {
      await setVolumeDown(
        player: players[i],
        to: to,
        from: from,
        decrease: decrease,
      );
    }
  }

  @override
  Future<void> setVolumeUps({
    required List<GeneralLibraryPlayerControllerBase> players,
    required double from,
    double to = 100,
    double increase = 5,
  }) async {
    for (var i = 0; i < players.length; i++) {
      await setVolumeUp(
        player: players[i],
        to: to,
        from: from,
        increase: increase,
      );
    }
  }
}
