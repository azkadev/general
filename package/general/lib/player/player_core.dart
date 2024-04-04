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
// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:general/player/player_controller.dart';

class GeneralLibraryPlayerBase {
  static List<GeneralLibraryPlayerControllerBase> players = [];

  GeneralLibraryPlayerBase();

  static void staticEnsureInitialized({
    String? libmpv,
  }) {}

  void ensureInitialized({
    String? libmpv,
  }) {}

  GeneralLibraryPlayerControllerBase createPlayer({
    required String player_id,
  }) {
    GeneralLibraryPlayerControllerBase generalLibraryPlayerControllerBase =
        GeneralLibraryPlayerControllerBase(
      player_id: player_id,
    );
    players.add(generalLibraryPlayerControllerBase);

    return generalLibraryPlayerControllerBase;
  }

  GeneralLibraryPlayerControllerBase createPlayerWithoutAdd({
    required String player_id,
  }) {
    GeneralLibraryPlayerControllerBase generalLibraryPlayerControllerBase =
        GeneralLibraryPlayerControllerBase(
      player_id: player_id,
    );
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
    } catch (e) {}
    return false;
  }

  Future<void> removePlayer({
    required String player_id,
  }) async {
    try {
      players.removeWhere((element) => element.player_id == player_id);
    } catch (e) {}
    return;
  }
}
