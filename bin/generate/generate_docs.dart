import 'dart:convert';
import 'dart:io';
 
import 'package:general_lib/script_generate/script_generate.dart';
import 'package:path/path.dart';

void main(List<String> args) async {
  List<ScriptGenerator> scipts = Directory(join(Directory.current.path, "docs")).listSync().toScriptGenerate();
  String scipt = json.encode(scipts.toJson());
  // scipts.toScriptDart(scriptName: "general_docs");
  File file = File(join(Directory.current.path, "generate", "docs", "general_docs_mini.json"));

  await file.parent.create(
    recursive: true,
  );

  await file.writeAsString(scipt);
}
