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

import 'player_controller.dart';
import 'package:media_kit/media_kit.dart';

class GeneralLibraryPlayerBase {
  static List<GeneralLibraryPlayerControllerBase> players = [];

  GeneralLibraryPlayerBase();

  static void staticEnsureInitialized({
    String? libmpv,
  }) {
    MediaKit.ensureInitialized(
      libmpv: libmpv,
    );
  }

  void ensureInitialized({
    String? libmpv,
  }) {
    MediaKit.ensureInitialized(
      libmpv: libmpv,
    );
  }

  GeneralLibraryPlayerControllerBase createPlayer({
    required String player_id,
  }) {
    GeneralLibraryPlayerControllerBase generalLibraryPlayerControllerBaseDart = GeneralLibraryPlayerControllerBase(
      player_id: player_id,
    );
    players.add(
      generalLibraryPlayerControllerBaseDart,
    );
    return generalLibraryPlayerControllerBaseDart;
  }

  GeneralLibraryPlayerControllerBase createPlayerWithoutAdd({required String player_id}) {
    GeneralLibraryPlayerControllerBase generalLibraryPlayerControllerBaseDart = GeneralLibraryPlayerControllerBase(
      player_id: player_id,
    );

    return generalLibraryPlayerControllerBaseDart;
  }

  bool containsPlayer({required String player_id}) {
    try {
      players.singleWhere((element) => element.player_id == player_id);
      return true;
    } catch (e) {}
    return false;
  }

  GeneralLibraryPlayerControllerBase? getPlayer({required String player_id}) {
    try {
      return players.singleWhere((element) => element.player_id == player_id);
    } catch (e) {}
    return null;
  }

  GeneralLibraryPlayerControllerBase? getPlayerForce({required String player_id}) {
    try {
      return players.singleWhere((element) => element.player_id == player_id);
    } catch (e) {}
    return createPlayer(player_id: player_id);
  }

  Future<void> removePlayer({
    required String player_id,
  }) async {
    try {
      for (var element in players) {
        if (element.player_id == player_id) {
          try {
            await element.stop();
            await element.dispose();
          } catch (e) {}
        }
      }
      players.removeWhere((element) => element.player_id == player_id);
    } catch (e) {}
    return;
  }
}
