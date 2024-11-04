import 'dart:io';

import 'package:image/image.dart' as img;
import "package:path/path.dart" as path;

void main(List<String> args) async {
  final String imageSource = "/home/galaxeus/Documents/galaxeus/app/general_machine_system_services/library/general_assets_flutter/lib/assets/logo/nextgifto/nextgifto_telegram_userbot.jpeg";
  // final path = args.isNotEmpty ? args[0] : 'test.png';
  final Directory directory = Directory(path.join(Directory.current.path, "build", "general", "icon"));
  if (directory.existsSync() == false) {
    directory.createSync(recursive: true);
  }
  {
    final Directory directory_android = Directory(
      path.join(
        directory.path,
        "android",
      ),
    );
    if (directory_android.existsSync() == false) {
      directory_android.createSync(recursive: true);
    }
    for (final element in {
      (
        name: "mipmap-hdpi",
        size: 72,
      ),
      (
        name: "mipmap-mdpi",
        size: 48,
      ),
      (
        name: "mipmap-xhdpi",
        size: 96,
      ),
      (
        name: "mipmap-xxhdpi",
        size: 144,
      ),
      (
        name: "mipmap-xxxhdpi",
        size: 192,
      ),
    }) {
      {
        await img.Command().rewriteAsync(
          imageSourcePath: imageSource,
          saveToSourcePath: path.join(
            directory_android.path,
            element.name,
            "ic_launcher.png",
          ),
          size: element.size,
        );
      }
      {
        await img.Command().rewriteAsync(
          imageSourcePath: imageSource,
          saveToSourcePath: path.join(
            directory_android.path,
            "${element.name}-v4",
            "ic_launcher.png",
          ),
          size: element.size,
        );
      }
    }
  }
}

extension ASakoskao on img.Command {
  Future<void> rewriteAsync({
    required String imageSourcePath,
    required String saveToSourcePath,
    required int size,
  }) async {
    final cmd = img.Command();
    cmd.decodeImageFile(imageSourcePath);
    cmd.copyResize(
      width: size,
      height: size,
      maintainAspect: true,
    );
    cmd.writeToFile(saveToSourcePath);
    await cmd.executeThread();
  }
}
