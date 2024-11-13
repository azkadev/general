import 'dart:io';

import 'package:image/image.dart' as img;
import "package:path/path.dart" as path;

void main(List<String> args) async {
  final Directory directorySource = Directory("/home/galaxeus/Documents/galaxeus/app/general/package/general/pics");
  final Directory directory = Directory(path.join(Directory.current.path, "build", "general", "pics"));
  if (directory.existsSync() == false) {
    directory.createSync(recursive: true);
  }
  await for (final element in directorySource.list()) {
    if (element is File) {
      {
        await img.Command().rewriteAsync(
          imageSourcePath: element.path,
          saveToSourcePath: path.join(
            directory.path,
            "visual-${path.basename(element.path)}",
          ),
          width: 1024,
          height: 500,
        );
      }
      {
        await img.Command().rewriteAsync(
          imageSourcePath: element.path,
          saveToSourcePath: path.join(
            directory.path,
            path.basename(element.path),
          ),
          width: 1080,
          height: 1080,
        );
      }
    }
  }
}

extension ASakoskao on img.Command {
  Future<void> rewriteAsync({
    required String imageSourcePath,
    required String saveToSourcePath,

    required int width,
    required int height,
  }) async {
    final cmd = img.Command();
    cmd.decodeImageFile(imageSourcePath);
    cmd.copyResize(
      width: width,
      height: height,
      maintainAspect: true,
    );
    cmd.writeToFile(saveToSourcePath);
    await cmd.executeThread();
  }
}
