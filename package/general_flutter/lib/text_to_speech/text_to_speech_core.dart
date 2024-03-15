// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter_tts/flutter_tts.dart';
import 'package:general/player/player_controller.dart';
import 'package:general/text_to_speech/text_to_speech_core.dart';
import 'package:general_lib/general_lib.dart';

class GeneralLibraryTextToSpeechBaseFlutter implements GeneralLibraryTextToSpeechBase {
  FlutterTts flutterTts = FlutterTts();

  static bool is_text_to_speech_on_speak = false;
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
          DateTime dateTime_expire = DateTime.now().add(durationWaitFinishedSpeakBefore);
          while (true) {
            await Future.delayed(const Duration(milliseconds: 1));
            if (dateTime_expire.isBefore(DateTime.now())) {
              return;
            }
            break;
          }
        }
        isWaithFinishedSpeakBefore = true;

        await flutterTts.setVolume(1.0);
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
