// ignore_for_file: empty_catches, unnecessary_brace_in_string_interps

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

import 'package:general/core/general_library.dart';
import 'package:general/core/player/player_controller.dart';
import 'package:general_lib/general_lib.dart';
import "package:html/parser.dart" as html;

class GeneralLibraryTextToSpeechBase implements GeneralLibraryCore {
  static bool is_text_to_speech_on_speak = false;
  GeneralLibraryTextToSpeechBase();

  @override
  bool isSupport() {
    return false;
  }

  Future<void> dispose() async {}
  Future<void> initialized() async {}

  Future<void> pauseHandle() async {}

  Future<void> stopHandle() async {}

  Future<void> cancelHandle() async {}

  Future<void> continueHandle() async {}

  void utils_print({
    required String title,
    required String fromText,
    required String toText,
  }) {
    print("""
--- 

${title}
- FROM: ${fromText}
- TO: ${toText}
---
"""
        .trim());
  }

  String utils_removeHtmlOrMarkdown({
    required final String text,
    bool isDebug = false,
    bool isExtraClean = true,
  }) {
    String text_new = text.trim();

    final List<RegExpReplace> regExpReplaces = [
      /// markdown remove
      /// - from: ![![Youtube](https://youtube.com/@azkadev)]]()
      /// - to: Youtube
      RegExpReplace(
        from: RegExp(r"(([!])?\[([!])?\[(.*)?\]\(.*\)\]\(.*\))",
            caseSensitive: false),
        replace: (match) {
          if (isDebug) {
            utils_print(
              title: "removed 0",
              fromText: match.group(1) ?? "",
              toText: match.group(4) ?? "",
            );
          }

          return match.group(4) ?? "";
        },
      ),

      /// markdown remove
      /// - from: ![Youtube](https://youtube.com/@azkadev)
      /// - to: Youtube
      RegExpReplace(
        /// old
        // from: RegExp(r"((([!])?\[(.*)\]\(.*\)))", caseSensitive: false),
        from: RegExp(r"((([!])?\[(.*)\]\([a-z0-9-./_!:]+\)))",
            caseSensitive: false),
        replace: (match) {
          if (isDebug) {
            utils_print(
              title: "removed 1",
              fromText: match.group(1) ?? "",
              toText: match.group(4) ?? "",
            );
          }

          return match.group(4) ?? "";
        },
      ),

      /// markdown remove
      /// - from: ![Youtube](https://youtube.com/@azkadev)
      /// - to: Youtube
      RegExpReplace(
        // from: RegExp(r"((([!])?\[(.*)\]\(.*\)))", caseSensitive: false),
        from: RegExp(r"((([!])?\[(.*)\]\([a-z0-9-./_!:]+\)))",
            caseSensitive: false),
        replace: (match) {
          if (isDebug) {
            utils_print(
              title: "removed 2",
              fromText: match.group(1) ?? "",
              toText: match.group(4) ?? "",
            );
          }

          return match.group(4) ?? "";
        },
      ),

      /// markdown remove
      /// - from: ![](https://youtube.com/@azkadev)
      /// - to:
      RegExpReplace(
        from: RegExp(r"((([!])?\[\]\(.*\)))", caseSensitive: false),
        replace: (match) {
          if (isDebug) {
            utils_print(
              title: "removed 3",
              fromText: match.group(1) ?? "",
              toText: "",
            );
          }

          return "";
        },
      ),

      /// markdown remove
      /// - from: **
      /// - to:
      RegExpReplace(
        from: RegExp(r"([*]+)", caseSensitive: false),
        replace: (match) {
          // if (isDebug) {
          //   utils_print(
          //     title: "removed 4",
          //     fromText: match.group(1) ?? "",
          //     toText: "",
          //   );
          // }

          return "";
        },
      ),
      RegExpReplace(
        from: RegExp(r"(((http(s)?):\/\/)([a-z0-9.-/_@]+)( )?)",
            caseSensitive: false),
        replace: (match) {
          // print(match.group(5));
          // exit(0);

          String space = match.group(6) ?? "";
          String protocol = match.group(3) ?? "";
          String url = match.group(5) ?? "";
          String result = () {
            if (RegExp(r"(^t\.me)").hasMatch(url)) {
              return "Telegram ${url} ${space}";
            }
            return "Website ${protocol} ${url} ${space}";
          }();
          // if (isDebug) {
          //   utils_print(
          //     title: "remake 5",
          //     fromText: match.group(1) ?? "",
          //     toText: result,
          //   );
          // }

          return result;
        },
      ),
    ];

    for (RegExpReplace regExpReplace in regExpReplaces) {
      try {
        text_new = text_new.replaceAllMapped(
            regExpReplace.from, regExpReplace.replace);
      } catch (e) {}
    }

    String html_parse = (html.parse(text_new).body?.text ?? "").trim();
    if (html_parse.isNotEmpty) {
      text_new = html_parse;
    }
    try {
      text_new = Uri.decodeFull(text_new).toString();
    } catch (e) {}

    if (isExtraClean) {
      List<String> text_split = [];
      bool is_empty = false;
      int count = 0;
      for (var element in text_new.split("\n")) {
        if (element.isEmpty) {
          if (is_empty) {
            count++;
            if (count > 2) {
              print("skip count 2");
              continue;
            }
            print("count");
            continue;
          } else {
            is_empty = true;
            count = 1;
            print("set empty true");
          }
        } else {
          is_empty = false;
          count = 0;
          print("set empty false");
          // empty slebew
          if (!RegExp(r"([a-z0-9-.!/\\=]+)", caseSensitive: false)
              .hasMatch(element)) {
            continue;
          }
        }

        text_split.add(element);
      }
      return text_split.join("\n");
    }
    return text_new;
  }

