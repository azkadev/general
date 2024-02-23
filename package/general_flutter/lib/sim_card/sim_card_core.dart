// ignore_for_file: non_constant_identifier_names, empty_catches

import 'dart:async';

import 'package:general/sim_card/sim_card_core.dart';
import 'package:general/sim_card/sim_card_info_data.dart';
import 'package:general_flutter/sim_card/extension/list_to_simcard.dart'; 
import "package:sim_card_info/sim_card_info.dart"; 

class GeneralLibrarySimCardBaseFlutter implements GeneralLibrarySimCardBase {
  SimCardInfo simCardInfo = SimCardInfo();

  GeneralLibrarySimCardBaseFlutter();

  @override
  Future<List<SimCardInfoData>> getSimcards() async {
    try {
      return (await simCardInfo.getSimInfo() ?? []).toSimCardInfoDatas();
    } catch (e) {}
    return [];
  }
}
