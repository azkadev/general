// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

import 'package:general/player/player_controller.dart';
import 'package:general/player/player_model_data.dart';
import 'package:media_kit/media_kit.dart';

extension GeneralLibraryPlayerMediaBaseExtesnion on GeneralLibraryPlayerMediaBase {
  Media toMediaMediaKit() {
    return Media(
      resource,
      httpHeaders: httpHeaders,
      extras: extras,
    );
  }
}

extension GeneralLibraryPlayerPlayListBaseExtension on GeneralLibraryPlayerPlayListBase {
  Playlist toPlayListMediaKit() {
    return Playlist(
      medias.map(
        (generalLibraryPlayerMediaBase) {
          return generalLibraryPlayerMediaBase.toMediaMediaKit();
        },
      ).toList(),
      index: index,
    );
  }
}

class GeneralLibraryPlayerControllerBaseDart implements GeneralLibraryPlayerControllerBase {
  @override
  String player_id;
  Player player = Player();
  GeneralLibraryPlayerControllerBaseDart({
    required this.player_id,
  });

  @override
  Future<void> test() async {
    final playable = Media(
      "/home/galaxeus/Documents/fork/general/package/general_dart/bin/mixkit-software-interface-start-2574.wav",
    );
    Playlist;
    await player.open(playable);
  }

  @override
  Future<void> open(
    GeneralLibraryPlayerPlayableBase playable, {
    bool play = true,
  }) async {
    if (playable is GeneralLibraryPlayerMediaBase) {
      // GeneralLibraryPlayerMediaBase generalLibraryPlayerMediaBase = (playable);
      await player.open(
        playable.toMediaMediaKit(),
        play: play,
      );
    }
    if (playable is GeneralLibraryPlayerPlayListBase) {
      await player.open(
        playable.toPlayListMediaKit(),
        play: play,
      );
    }
    return;
  }

  @override
  Future<void> dispose() async {}

  @override
  Future<void> stop() async {}

  @override
  Future<int> get handle async {
    return await player.handle;
  }

  @override
  Future<void> jump(int index) async {
    return await player.jump(index);
  }

  @override
  Future<void> move(int from, int to) async {
    return await player.move(from, to);
  }

  @override
  Future<void> next() async {
    return await player.next();
  }

  @override
  Future<void> pause() async {
    return await player.pause();
  }

  @override
  Future<void> play() async {
    return await player.play();
  }

  @override
  Future<void> playOrPause() async {
    return await player.playOrPause();
  }

  @override
  Future<void> previous() async {
    return await player.previous();
  }

  @override
  Future<void> remove(int index) async {
    return await player.remove(index);
  }

  @override
  Future<Uint8List?> screenshot({String? format = 'image/jpeg'}) async {
    return await player.screenshot(
      format: format,
    );
  }

  @override
  Future<void> seek(Duration duration) async {
    return await player.seek(duration);
  }

  @override
  Future<void> setPitch(double pitch) async {
    return await player.setPitch(pitch);
  }

  @override
  Future<void> setRate(double rate) async {
    return await player.setRate(rate);
  }

  @override
  Future<void> setShuffle(bool shuffle) async {
    return await player.setShuffle(shuffle);
  }

  @override
  Future<void> setVolume(double volume) async {
    return await player.setVolume(volume);
  }
}
