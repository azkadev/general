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
// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:example/main.dart';
import 'package:example/widget/support_feature_widget.dart';
import 'package:flutter/material.dart';
import 'package:general/flutter/camera/camera.dart';

import 'package:general_lib_flutter/general_lib_flutter.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final GeneralLibraryCameraBaseFlutter camera = GeneralExampleMainApp.generalFlutter.camera();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      task();
    });
    // task();
  }

  @override
  void dispose() {
    camera.dispose();
    super.dispose();
  }

  void task() {
    Future(() async {
      await camera.initializeCameras();
      await camera.initializeCamera(setState: setState);
      await camera.activateCamera(
        setState: setState,
        mounted: () {
          return mounted;
        },
      );
      // wajib di run 1 x aja

      setState(() {});
      // bebas run dimanapun
    });
  }

  bool is_loading = false;
  void speak() {
    if (is_loading) {
      return;
    }
    setState(() {
      is_loading = true;
    });
    handleFunction(
      onFunction: (context, statefulWidget) async {},
    );
  }

  // --- code
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Text To Speech",
        ),
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.height,
            minWidth: context.width,
          ),
          child: Column(
            children: [
              SizedBox(
                height: context.mediaQueryData.padding.top,
              ),
              SupportFeatureWidget(
                isSupport: camera.isSupport(),
                reason_no_support: "Saat ini hanya tersedia di platform android",
              ),
              SizedBox(
                height: context.height - 10,
                width: context.width - 10,
                child:   camera.widget(),
                
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          speak();
        },
        child: () {
          if (is_loading) {
            return const CircularProgressIndicator();
          }
          return const Icon(Icons.voice_chat);
        }(),
      ),
    );
  }
}
