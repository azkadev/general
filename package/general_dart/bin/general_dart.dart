// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import "package:general_dart/general_dart.dart";

void main(List<String> args) async {
  GeneralDart general_library = GeneralDart();

  // app background initialized
  await general_library.app_background.has_permissions;
  await general_library.app_background.initialize(
    notificationTitle: "App Name",
    notificationMessage: "Applikasi berjalan",
  );
  await general_library.app_background.enable_background;

  //  text to speech
  await general_library.text_to_speech.initialized();
  await general_library.text_to_speech.speak(text: "text");
  
  // speech to text
  await general_library.speech_to_text.has_permission;
  await general_library.speech_to_text.initialized();
  await general_library.speech_to_text.realtime_speech_to_text_word(
    onResult: (result) {
      print("result: ${result}");
    },
  );
}
