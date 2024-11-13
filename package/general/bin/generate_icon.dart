// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:image/image.dart' as img;
import "package:path/path.dart" as path;

class AndroidIconData {
  final String folderName;
  final String name;
  final int width;
  final int height;
  const AndroidIconData({
    required this.folderName,
    required this.height,
    required this.width,
    required this.name,
  });

  const AndroidIconData.createBySize({
    required this.folderName,
    required int size,
    required this.name,
  })  : width = size,
        height = size;
}

void main(List<String> args) async {
  final String imageSource = "/home/galaxeus/Documents/galaxeus/app/general_machine_system_services/library/general_assets_flutter/lib/assets/logo/nextgifto/nextgifto_telegram_userbot.jpeg";
  // final path = args.isNotEmpty ? args[0] : 'test.png';
  final Directory directory = Directory(path.join(Directory.current.path, "build", "general", "icon"));
  if (directory.existsSync() == false) {
    directory.createSync(recursive: true);
  }

  /// generate for android
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
    {
      for (final element in [
        ///
        AndroidIconData.createBySize(
          folderName: "mipmap-hdpi",
          size: 72,
          name: "ic_launcher.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-hdpi",
          size: 162,
          name: "ic_launcher_foreground.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-hdpi",
          size: 72,
          name: "ic_launcher_round.png",
        ),

        ///
        AndroidIconData.createBySize(
          folderName: "mipmap-ldpi",
          size: 32,
          name: "ic_launcher.png",
        ),

        ///
        AndroidIconData.createBySize(
          folderName: "mipmap-mdpi",
          size: 48,
          name: "ic_launcher.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-mdpi",
          size: 108,
          name: "ic_launcher_foreground.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-mdpi",
          size: 48,
          name: "ic_launcher_round.png",
        ),

        ///
        ///
        AndroidIconData.createBySize(
          folderName: "mipmap-xhdpi",
          size: 96,
          name: "ic_launcher.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-xhdpi",
          size: 216,
          name: "ic_launcher_foreground.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-xhdpi",
          size: 96,
          name: "ic_launcher_round.png",
        ),

        ///
        ///
        ///
        AndroidIconData.createBySize(
          folderName: "mipmap-xxhdpi",
          size: 144,
          name: "ic_launcher.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-xxhdpi",
          size: 324,
          name: "ic_launcher_foreground.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-xxhdpi",
          size: 144,
          name: "ic_launcher_round.png",
        ),

        ///
        ///

        ///
        AndroidIconData.createBySize(
          folderName: "mipmap-xxxhdpi",
          size: 192,
          name: "ic_launcher.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-xxxhdpi",
          size: 432,
          name: "ic_launcher_foreground.png",
        ),
        AndroidIconData.createBySize(
          folderName: "mipmap-xxxhdpi",
          size: 192,
          name: "ic_launcher_round.png",
        ),

        ///
      ]) {
        {
          await img.Command().rewriteAsync(
            imageSourcePath: imageSource,
            saveToSourcePath: path.join(
              directory_android.path,
              element.folderName,
              element.name,
            ),
            width: element.width,
            height: element.height,
          );
        }
      }

      ///
      ///

      {
        await img.Command().rewriteAsync(
          imageSourcePath: imageSource,
          saveToSourcePath: path.join(
            directory_android.path,
            "ic_launcher-web.png",
          ),
          width: 512,
          height: 512,
        );
      }
      {
        await img.Command().rewriteAsync(
          imageSourcePath: imageSource,
          saveToSourcePath: path.join(
            directory_android.path,
            "playstore-icon.png",
          ),
          width: 512,
          height: 512,
        );
      }
    }

    ///
    ///
    ///

    {
      File file = File(path.join(directory_android.path, "mipmap-anydpi-v26", "ic_launcher_round.xml"));
      if (file.parent.existsSync() == false) {
        file.parent.createSync(recursive: true);
      }
      await file.writeAsString("""
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_launcher_background"/>
    <foreground android:drawable="@mipmap/ic_launcher_foreground"/>
</adaptive-icon>
"""
          .trim());
    }

    {
      File file = File(path.join(directory_android.path, "mipmap-anydpi-v26", "ic_launcher.xml"));
      if (file.parent.existsSync() == false) {
        file.parent.createSync(recursive: true);
      }
      await file.writeAsString("""
<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_launcher_background"/>
    <foreground android:drawable="@mipmap/ic_launcher_foreground"/>
</adaptive-icon>
"""
          .trim());
    }
    {
      File file = File(path.join(directory_android.path, "values", "ic_launcher_background.xml"));
      if (file.parent.existsSync() == false) {
        file.parent.createSync(recursive: true);
      }
      await file.writeAsString("""
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <color name="ic_launcher_background">#f6ce98</color>
</resources>
"""
          .trim());
    }
  }

  ////
}

extension ASakoskao on img.Command {
  Future<void> rewriteAsync({
    required String imageSourcePath,
    required String saveToSourcePath,
    required int width,
    required int height,
  }) async {
    decodeImageFile(imageSourcePath);
    copyResize(
      width: width,
      height: height,
      maintainAspect: true,
    );
    writeToFile(saveToSourcePath);
    await executeThread();
  }
}
