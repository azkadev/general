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

import 'package:general/core/player/player_model_data.dart';
import 'package:media_kit_fork/media_kit_fork.dart';

/// UncompleteDocumentation
extension GeneralLibraryPlayerMediaBaseExtesnion
    on GeneralLibraryPlayerMediaBase {
  /// UncompleteDocumentation
  Media toMediaMediaKit() {
    return Media(
      resource,
      httpHeaders: httpHeaders,
      extras: extras,
    );
  }
}

/// UncompleteDocumentation
extension GeneralLibraryPlayerPlayListBaseExtension
    on GeneralLibraryPlayerPlayListBase {
  /// UncompleteDocumentation
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

/// UncompleteDocumentation
class GeneralLibraryPlayerControllerBase {
  /// UncompleteDocumentation
  final String player_id;

  /// UncompleteDocumentation
  final Player player = Player();

  /// UncompleteDocumentation
  GeneralLibraryPlayerControllerBase({
    required this.player_id,
  });

  /// UncompleteDocumentation
  Future<void> open(
    GeneralLibraryPlayerPlayableBase playable, {
    bool play = true,
    bool isLoop = false,
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
    if (isLoop) {
      await player.setPlaylistMode(PlaylistMode.loop);
    }
    return;
  }

  /// UncompleteDocumentation
  Future<void> dispose() async {}

  /// UncompleteDocumentation
  Future<void> stop() async {}

  /// UncompleteDocumentation
  Future<int> get handle async {
    return await player.handle;
  }

  /// UncompleteDocumentation
  Future<void> jump(int index) async {
    return await player.jump(index);
  }

  /// UncompleteDocumentation
  Future<void> move(int from, int to) async {
    return await player.move(from, to);
  }

  /// UncompleteDocumentation
  Future<void> next() async {
    return await player.next();
  }

  /// UncompleteDocumentation
  Future<void> pause() async {
    return await player.pause();
  }

  /// UncompleteDocumentation
  Future<void> play() async {
    return await player.play();
  }

  /// UncompleteDocumentation
  Future<void> playOrPause() async {
    return await player.playOrPause();
  }

  /// UncompleteDocumentation

  Future<void> previous() async {
    return await player.previous();
  }

  /// UncompleteDocumentation
  Future<void> remove(int index) async {
    return await player.remove(index);
  }

  /// UncompleteDocumentation
  Future<Uint8List?> screenshot({String? format = 'image/jpeg'}) async {
    return await player.screenshot(
      format: format,
    );
  }

  /// UncompleteDocumentation
  Future<void> seek(Duration duration) async {
    return await player.seek(duration);
  }

  /// UncompleteDocumentation

  Future<void> setPitch(double pitch) async {
    return await player.setPitch(pitch);
  }

  /// UncompleteDocumentation
  Future<void> setRate(double rate) async {
    return await player.setRate(rate);
  }

  /// UncompleteDocumentation
  Future<void> setShuffle(bool shuffle) async {
    return await player.setShuffle(shuffle);
  }

  /// UncompleteDocumentation
  Future<void> setVolume(double volume) async {
    return await player.setVolume(volume);
  }
}
