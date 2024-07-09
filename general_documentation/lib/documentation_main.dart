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
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/widget/widget.dart';
import 'package:documentation/documentation_core.dart';
import 'package:general_documentation/documentation_data.dart';

// ignore: non_constant_identifier_names
void documentation_main_app(List<String> arguments) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DocumentationMainApp());
}

class DocumentationMainApp extends StatelessWidget {
  static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
  const DocumentationMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: generalLibFlutterApp,
      builder: (themeMode, lightTheme, darkTheme, widget) {
        Widget child = MaterialApp(
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
          home: DocumentationApp(
            generalLibFlutterApp: generalLibFlutterApp,
            documentationData: documentationData,
          ),
        );

        return child;
      },
    );
  }
}
