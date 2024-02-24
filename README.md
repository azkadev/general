# General

General Adalah library DART & Flutter yang memungkinkan kamu bisa mengakses banyak hal dengan instant

## Pembuat & Kenapa Library ini di buat

[AZKADEV](https://github.com/azkadev) **adalah pembuat asli library ini**, **library** ini di buat agar dia bisa **mempercepat development** di **berbagai platform & cli** sekaligus dengan mudah, pasalnya saya Terkadang membuat **bot / userbot / server** yang memungkinkan **deploy di LOCAL DEVICE / HP** Sehingga **library** ini di buat agar bisa **mengakses fitur** yang ada di masing **device** seperti **(camera, fingerprint, sms, mms)**

<h3 align="center">
  Pencipta Library
  <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="28">
</h3>

<!-- Typing SVG by azkadev - https://github.com/azkadev/readme-typing-svg -->
<p align="center">
<a href="https://github.com/azkadev">
        <img src="https://telegra.ph/file/e90bdeab8390b8c0d9df2.png" alt="Specta"
            width="312"
            height="312">
    </a>
</p>

<!-- Social icons section -->
<p align="center">   
  <a href="https://youtube.com/@azkadev">
    <img alt="youtube" title="Follow me on Youtube" src="https://img.shields.io/badge/Youtube-%23E4405F.svg?&style=for-the-badge&logo=youtube&logoColor=white"/>
    </a>
  <a href="https://t.me/azkadevbot?star=ref_readme_general_library">
    <img alt="telegram" title="Follow me on Telegram" src="https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)"/>
    </a> 
  <a href="https://youtube.com/@azkadev">
    <img alt="Website" title="Follow me on Web" src="https://img.shields.io/badge/Website-%23E4405F.svg?&style=for-the-badge&logo=firefox&logoColor=white"/>
    </a>  
</p>



<p align="center">
  <a href="https://www.youtube.com/@azkadev?sub_confirmation=1">
    <img alt="youtube subscribers" title="Subscribe to my YouTube channel" src="https://custom-icon-badges.demolab.com/youtube/channel/subscribers/UC928-F8HenjZD1zNdMY42vA?color=%23E05D44&label=SUBSCRIBE&logo=video&logoColor=white&style=for-the-badge&labelColor=CE4630"/></a>
  <a href="https://www.youtube.com/@azkadev">
    <img alt="youtube views" title="YouTube views" src="https://custom-icon-badges.demolab.com/youtube/channel/views/UC928-F8HenjZD1zNdMY42vA?color=%23E1AD0E&logo=video&logoColor=white&style=for-the-badge&labelColor=C79600"/></a> 
  <a href="https://github.com/azkadev?tab=repositories&sort=stargazers">
    <img alt="total stars" title="Total stars on GitHub" src="https://custom-icon-badges.demolab.com/github/stars/azkadev?color=55960c&style=for-the-badge&labelColor=488207&logo=star"/></a>
  <a href="https://github.com/azkadev?tab=followers">
    <img alt="followers" title="Follow me on Github" src="https://custom-icon-badges.demolab.com/github/followers/azkadev?color=236ad3&labelColor=1155ba&style=for-the-badge&logo=person-add&label=Follow&logoColor=white"/></a>
</p>

---

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