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
