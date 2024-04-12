# General

General is a DART & Flutter library that allows you to access many things instantly

[![Pub Version](https://img.shields.io/pub/v/general?label=pub.dev&labelColor=333940&logo=dart)](https://pub.dev/packages/general)

## Creator and why this library was created

[AZKADEV](https://github.com/azkadev) **is the original creator of this library**, **library** This was made so he could **speed up development** on **various platform & cli** all at once easily, because I sometimes make it **bot / userbot / server** which allow **deploy on LOCAL DEVICE / HP** So that **library** This is made so that you can **access features** which is in each **device** such as **(camera, fingerprint, sms, mms)**

<!-- global first -->

<h3 align="center">
  Creator Library
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

## 🔗️ Links

#### Docs / Tutorial / Example

1. [GITHUB DOCS](/docs/)
2. [Youtube](https://youtube.com/@azkadev) 

<!-- global finished -->

## 🌟️ Interesting thing

1. Cross Platform Notification
2. Cross Platform Playing / Main Media (Video & Audio)
3. Cross Platform Use Feature SMS / MMS / CONTACTS
4. Cross Platform Camera
5. Cross Platform Security (Fingerprint, Face Id)

## How to use

This library is only made for the dart language, I don't have any plans yet, maybe if I have more energy/time/money I will make my own code language to be more efficient

- Dart
  to use in darts you need typing
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
  to use in Flutter you need typing
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

### Full Install Flutter


```bash
flutter pub add general_flutter
```

## ⚠️ Penting

- Even though most examples use Flutter / GeneralFlutter as a class, this library can be overwritten / used anywhere (CLI, web, app) so for example, if you create a CLI program but are trying to deploy it in a local app, you can use the one in Flutter.
- Please help this library continue to grow by starring / following my social media accounts / Donating / Sponsoring (this is the most influential)


## Example Quickstart

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

## ❔️ FAQS

- **Q:** Why should you use this library?
- **A:** We do not force you to use this library, but if you use this library it will be easy for you to develop because besides this library it is easy to read and manage, you can customize it as you wish.
  
- **Q:** Are there any important examples that require using this library?
- **A:** If you create a server / bot program, this is mandatory because you are deploying it in an app, you will have difficulty creating logs, with this library you can access various features in the app, for example your program has an error, you can use the text to speech feature, / example If you want to access the camera remotely, you can customize it yourself, but you need a little advanced coding skills, but you don't need to learn native, just learn Dart in this library.

- **Q:** I made an image generator program but currently I don't know how to deploy flutter on a server, can I use this on a cellphone?
- **A:** Of course you can do many things using this library quite simply

- **Q:** I want to get SMS messages on my cellphone but they have to be sent every time on Telegram. Is that possible?
- **A:** Yes you can use this library
  

## 📑️ Features
 I can make more features from below, you just need to donate / sponsor on my github

| NO  | Nama           | Deskripsi                                                       | ANDROID | IOS | LINUX | MACOS | WINDOWS | CLI | WEB | FUCHSIA |
|-----|----------------|-----------------------------------------------------------------|---------|-----|-------|-------|---------|-----|-----|---------|
| 1.  | APP            | Mengakses Banyak Hal Agar App Kamu semakin kompleks             |         |     |       |       |         |     |     |         |
| 2.  | APP Background | Minta Ijin background dengan mudah                              |         |     |       |       |         |     |     |         |
| 3.  | Battery        | Check battery kamu apakah sedang mengisi daya / tidak / level   |         |     |       |       |         |     |     |         |
| 4.  | Device         | Check device kamu apakah jailbreak / root / emulator            |         |     |       |       |         |     |     |         |
| 5.  | Gamepad        | Gunakan Gamepad Agar Kamu app kamu bisa lebih bagus             |         |     |       |       |         |     |     |         |
| 6.  | Notification   | Kirim Notifikasi Lokal Dengan Mudah                             |         |     |       |       |         |     |     |         |
| 7   | Player         | Putar Audi & Video Secara Mudah                                 |         |     |       |       |         |     |     |         |
| 8.  | Permisssion    | Minta Ijin App Secara mudah                                     |         |     |       |       |         |     |     |         |
| 9.  | Sim Card       | Baca Detail Sim Card                                            |         |     |       |       |         |     |     |         |
| 10. | Sms            | Baca, Kirim, Edit contact, Dan Mendapatkan Contact Dengan Mudah |         |     |       |       |         |     |     |         |
| 12. | Speech To Text | Hasilkan Text Dari Suara File / Live                            |         |     |       |       |         |     |     |         |
| 13. | Text To Speech | Hasilkan Suara Dari Text                                        |         |     |       |       |         |     |     |         |

## Contoh

| NO | Screenshot / Demo | Descripction                                                                                                                                  | LINK | Open Source |
|----|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|------|-------------|
| 1  |                   | Sebuah Applikasi untuk menjalankan berbagai bot / userbot / ai dengan banyak fitur + bisa menjadi assistant pribadi + teman                   |      | TIDAK       |
| 2. |                   | Sebuah Applikasi Telegram Pihak 3 Dengan banyak fitur menarik                                                                                 |      | TIDAK       |
| 3. |                   | Sebuah applikasi dengan banyak fitur yang memungkinkan anda bisa berbisnis / bersenang senang / membeli jasa dengan mudah di 1 app / platform |      | TIDAK       |

<!-- START GLOBAL CORPORATION -->
<h3 align="center">
  Global Corporation

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/global_corporation.png)
</h3>


<h3 align="center">
  Welcome to Global Corporation profile!
  <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="28">
</h3>

<!-- Social icons section -->
<p align="center">
  <a href="https://www.instagram.com/global__corporation/"><img width="32px" alt="Instagram" title="Telegram" src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
  <a href="https://t.me/GLOBAL_CORPORATION_ORG"><img width="32px" alt="Twitter" title="Telegram" src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
  <a href="https://twitter.com/global_corp_org"><img width="32px" alt="Twitter" title="Twitter" src="https://upload.wikimedia.org/wikipedia/commons/6/6f/Logo_of_Twitter.svg"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
  <a href="https://www.youtube.com/@global_Corporation"><img width="32px" alt="Youtube" title="Youtube" src="https://upload.wikimedia.org/wikipedia/commons/e/ef/Youtube_logo.png"/></a>
  &#8287;&#8287;&#8287;&#8287;&#8287;
</p>

**Global Corporation**

adalah perusahaan terkemuka yang mengambil peran utama dalam mempercepat dan mempertahankan keamanan perusahaan. 

Dengan fokus yang tajam pada inovasi dan keunggulan teknologi

**Global Corporation** menyediakan solusi proaktif yang efektif untuk mengamankan operasional perusahaan dan mencegah potensi risiko merugikan. 

Dengan tim ahli yang berkomitmen, teknologi canggih, dan pendekatan holistik terhadap keamanan perusahaan, Global Corporation telah menjadi acuan utama bagi perusahaan lain yang mengutamakan keamanan dan keselamatan sebagai prioritas utama dalam bisnis mereka.

[![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/powered.png)](https://www.youtube.com/@Global_Corporation)

## Application / Product / Project Official

<h3 align="center">
  Global App

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/global_corporation.png)
</h3>

  Super Applikasi cross platform memungkinkan anda melakukan social media / chat sekaligus tempat bisnis jual beli mencari pekerjaan
[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_app)

<h3 align="center">
  Global Bot App

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/global_corporation.png)
</h3>

  Super Applikasi cross platform memungkinkan anda menghandle banyak bot / userbot / ai untuk assistent anda sehingga memudahkan anda dalam segala urusan
  
[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_bot_app)

### Global Code Editor

  Applikasi Code Editor cross platform memungkinkan anda untuk coding di berbagai platform

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_bot_app)

<h3 align="center">
  Ads Gateway

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/ads_gateway.png)
</h3>

  **Applikasi** Iklan Cross platform memungkinkan anda untuk meng iklankan berbagai platform dengan mudah

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/coinlox)

