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

import 'package:example/main.dart';
import 'package:example/widget/support_feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:general/flutter/flutter.dart';
import 'package:general/flutter/speech_to_text/speech_to_text.dart';

import 'package:general_lib_flutter/general_lib_flutter.dart';

class SpeechToTextPage extends StatefulWidget {
  const SpeechToTextPage({super.key});
  @override
  State<SpeechToTextPage> createState() => _SpeechToTextPageState();
}

class _SpeechToTextPageState extends State<SpeechToTextPage> {
  final GeneralLibrarySpeechToTextBaseFlutter speech_to_text =
      GeneralExampleMainApp.generalFlutter.speech_to_text();
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      task();
    });
    // task();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void task() {
    Future(() async {
      // wajib di run 1 x aja
      await speech_to_text.has_permission;
      await speech_to_text.initialized();
      setState(() {});
      context.showSnackBar("Speech To Text Initialized");
      // bebas run dimanapun
    });
  }

  bool is_loading = false;
  void speak() {
    if (is_loading) {
      return;
    }
    setState(() {
      is_loading = true;
    });
    handleFunction(
      onFunction: (context, statefulWidget) async {
        if (textEditingController.text.trim().isNotEmpty) {}
        setState(() {
          textEditingController.clear();
          is_loading = false;
        });
      },
    );
  }

  String word = "not found result";

  /// Each time to start a speech recognition session
  void _startListening() async {
    setState(() {
      word = "Listening...";
    });

    speech_to_text.realtime_speech_to_text_word(
      listenModeType: ListenModeType.dictation,
      onResult: (result) {
        if (result.isNotEmpty) {
          setState(() {
            word = result;
          });
        }
      },
    );
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    setState(() {});
    await speech_to_text.stop();
    setState(() {});
  }

  // --- code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Speech To Text",
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
                isSupport: speech_to_text.isSupport(),
                reason_no_support:
                    "Saat ini hanya tersedia di platform android",
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(word),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (speech_to_text.is_not_listening) {
            _startListening();
          } else {
            _stopListening();
          }
        },
        child: () {
          if (is_loading) {
            return const CircularProgressIndicator();
          }
          return Icon(
              speech_to_text.is_not_listening ? Icons.mic_off : Icons.mic);
        }(),
      ),
    );
  }
}
