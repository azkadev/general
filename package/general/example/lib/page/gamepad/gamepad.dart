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

import 'dart:async';

import 'package:example/main.dart';
import 'package:example/widget/support_feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:general/flutter/flutter.dart';
import 'package:general/flutter/gamepad/gamepad_core.dart';

import 'package:general_lib_flutter/general_lib_flutter.dart';

class GamePadPage extends StatefulWidget {
  const GamePadPage({super.key});
  @override
  State<GamePadPage> createState() => _GamePadPageState();
}

class _GamePadPageState extends State<GamePadPage> {
  final GeneralLibraryGamePadBaseFlutter gamepad = GeneralExampleMainApp.generalFlutter.gamepad;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      task();
    });
    // task();
  }

  late final StreamSubscription<GamePadControllerEventData> game_pad_listen;
  @override
  void dispose() {
    game_pad_listen.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  void task() {
    Future(() async {
      // wajib di run 1 x aja
      setState(() {});
      game_pad_listen = gamepad.events.listen((GamePadControllerEventData gamePadControllerEventData) {
        onGamePad(gamePadControllerEventData);
      });
 
      setState(() {});
      // bebas run dimanapun
    });
  }

  GamePadControllerEventData game_pad_data = GamePadControllerEventData(
    gamepadId: "",
    timestamp: 0,
    type: GamePadControllerEventKeyType.button,
    key: "",
    value: 0,
  );
  void onGamePad(GamePadControllerEventData gamePadControllerEventData) {
    setState(() {
      game_pad_data = gamePadControllerEventData;
    });
  }

  bool is_loading = false;

  // --- code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GamePad / Joystick",
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.height,
            minWidth: context.width,
          ),
          child: Column(
            children: [
              SizedBox(
                height: context.mediaQueryData.padding.top,
              ),
              SupportFeatureWidget(
                isSupport: gamepad.isSupport(),
                reason_no_support: "Saat ini hanya tersedia di platform android",
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text("gamepadId:"),
                    Text("${game_pad_data.gamepadId}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text("key:"),
                    Text("${game_pad_data.key}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text("timestamp:"),
                    Text("${game_pad_data.timestamp}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text("type:"),
                    Text("${game_pad_data.type.name}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Text("value:"),
                    Text("${game_pad_data.value}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