<h3 align="center">
  Archivon

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/archivon.png)
</h3>

  **Applikasi** operating system based linux yang akan release

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/coinlox)

<h3 align="center">
  Coinlox

  ![](https://raw.githubusercontent.com/globalcorporation/.github/main/.github/logo/coinlox.png)
</h3>

  **Applikasi** Wallet Cross Platform memungkinkan anda untuk menyimpan uang di internet dengan aman

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/coinlox)



### Global Bot Telegram

  Super Bot Telegram memungkinkan anda manage berbagai chat group / private / channel sekaligus tempat jual beli produk yang kami jual, anda bisa membeli layanan ini mulai IDR: 25k / bulan

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_bot_telegram)

### Global Userbot Telegram

  Super Bot Telegram memungkinkan anda manage berbagai chat group / private / channel sekaligus tempat jual beli produk yang kami jual, anda bisa membeli layanan ini mulai IDR: 25k / bulan

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_userbot_telegram)

### Global Bot Whatsapp

  Super Bot Telegram memungkinkan anda manage berbagai chat group / private / channel sekaligus tempat jual beli produk yang kami jual, anda bisa membeli layanan ini mulai IDR: 25k / bulan

[![](https://cdn.dribbble.com/userupload/13133188/file/original-2331747061f15217a2f16cc3d665c5b6.jpg)](https://github.com/globalcorporation/global_bot_whatsapp)

## Social Media

<h3 align="center">
  Telegram
  <img src="https://upload.wikimedia.org/wikipedia/commons/8/82/Telegram_logo.svg" width="20">
</h3>

1. [Group Developer Global Public](https://t.me/DEVELOPER_GLOBAL_PUBLIC)

## Product / Services

1. **Clone Bot / Userbot**
  Hai kamu ingin punya bot / userbot dengan banyak features?. 
  - **Features**:
    - **Repeat Message**
    - **Manage Chat Private / Channel / Group**
  - **Platform Support**:
    - **Telegram**
    - **Whatsapp**
    - **Twitter**
    - **Github**
    - **Google** 
2. **Products**
    - **Black Products**
    - **Group / Channel**
    - **Nsfw**
    - **Payment Gateway**
    - **Paid Promote**
    - **Pre Release / Beta**
    - **Promo Cheap**
    - **Source Code Bot / USerbot**
    - **Trade**
3. **Services**
    - **Developer**
    - **Goal**
    - **Partner**
    - **Promote**
    - **Recommendation**
    - **Sortcut Cheat Sheet**
    - **Terminate**
    - **Upgrade**

## Cara Beli Jasa / Products 

- **Lewat Telegram Bot**
  Jika kamu ingin membeli bisa lewat telegram automatis pembayaran hingga proses
  (jika proses lama itu bukan **SCAM !!** kemungkinan **server down** jadi proses bisa lebih lama jika ragu tap menu report lalu isi keluhan)
  -  Buka Bot: https://t.me/GLOBAL_CORP_ORG_BOT
  -  Isi data pribadi / subscribe channel
  -  Tap Main menu pilih services / products
  -  Pilih Product / Services
  -  Pastikan coin mencukupi
  -  Isi data yang di butuhkan

- **Lewat Telegram USER**
  -  Buka: https://t.me/general_user
  -  Ucapin apapun yang kamu butuh jasa dev / apapun

  
Video Tutorial
[![Watch the video](https://img.youtube.com/vi/TY0Y21C6asM/maxresdefault.jpg)](https://www.youtube.com/watch?v=TY0Y21C6asM)

- **Lewat App**
  jika kamu ingin melihat prroduct / jasa dengan full demo kamu bisa beli lewat app
 


## 📺 Latest YouTube Videos

  <!-- prettier-ignore-start -->
  <!-- BEGIN YOUTUBE-CARDS -->
[![Userbot LIFE TIME Subsription Telegram Murah Unlimited Akun Ultra FAST | Global Corporation](https://ytcards.demolab.com/?id=LfNt8A2fCLQ&title=Userbot+LIFE+TIME+Subsription+Telegram+Murah+Unlimited+Akun+Ultra+FAST+%7C+Global+Corporation&lang=id&timestamp=1712129787&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Userbot LIFE TIME Subsription Telegram Murah Unlimited Akun Ultra FAST | Global Corporation")](https://www.youtube.com/watch?v=LfNt8A2fCLQ)
[![Tolong 😭 Siapapun beli satu jasa aku ntr aku kasih harga seiklasnya / ada yang mau donasi | GLOBAL](https://ytcards.demolab.com/?id=BFl2AT_pdOw&title=Tolong+%F0%9F%98%AD+Siapapun+beli+satu+jasa+aku+ntr+aku+kasih+harga+seiklasnya+%2F+ada+yang+mau+donasi+%7C+GLOBAL&lang=id&timestamp=1710988807&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Tolong 😭 Siapapun beli satu jasa aku ntr aku kasih harga seiklasnya / ada yang mau donasi | GLOBAL")](https://www.youtube.com/watch?v=BFl2AT_pdOw)
[![Cara beli ai telegram versi bot dan cara pakai| Global Corporation](https://ytcards.demolab.com/?id=7LZhoklvS9A&title=Cara+beli+ai+telegram+versi+bot+dan+cara+pakai%7C+Global+Corporation&lang=id&timestamp=1710937415&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Cara beli ai telegram versi bot dan cara pakai| Global Corporation")](https://www.youtube.com/watch?v=7LZhoklvS9A)
[![Ai Userbot Telegram Demo Cara Pakai Dan Beli | Global Corporation](https://ytcards.demolab.com/?id=4mAZ6EgAhUo&title=Ai+Userbot+Telegram+Demo+Cara+Pakai+Dan+Beli+%7C+Global+Corporation&lang=id&timestamp=1710936251&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Ai Userbot Telegram Demo Cara Pakai Dan Beli | Global Corporation")](https://www.youtube.com/watch?v=4mAZ6EgAhUo)
[![CARA BELI USERBOT TELEGRAM CLOUD  | Global Corporation](https://ytcards.demolab.com/?id=uiDJwK9r3Cg&title=CARA+BELI+USERBOT+TELEGRAM+CLOUD++%7C+Global+Corporation&lang=id&timestamp=1710900440&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "CARA BELI USERBOT TELEGRAM CLOUD  | Global Corporation")](https://www.youtube.com/watch?v=uiDJwK9r3Cg)
[![Cara Top Up Automatis Menggunakan Payment Gateway Di GLOBAL BOT APP](https://ytcards.demolab.com/?id=ADqzS5ORJsU&title=Cara+Top+Up+Automatis+Menggunakan+Payment+Gateway+Di+GLOBAL+BOT+APP&lang=id&timestamp=1710721879&background_color=%230d1117&title_color=%23ffffff&stats_color=%23dedede&max_title_lines=1&width=250&border_radius=5 "Cara Top Up Automatis Menggunakan Payment Gateway Di GLOBAL BOT APP")](https://www.youtube.com/watch?v=ADqzS5ORJsU)
<!-- END YOUTUBE-CARDS -->
  <!-- prettier-ignore-end -->

<!-- END GLOBAL CORPORATION -->