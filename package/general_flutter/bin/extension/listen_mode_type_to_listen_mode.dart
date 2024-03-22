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
// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:path/path.dart';

/// Describes the goal of your speech recognition to the system.
///
/// Currently only supported on **iOS**.
///
/// See also:
/// * https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskhint
enum ListenMode {
  /// The device default.
  deviceDefault,

  /// When using captured speech for text entry.
  ///
  /// Use this when you are using speech recognition for a task that's similar to the keyboard's built-in dictation function.
  dictation,

  /// When using captured speech to specify search terms.
  ///
  /// Use this when you are using speech recognition to identify search terms.
  search,

  /// When using captured speech for short, confirmation-style requests.
  ///
  /// Use this when you are using speech recognition to handle confirmation commands, such as "yes", "no" or "maybe".
  confirmation,
}

void main(List<String> args) async {
  String script_dart = """ 
// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:general/speech_to_text/speech_to_text.dart';
import "package:general_lib/general_lib.dart";
import 'package:speech_to_text/speech_to_text.dart';

extension ExtensionListenModeTypeToListenMode on ListenModeType {
  ListenMode get toListenMode {
    {content_replace}

    return ListenMode.confirmation;
  }
}

extension ExtensionListListenModeTypeToListenMode on List<ListenModeType> {
  List<ListenMode> get toListenModes {
    return map((e) => e.toListenMode).toList();
  }
}
""";

  Directory directory = Directory(join(
    Directory.current.path,
    "lib",
    "speech_to_text",
    "extension",
  ));
  if (!directory.existsSync()) {
    await directory.create(recursive: true);
  }
  File file = File(join(directory.path, "listen_mode_type_to_listen_mode_type.dart"));
  String replace_data = "";

  for (var element in ListenMode.values) {
    replace_data += "\n";
    replace_data += """

    if (this == ListenModeType.${element.name}) {
      return ListenMode.${element.name};
    }
""";
    replace_data += "\n";
  }

  script_dart = script_dart.replaceAll(RegExp("{content_replace}"), replace_data);
  await file.writeAsString(script_dart);
}