  Future<void> speak({
    required String text,
    bool isWaithFinishedSpeakBefore = false,
    Duration? durationWaitFinishedSpeakBefore,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {
    if (isWaithFinishedSpeakBefore) {
      durationWaitFinishedSpeakBefore ??= Duration(minutes: 1);
      DateTime dateTime_expire =
          DateTime.now().add(durationWaitFinishedSpeakBefore);
      while (true) {
        await Future.delayed(Duration(milliseconds: 1));
        if (dateTime_expire.isBefore(DateTime.now())) {
          return;
        }
        break;
      }
    }
  }

  Future<void> speakWithAutoSetVolume({
    required String text,
    required GeneralLibraryPlayerControllerBase player,
    double volume_default = 100,
    required double volume_low,
    double volume_space = 5,
    bool isWaithFinishedSpeakBefore = false,
    Duration? durationWaitFinishedSpeakBefore,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {
    await setVolumeDown(
      player: player,
      from: volume_default,
      to: volume_low,
      decrease: volume_space,
    );
    await speak(
      text: text,
      isWaithFinishedSpeakBefore: isWaithFinishedSpeakBefore,
      durationWaitFinishedSpeakBefore: durationWaitFinishedSpeakBefore,
      volume: volume,
      pitch: pitch,
      rate: rate,
    );
    await setVolumeUp(
      player: player,
      to: volume_default,
      from: volume_low,
      increase: volume_space,
    );
  }

  Future<void> setVolumeDown({
    required GeneralLibraryPlayerControllerBase player,
    double from = 100,
    required double to,
    double decrease = 5,
  }) async {
    if (from > 100) {
      from = 100;
    }
    for (double i = from; i >= to; (i -= decrease)) {
      await Future.delayed(const Duration(milliseconds: 10));
      // await player.setVolume(i);
    }
  }

  Future<void> setVolumeUp({
    required GeneralLibraryPlayerControllerBase player,
    required double from,
    double to = 100,
    double increase = 5,
  }) async {
    if (to > 100) {
      to = 100;
    }
    for (double i = from; i <= to; (i += increase)) {
      await Future.delayed(const Duration(milliseconds: 10));

      // print(i);
      // await player.setVolume(i);
    }
  }

  Future<void> speakWithAutoSetVolumes({
    required String text,
    required List<GeneralLibraryPlayerControllerBase> players,
    double volume_default = 100,
    required double volume_low,
    double volume_space = 5,
    bool isWaithFinishedSpeakBefore = false,
    Duration? durationWaitFinishedSpeakBefore,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {
    await setVolumeDowns(
      players: players,
      from: volume_default,
      to: volume_low,
      decrease: volume_space,
    );
    await speak(
      text: text,
      isWaithFinishedSpeakBefore: isWaithFinishedSpeakBefore,
      durationWaitFinishedSpeakBefore: durationWaitFinishedSpeakBefore,
      volume: volume,
      pitch: pitch,
      rate: rate,
    );
    await setVolumeUps(
      players: players,
      to: volume_default,
      from: volume_low,
      increase: volume_space,
    );
  }

  Future<void> setVolumeDowns({
    required List<GeneralLibraryPlayerControllerBase> players,
    double from = 100,
    required double to,
    double decrease = 5,
  }) async {
    for (var i = 0; i < players.length; i++) {
      await setVolumeDown(
        player: players[i],
        to: to,
        from: from,
        decrease: decrease,
      );
    }
  }

  Future<void> setVolumeUps({
    required List<GeneralLibraryPlayerControllerBase> players,
    required double from,
    double to = 100,
    double increase = 5,
  }) async {
    for (var i = 0; i < players.length; i++) {
      await setVolumeUp(
        player: players[i],
        to: to,
        from: from,
        increase: increase,
      );
    }
  }

  void progress(
      {required void Function(String text, int start, int end, String word)
          onProgress}) {}
}
