// ignore_for_file: non_constant_identifier_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interp, constant_identifier_names, unnecessary_brace_in_string_interps

/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:general/api/docs/docs_core.dart';
import 'package:general/api/docs/readme/readme.dart';
import 'package:general/api/file/KFOmCnqEu92Fr1Me5WZLCzYlKw.dart';
import 'package:general_lib/general_lib.dart';
import "package:path/path.dart" as path;
// import "package:yaml/yaml.dart" as yaml;
// import 'package:yaml_writer/yaml_writer.dart';

/// build type server
enum GeneralLibraryApiBuildType {
  debug,
  release,
}

/// build platfomr type
enum GeneralLibraryApiPlatformType {
  supabase,
  vercel,
  netlify,
}

enum GeneralLibraryApiStatusType {
  succes,
  failed,
  info,
  start,
  progress_start,
  progress,
  progress_complete,
}

class GeneralLibraryApiStatus {
  String value;
  GeneralLibraryApiStatusType serverUniverseApiStatusType;
  GeneralLibraryApiStatus({
    required this.serverUniverseApiStatusType,
    required this.value,
  });
}

/// Server Universe api
class GeneralLibraryApi {
  final GeneralLibraryDocs general_library_docs = GeneralLibraryDocs();

  /// Server Universe
  GeneralLibraryApi();

