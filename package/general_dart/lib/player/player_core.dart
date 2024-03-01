// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:general/player/player_controller.dart';
import 'package:general/player/player_core.dart';
import 'package:general_dart/player/player_controller.dart';
import 'package:media_kit/media_kit.dart';

class GeneralLibraryPlayerBaseDart implements GeneralLibraryPlayerBase {
  static List<GeneralLibraryPlayerControllerBaseDart> players = [];

  GeneralLibraryPlayerBaseDart();

  static void staticEnsureInitialized({
    String? libmpv,
  }) {
    MediaKit.ensureInitialized(
      libmpv: libmpv,
    );
  }

  @override
  void ensureInitialized({
    String? libmpv,
  }) {
    MediaKit.ensureInitialized(
      libmpv: libmpv,
    );
  }

  @override
  GeneralLibraryPlayerControllerBaseDart createPlayer({
    required String player_id,
  }) {
    GeneralLibraryPlayerControllerBaseDart generalLibraryPlayerControllerBaseDart = GeneralLibraryPlayerControllerBaseDart(
      player_id: player_id,
    );
    players.add(
      generalLibraryPlayerControllerBaseDart,
    );
    return generalLibraryPlayerControllerBaseDart;
  }

  @override
  GeneralLibraryPlayerControllerBase createPlayerWithoutAdd({required String player_id}) {
    GeneralLibraryPlayerControllerBaseDart generalLibraryPlayerControllerBaseDart = GeneralLibraryPlayerControllerBaseDart(
      player_id: player_id,
    );

    return generalLibraryPlayerControllerBaseDart;
  }

  @override
  bool containsPlayer({required String player_id}) {
    try {
      players.singleWhere((element) => element.player_id == player_id);
      return true;
    } catch (e) {}
    return false;
  }

  @override
  GeneralLibraryPlayerControllerBase? getPlayer({required String player_id}) {
    try {
      return players.singleWhere((element) => element.player_id == player_id);
    } catch (e) {}
    return null;
  }

  @override
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
