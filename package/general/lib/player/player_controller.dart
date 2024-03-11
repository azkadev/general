// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

import 'package:general/player/player_model_data.dart';

class GeneralLibraryPlayerControllerBase {
  String player_id;

  GeneralLibraryPlayerControllerBase({
    required this.player_id,
  });

  Future<void> test() async {}

  
  Future<void> open(GeneralLibraryPlayerPlayableBase playable, {bool play= true,
    bool isLoop = false,
  
  }) async {
    return;
  }

  // PlatformPlayer? platform;

  // Future<void> add(Media media) {
  //   throw UnimplementedError();
  // }

  Future<void> dispose() async {}

  Future<int> get handle async{
    return 0;
  }

  Future<void> jump(int index) async{
  //   throw UnimplementedError();
  }

  Future<void> move(int from, int to) async{
  //   throw UnimplementedError();
  }

  Future<void> next() async{
  //   throw UnimplementedError();
  }
 
  Future<void> pause() async {
    // throw UnimplementedError();
  }

  Future<void> play() async {
    //   throw UnimplementedError();
  }

  Future<void> playOrPause() async {
    //   throw UnimplementedError();
  }

  Future<void> previous() async {
    //   throw UnimplementedError();
  }

  Future<void> remove(int index) async {
    //   throw UnimplementedError();
  }

  Future<Uint8List?> screenshot({String? format = 'image/jpeg'}) async {
    return null;
    // throw UnimplementedError();
  }

  Future<void> seek(Duration duration) async {
    // throw UnimplementedError();
  }

  // Future<void> setAudioDevice(AudioDevice audioDevice) {
  //   throw UnimplementedError();
  // }

  // Future<void> setAudioTrack(AudioTrack track) {
  //   throw UnimplementedError();
  // }

  Future<void> setPitch(double pitch) async {
    // throw UnimplementedError();
  }

  // Future<void> setPlaylistMode(PlaylistMode playlistMode) {
  //   throw UnimplementedError();
  // }

  Future<void> setRate(double rate) async {
    // throw UnimplementedError();
  }

  Future<void> setShuffle(bool shuffle) async {}

  // Future<void> setSubtitleTrack(SubtitleTrack track) {
  //   throw UnimplementedError();
  // }

  // Future<void> setVideoTrack(VideoTrack track) {
  //   throw UnimplementedError();
  // }

  Future<void> setVolume(double volume) async {}

  // PlayerState get state => throw UnimplementedError();

  Future<void> stop() async {}

  // PlayerStream get stream => throw UnimplementedError();

  // PlayerStream get streams => throw UnimplementedError();
}
