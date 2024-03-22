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

import 'package:general/speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text.dart';

extension ExtensionListenModeTypeToListenMode on ListenModeType {
  ListenMode get toListenMode {
    if (this == ListenModeType.deviceDefault) {
      return ListenMode.deviceDefault;
    }

    if (this == ListenModeType.dictation) {
      return ListenMode.dictation;
    }

    if (this == ListenModeType.search) {
      return ListenMode.search;
    }

    if (this == ListenModeType.confirmation) {
      return ListenMode.confirmation;
    }

    return ListenMode.confirmation;
  }
}

extension ExtensionListListenModeTypeToListenMode on List<ListenModeType> {
  List<ListenMode> get toListenModes {
    return map((e) => e.toListenMode).toList();
  }
    
}
