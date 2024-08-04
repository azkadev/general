import 'package:general/core/core.dart';
  
void main(List<String> args) async {
  GeneralLibrary generalLibrary = GeneralLibrary();

  GeneralLibraryPlayerBase player = generalLibrary.player;
  player.ensureInitialized();

  GeneralLibraryPlayerControllerBase generalLibraryPlayerControllerBase = player.createPlayer(player_id: "core");
  await generalLibraryPlayerControllerBase.open(GeneralLibraryPlayerMediaBase("/home/galaxeus/Documents/galaxeus/app/general/package/general/y2mate.com - Muse  Bliss.mp3"));
  
}
