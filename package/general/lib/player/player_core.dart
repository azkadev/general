// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:general/player/player_controller.dart';

class GeneralLibraryPlayerBase {
  static List<GeneralLibraryPlayerControllerBase> players = [];

  GeneralLibraryPlayerBase();

  void ensureInitialized({
    String? libmpv,
  }) {}

  GeneralLibraryPlayerControllerBase createPlayer({
    required String player_id,
  }) {
    GeneralLibraryPlayerControllerBase generalLibraryPlayerControllerBase = GeneralLibraryPlayerControllerBase(
      player_id: player_id,
    );
    players.add(generalLibraryPlayerControllerBase);
    return generalLibraryPlayerControllerBase;
  }

  GeneralLibraryPlayerControllerBase? getPlayer({
    required String player_id,
  }) {
    try {
      return players.singleWhere(
        (element) {
          return element.player_id == player_id;
        },
      );
    } catch (e) {
      return null;
    }
  }

  
  bool containsPlayer({required String player_id}) {
    try {
      players.singleWhere((element) => element.player_id == player_id);
      return true;
    } catch (e) { 
    }
    return false;
  }


  Future<void> removePlayer({
    required String player_id,
  }) async{
    try {

      players.removeWhere((element) => element.player_id == player_id);
    } catch (e) {}
    return;
  }

}
