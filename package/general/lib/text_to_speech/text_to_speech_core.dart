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

import 'package:general/player/player_controller.dart';

class GeneralLibraryTextToSpeechBase {
  static bool is_text_to_speech_on_speak = false;
  GeneralLibraryTextToSpeechBase();

  Future<void> dispose() async {}
  Future<void> initialized() async {}

  Future<void> speak({
    required String text,
    bool isWaithFinishedSpeakBefore = false,
    Duration? durationWaitFinishedSpeakBefore,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {
    if (isWaithFinishedSpeakBefore) {
      durationWaitFinishedSpeakBefore ??= Duration(minutes: 1);
      DateTime dateTime_expire = DateTime.now().add(durationWaitFinishedSpeakBefore);
      while (true) {
        await Future.delayed(Duration(milliseconds: 1));
        if (dateTime_expire.isBefore(DateTime.now())) {
          return;
        }
        break;
      }
    }
  }

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
      // await player.setVolume(i);
    }
  }

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

      // print(i);
      // await player.setVolume(i);
    }
  }

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