  /// Server Universe
  Stream<GeneralLibraryApiStatus> create({
    required String newName,
    required Directory directoryBase,
  }) async* {
    Directory directory_project = await Future(() async {
      return Directory(Directory(path.join(directoryBase.uri.toFilePath(), newName.trim())).uri.toFilePath());
    });
    // ignore: unused_local_variable
    String project_name = path.basename(directory_project.path);

    File file_pubspec = File(path.join(directory_project.path, "pubspec.yaml"));
    if (!file_pubspec.existsSync()) {
      yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Start Create Project: ${newName}");

      Process process = await Process.start(
        "dart",
        [
          "create",
          newName,
          "--no-pub",
          "--force",
        ],
        workingDirectory: directory_project.parent.uri.toFilePath(),
      );
      process.stderr.listen((event) {
        stderr.add(event);
      });
      process.stdout.listen((event) {
        stdout.add(event);
      });
      int exit_code = await (process.exitCode);
      if (exit_code != 0) {
        yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.failed, value: "Failed Create Project: ${newName}");
        return;
      } else {
        yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.succes, value: "Succes Create Project: ${newName}");
      }
    }

    File file_guide = File(path.join(directory_project.path, "guide-dart-general-library.md"));
    if (file_guide.existsSync()) {
      yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Rewrite: ${path.basename(file_guide.path)}");
    } else {
      yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Create: ${path.basename(file_guide.path)}");
    }

    await file_guide.writeAsString(general_library_docs.readme());

    // supabase directory deploy

    // update pubspec default
    yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Start Update Pubspec: ${path.basename(file_pubspec.path)}");

    yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.succes, value: "Succes Update Pubspec: ${path.basename(file_pubspec.path)}");
    yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Start Save Pubspec: ${path.basename(file_pubspec.path)}");

    yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.succes, value: "Succes Save Pubspec: ${path.basename(file_pubspec.path)}");
    yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.succes, value: "Finished Create Project: ${newName}");

    // finished update pubspec
  }

  /// Server Universe
  Stream<GeneralLibraryApiStatus> setup({
    required Directory directoryBase,
  }) async* {
    Directory directory_project = Directory(directoryBase.uri.toFilePath());
    // ignore: unused_local_variable
    String project_name = path.basename(directory_project.path);

    File file_pubspec = File(path.join(directory_project.path, "pubspec.yaml"));
    if (!file_pubspec.existsSync()) {
      yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.failed, value: "Failed Create Project:");
      return;
    }

    // android
    Directory directory_android = Directory(path.join(directory_project.uri.toFilePath(), "android"));

    if (directory_android.existsSync()) {
      yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Started Setup Android");

      // auto setup settings gradle
      File file_settings_gradle = File(path.join(directory_android.uri.toFilePath(), "settings.gradle"));
      if (file_settings_gradle.existsSync()) {
        yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Check File: android/settings.gradle");
        List<String> data_origins = file_settings_gradle.readAsStringSync().trim().split("\n");
        String new_gradle_version = "1.9.22";
        bool is_found_new_update_gradle_file = false;
        RegExp regExp = RegExp("(([ ]+)?id([ ]+)\"org.jetbrains.kotlin.android\"([ ]+)version([ ]+)(.*)([ ]+)apply([ ]+)false)", caseSensitive: false);
        for (var i = 0; i < data_origins.length; i++) {
          String data_origin = data_origins[i];
          if (regExp.hashData(data_origin.trim())) {
            RegExpMatch? regExpMatch = regExp.firstMatch(data_origin);
            if (regExpMatch == null) {
              continue;
            }
            String version_gradle = (regExpMatch.group(6) ?? "").trim();

            if (version_gradle != json.encode(new_gradle_version)) {
              yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Upgrade Gradle Version ${version_gradle} To ${new_gradle_version}");
              data_origins[i] = data_origins[i].replaceAll(regExp, "${(regExpMatch.group(2) ?? "")}id \"org.jetbrains.kotlin.android\" version ${json.encode(new_gradle_version)} apply false");
              is_found_new_update_gradle_file = true;
            }
            break;
          }
        }
        if (is_found_new_update_gradle_file) {
          file_settings_gradle.writeAsStringSync(data_origins.join("\n"));
        }
      }
      // finished auto setup settings gradle android

//
      Directory directory_android_kotlin = Directory(path.join(directory_android.uri.toFilePath(), "app/src/main/kotlin"));
      if (directory_android_kotlin.existsSync()) {
        List<FileSystemEntity> file_kotlins = directory_android_kotlin.listSync(recursive: true);
        for (var file_kotlin in file_kotlins) {
          if (file_kotlin is File) {
            if (path.extension(file_kotlin.uri.toFilePath()) == ".kt") {
              List<String> data_origins = file_kotlin.readAsStringSync().trim().split("\n");
              String package_name_kotlin = data_origins.firstWhere((data) => RegExp("^(package([ ]+))", caseSensitive: false).hasMatch(data));
              yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Update package kotlin: ${package_name_kotlin}");

              /// if use gamepads but gamepads is ugly developer fucking stupid
//               final String new_content_kotlin = """
// ${package_name_kotlin}

// import android.hardware.input.InputManager
// import android.os.Handler
// import android.view.InputDevice
// import android.view.KeyEvent
// import android.view.MotionEvent
// import io.flutter.embedding.android.FlutterActivity
// import org.flame_engine.gamepads_android.GamepadsCompatibleActivity
// import io.flutter.embedding.android.FlutterFragmentActivity

// class MainActivity: FlutterFragmentActivity(), GamepadsCompatibleActivity {
//     var keyListener: ((KeyEvent) -> Boolean)? = null
//     var motionListener: ((MotionEvent) -> Boolean)? = null

//     override fun dispatchGenericMotionEvent(motionEvent: MotionEvent): Boolean {
//         return motionListener?.invoke(motionEvent) ?: false
//     }

//     override fun dispatchKeyEvent(keyEvent: KeyEvent): Boolean {
//         return keyListener?.invoke(keyEvent) ?: false
//     }

//     override fun registerInputDeviceListener(
//       listener: InputManager.InputDeviceListener, handler: Handler?) {
//         val inputManager = getSystemService(INPUT_SERVICE) as InputManager
//         inputManager.registerInputDeviceListener(listener, null)
//     }

//     override fun registerKeyEventHandler(handler: (KeyEvent) -> Boolean) {
//         keyListener = handler
//     }

//     override fun registerMotionEventHandler(handler: (MotionEvent) -> Boolean) {
//         motionListener = handler
//     }
// }
// """;
              // file_kotlin.writeAsStringSync(new_content_kotlin);

              final String new_content_kotlin = """
${package_name_kotlin}


import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()

""";
              file_kotlin.writeAsStringSync(new_content_kotlin);
            }
          }
        }
      }

      File file_android_build_gradle = File(path.join(directory_android.uri.toFilePath(), "app/build.gradle"));
      if (file_android_build_gradle.existsSync()) {
        yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Check File: app/build.gradle");
        List<String> data_origins = file_android_build_gradle.readAsStringSync().trim().split("\n");
        String new_compile_sdk = "34";
        String new_min_sdk_version = "23";
        String new_target_sdk_version = "34";

        String new_java_version = "17";
        String new_java_compatibility_version = "JavaVersion.VERSION_${new_java_version}";

        // compileOptions {
        //     sourceCompatibility = JavaVersion.VERSION_1_8
        //     targetCompatibility = JavaVersion.VERSION_1_8
        // }

        // kotlinOptions {
        //     jvmTarget = JavaVersion.VERSION_1_8
        // }

        RegExp regExp_compile_sdk = RegExp("(([ ]+)?compileSdk([ ]+)(.*))", caseSensitive: false);
        bool is_found_regex_compile_sdk = false;

        RegExp regExp_min_sdk_version = RegExp("(([ ]+)?(minSdk(Version)?)([ ]+)(.*))", caseSensitive: false);
        bool is_found_regex_min_sdk_version = false;

        RegExp regExp_target_sdk_version = RegExp("(([ ]+)?(targetSdk(Version)?)([ ]+)(.*))", caseSensitive: false);
        bool is_found_regex_target_sdk_version = false;

        ///
        /// 3 = jvmTarget
        /// 4 = space
        /// 5 = value
        final RegExp regExp_compile_options_compatibility = RegExp("(([ ]+)?((source|target)Compatibility)([ ]+[=][ ]+)(.*))", caseSensitive: false);
        final List<String> compile_options_compatibility_types = [
          "source",
          "target",
        ];

        ///
        /// 3 = jvmTarget
        /// 4 = space
        /// 5 = value
        final RegExp regExp_jvm_target = RegExp("(([ ]+)?(jvmTarget)([ ]+[=][ ]+)(.*))", caseSensitive: false);
        bool is_found_regex_jvm_target = false;

        bool is_found_new_update_build_gradle_file = false;
        for (var i = 0; i < data_origins.length; i++) {
          String data_origin = data_origins[i];
          if (is_found_regex_compile_sdk == false) {
            if (regExp_compile_sdk.hashData(data_origin.trim())) {
              is_found_regex_compile_sdk = true;
              RegExpMatch? regExpMatch = regExp_compile_sdk.firstMatch(data_origin);
              if (regExpMatch == null) {
                continue;
              }
              String version_compile_sdk = (regExpMatch.group(4) ?? "").trim();

              if (version_compile_sdk != new_compile_sdk) {
                yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Update Build Gradle Compile Sdk ${version_compile_sdk} To ${new_compile_sdk}");
                data_origins[i] = data_origins[i].replaceAll(regExp_compile_sdk, "${(regExpMatch.group(2) ?? "")}compileSdk = ${new_compile_sdk}");
                is_found_new_update_build_gradle_file = true;
              }
            }
            continue;
          }

          if (compile_options_compatibility_types.isNotEmpty) {
            if (regExp_compile_options_compatibility.hashData(data_origin.trim())) {
              // is_found_regex_compile_options_compatibility = true;

              RegExpMatch? regExpMatch = regExp_compile_options_compatibility.firstMatch(data_origin);
              if (regExpMatch == null) {
                continue;
              }

              final String typeCompileOptionCompability = (regExpMatch.group(4) ?? "").trim();
              compile_options_compatibility_types.remove(typeCompileOptionCompability);
              String version_java_version = (regExpMatch.group(6) ?? "").trim();

              if (version_java_version != new_java_compatibility_version) {
                yield GeneralLibraryApiStatus(
                  serverUniverseApiStatusType: GeneralLibraryApiStatusType.info,
                  value: "Update Build Gradle Compile Sdk ${version_java_version} To ${new_java_compatibility_version}",
                );
                data_origins[i] = data_origins[i].replaceAll(regExp_compile_options_compatibility, "${(regExpMatch.group(2) ?? "")}${regExpMatch.group(3)}${regExpMatch.group(5)}${new_java_compatibility_version}");
                is_found_new_update_build_gradle_file = true;
              }
            }

            // continue;
          }

          if (is_found_regex_jvm_target == false) {
            if (regExp_jvm_target.hashData(data_origin.trim())) {
              is_found_regex_jvm_target = true;

              RegExpMatch? regExpMatch = regExp_jvm_target.firstMatch(data_origin);
              if (regExpMatch == null) {
                continue;
              }
              String version_java_version = (regExpMatch.group(5) ?? "").trim();

              if (version_java_version != new_java_version) {
                yield GeneralLibraryApiStatus(
                  serverUniverseApiStatusType: GeneralLibraryApiStatusType.info,
                  value: "Update Build Gradle Compile Sdk ${version_java_version} To ${new_java_version}",
                );
                data_origins[i] = data_origins[i].replaceAll(regExp_jvm_target, "${(regExpMatch.group(2) ?? "")}${regExpMatch.group(3)}${regExpMatch.group(4)}${new_java_version}");
                is_found_new_update_build_gradle_file = true;
              }
            }

            continue;
          }

          if (is_found_regex_min_sdk_version == false) {
            if (regExp_min_sdk_version.hashData(data_origin.trim())) {
              is_found_regex_min_sdk_version = true;
              RegExpMatch? regExpMatch = regExp_min_sdk_version.firstMatch(data_origin);
              if (regExpMatch == null) {
                continue;
              }
              String version_min_sdk_version = (regExpMatch.group(6) ?? "").trim();

              if (version_min_sdk_version != new_min_sdk_version) {
                yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Update Build Gradle Compile Sdk ${version_min_sdk_version} To ${new_min_sdk_version}");
                data_origins[i] = data_origins[i].replaceAll(regExp_min_sdk_version, "${(regExpMatch.group(2) ?? "")}${regExpMatch.group(3)} = ${new_min_sdk_version}");
                is_found_new_update_build_gradle_file = true;
              }
            }
            continue;
          }

          if (is_found_regex_target_sdk_version == false) {
            if (regExp_target_sdk_version.hashData(data_origin.trim())) {
              is_found_regex_target_sdk_version = true;
              RegExpMatch? regExpMatch = regExp_target_sdk_version.firstMatch(data_origin);
              if (regExpMatch == null) {
                continue;
              }
              String version_target_sdk_version = (regExpMatch.group(6) ?? "").trim();

              if (version_target_sdk_version != new_target_sdk_version) {
                yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Update Build Gradle Compile Sdk ${version_target_sdk_version} To ${new_target_sdk_version}");
                data_origins[i] = data_origins[i].replaceAll(regExp_target_sdk_version, "${(regExpMatch.group(2) ?? "")}${regExpMatch.group(3)} = ${new_target_sdk_version}");
                is_found_new_update_build_gradle_file = true;
              }
            }
            continue;
          }
        }
        if (is_found_new_update_build_gradle_file) {
          file_android_build_gradle.writeAsStringSync(data_origins.join("\n"));
        }
      }

      //

      // // implement not finished
      // File file_android_manifest = File(path.join(directory_android.uri.toFilePath(), "app/src/main/AndroidManifest.xml"));
      // if (file_android_manifest.existsSync()) {
      //   yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Check File: app/src/main/AndroidManifest.xml");
      //   List<String> data_origins = file_android_manifest.readAsStringSync().trim().split("\n");
      //   String new_gradle_version = "1.9.22";
      //   bool is_found_new_update_gradle_file = false;
      //   for (var i = 0; i < data_origins.length; i++) {
      //     String data_origin = data_origins[i];
      //     RegExp regExp = RegExp("(([ ]+)?id([ ]+)\"org.jetbrains.kotlin.android\"([ ]+)version([ ]+)(.*)([ ]+)apply([ ]+)false)");
      //     if (regExp.hashData(data_origin.trim())) {
      //       RegExpMatch? regExpMatch = regExp.firstMatch(data_origin);
      //       if (regExpMatch == null) {
      //         continue;
      //       }
      //       String version_gradle = (regExpMatch.group(6) ?? "").trim();

      //       if (version_gradle != json.encode(new_gradle_version)) {
      //         yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Upgrade Gradle Version ${version_gradle} To ${new_gradle_version}");
      //         data_origins[i] = data_origins[i].replaceAll(regExp, "${(regExpMatch.group(2) ?? "")}id \"org.jetbrains.kotlin.android\" version ${json.encode(new_gradle_version)} apply false");
      //         is_found_new_update_gradle_file = true;
      //       }
      //       break;
      //     }
      //   }
      //   if (is_found_new_update_gradle_file) {
      //     file_settings_gradle.writeAsStringSync(data_origins.join("\n"));
      //   }
      // }
      //
      //
    }
  }

  /// Server Universe
  Stream<GeneralLibraryApiStatus> patch({
    required Directory directoryBase,
  }) async* {
    Directory directory_project = Directory(directoryBase.uri.toFilePath());
    // ignore: unused_local_variable
    String project_name = path.basename(directory_project.path);

    File file_pubspec = File(path.join(directory_project.path, "pubspec.yaml"));
    if (!file_pubspec.existsSync()) {
      yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.failed, value: "Failed Create Project:");
      return;
    }
    // build/web/flutter_bootstrap.js

    // android
    Directory directory_build_web = Directory(path.join(directory_project.uri.toFilePath(), "build", "web"));

    if (directory_build_web.existsSync()) {
      yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Started Patch Web");

      // auto setup settings gradle
      File file_flutter_bootstrap_js = File(path.join(directory_build_web.uri.toFilePath(), "flutter_bootstrap.js"));
      if (file_flutter_bootstrap_js.existsSync()) {
        yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Check File: build/web/flutter_bootstrap.js");

        String value = await file_flutter_bootstrap_js.readAsString();
        final String canvasKitBaseUrlFrom = """
return a.canvasKitBaseUrl?a.canvasKitBaseUrl:t.engineRevision&&!t.useLocalCanvasKit?_("https://www.gstatic.com/flutter-canvaskit",t.engineRevision):"canvaskit"
"""
            .trim();
        value = value.replaceAll(canvasKitBaseUrlFrom, "return \"canvaskit\";");
        await file_flutter_bootstrap_js.writeAsString(value);
        print("Replace canvaskit on flutter_bootstrap.js");
      }

      // auto setup settings gradle
      File file_main_dart_js = File(path.join(directory_build_web.uri.toFilePath(), "main.dart.js"));
      if (file_main_dart_js.existsSync()) {
        yield GeneralLibraryApiStatus(serverUniverseApiStatusType: GeneralLibraryApiStatusType.info, value: "Check File: build/web/main.dart.js");

        String value = await file_main_dart_js.readAsString();
        final String canvasKitBaseUrlFrom = """
return s==null?"https://fonts.gstatic.com/s/":s
"""
            .trim();
        value = value.replaceAll(canvasKitBaseUrlFrom, "return \"\";");
        await file_main_dart_js.writeAsString(value);
        print("Replace canvaskit on main.dart.js");
      }

      ///
      /// add file
      ///
      ///

      File file_roboto_v20_font_ttf = File(path.join(directory_build_web.uri.toFilePath(), "roboto", "v20", "KFOmCnqEu92Fr1Me5WZLCzYlKw.ttf"));
      final String path_relative = path.relative(file_roboto_v20_font_ttf.path, from: directory_build_web.uri.toFilePath());
      if (file_roboto_v20_font_ttf.parent.existsSync() == false) {
        file_roboto_v20_font_ttf.parent.createSync(recursive: true);
        print("create Directory: ${path_relative}");
      }

        await file_roboto_v20_font_ttf.writeAsBytes(file_KFOmCnqEu92Fr1Me5WZLCzYlKw);
        print("create file: ${path_relative}");
    }
  }
}
