# General

General Adalah library DART & Flutter yang memungkinkan kamu bisa mengakses banyak hal dengan instant

## Pembuat & Kenapa Library ini di buat

[AZKADEV](https://github.com/azkadev) adalah pembuat asli library ini, library ini di buat agar dia bisa mempercepat development di berbagai platform & cli sekaligus dengan mudah, pasalnya saya Terkadang membuat bot / userbot / server yang memungkinkan deploy di LOCAL DEVICE / HP Sehingga library ini di buat agar bisa mengakses fitur yang ada di masing device seperti (camera, fingerprint, sms, mms)

## Fitur

1. Cross Platform Notifikasi
2. Cross Platform Putar / Main Media (Video & Audio)
3. Cross Platform Menggunakan Fitur SMS / MMS
4. 

## Contoh


## Cara Penggunaan

Library ini hanya di buat untuk bahasa dart, bahasa code lain saya belum ada rencanamungkin jika saya sudah ada tenaga / waktu / uang lebih saya akan membuat bahasa code sendiri jadi lebih efficient

- Dart
  untuk menggunakan di dart kamu perlu typing
  - CLI
    ```bash
    dart pub add general_dart
    ```
  - IMPORT LIBRARY
    ```dart
    import "package:general_dart/general_dart.dart";
    ```
  - SCRIPT
    ```dart
    // ignore_for_file: non_constant_identifier_names
    import "package:general_dart/general_dart.dart";
    void main(List<String> args) async {
      GeneralDart general_library = GeneralDart();
      general_library.app_background;
    }
    ```

- Flutter
  untuk menggunakan di flutter kamu perlu typing
  - CLI
    ```bash
    flutter pub add general_flutter
    ```
  - IMPORT LIBRARY
    ```dart
    import "package:general_flutter/general_flutter.dart";
    ```
  - SCRIPT
    ```dart
    // ignore_for_file: non_constant_identifier_names
    import "package:general_flutter/general_flutter.dart";
    void main(List<String> args) async {
      GeneralFlutter general_library = GeneralFlutter();
      general_library.app_background;
    }
    ```

## Contoh Cepat Awal

```dart
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
```