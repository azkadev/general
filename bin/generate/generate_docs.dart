import 'dart:io';

import 'package:general_lib/script_generate/script_generate.dart';
import 'package:path/path.dart';

void main(List<String> args) async {
  List<ScriptGenerator> scipts = Directory(join(Directory.current.path, "docs")).listSync().toScriptGenerate();
  String scipt = scipts.toScriptDart(scriptName: "general_docs");
  File file = File(join(Directory.current.path, "generate", "docs", "general_docs.dart"));

  await file.parent.create(
    recursive: true,
  );

  await file.writeAsString(scipt);
}
