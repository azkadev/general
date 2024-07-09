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

import 'dart:typed_data';

import 'package:general/player/player_model_data.dart';

class GeneralLibraryPlayerControllerBase {
  String player_id;

  GeneralLibraryPlayerControllerBase({
    required this.player_id,
  });

  Future<void> test() async {}

  Future<void> open(
    GeneralLibraryPlayerPlayableBase playable, {
    bool play = true,
    bool isLoop = false,
  }) async {
    return;
  }

  // PlatformPlayer? platform;

  // Future<void> add(Media media) {
  //   throw UnimplementedError();
  // }

  Future<void> dispose() async {}

  Future<int> get handle async {
    return 0;
  }

  Future<void> jump(int index) async {
    //   throw UnimplementedError();
  }

  Future<void> move(int from, int to) async {
    //   throw UnimplementedError();
  }

  Future<void> next() async {
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
