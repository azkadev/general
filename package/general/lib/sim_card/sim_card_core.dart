// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:general/sim_card/sim_card_info_data.dart';

class GeneralLibrarySimCardBase {
  GeneralLibrarySimCardBase();

  Future<List<SimCardInfoData>> getSimcards() async{
    return [];
  }
}
