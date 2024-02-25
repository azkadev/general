// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps

import "dart:io";

import "package:general_dart/general_dart.dart";
import "package:media_kit/media_kit.dart";

void main(List<String> args) async {
  GeneralDart general_library = GeneralDart();

  general_library.player.ensureInitialized();
  
}
