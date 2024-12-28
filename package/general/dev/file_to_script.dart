import 'dart:convert';
import 'dart:io';
import "package:path/path.dart" as path;

void main(List<String> args) async {
  final Directory directoryCurrent = Directory.current;
  File file = File(
      path.join(directoryCurrent.path, "patch/KFOmCnqEu92Fr1Me5WZLCzYlKw.ttf"));
  if (file.existsSync() == false) {
    print("not found: ${file.path}");
    exit(0);
  }
  final bytes = await file.readAsBytes();

  File fileScript = File(path.join(directoryCurrent.path, "lib", "api", "file",
      "${path.basenameWithoutExtension(file.path)}.dart"));
  final String contents = """

final List<int> file_${path.basenameWithoutExtension(file.path)} = ${json.encode(bytes.toList(growable: false))};
""";
  await fileScript.writeAsString(contents);
  exit(0);
}
