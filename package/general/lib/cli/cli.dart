import 'package:general_lib/general_lib.dart';
import 'package:mason_logger/mason_logger.dart';
import 'package:universal_io/io.dart';

final Logger logger = Logger();

Future<void> generalLibraryCli({
  required List<String> argsRaw,
}) async {
  final Args args = Args(argsRaw);

  bool is_interactive = true;
  if (Platform.environment["no_interactive"] == "true") {
    is_interactive = false;
  }

  String command = (args.arguments.firstOrNull ?? "").toLowerCase();
  List<String> commands = [
    "init", 
  ];
  commands.sort();
  if (commands.contains(command) == false) {
    if (is_interactive) {
      command = logger.chooseOne(
        "Pilih",
        choices: commands,
        display: (choice) {
          return choice.toUpperCaseFirstData();
        },
      );
    } else {
      print("Please use command: ${commands.join("\n")}");
      exit(1);
    }
  }
}
