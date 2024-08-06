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
import 'package:general/flutter/local_auth/local_auth.dart';

import 'package:general_lib_flutter/general_lib_flutter.dart';

class LocalAuthPage extends StatefulWidget {
  const LocalAuthPage({super.key});
  @override
  State<LocalAuthPage> createState() => _LocalAuthPageState();
}

class _LocalAuthPageState extends State<LocalAuthPage> {
  final GeneralLibraryLocalAuthBaseFlutter local_auth = GeneralExampleMainApp.generalFlutter.local_auth();
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
    // TODO: implement dispose
    super.dispose();
  }

  void task() {
    Future(() async {
      // wajib di run 1 x aja
      setState(() {});
      // bebas run dimanapun
    });
  }

  bool is_loading = false;

  // --- code
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Local Auth",
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
                isSupport: local_auth.isSupport(),
                reason_no_support: "Saat ini hanya tersedia di platform android",
              ),
              FutureBuilder(
                future: local_auth.can_check_biometrics,
                builder: (context, snapshot) {
                  if (snapshot.connectionState.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  return Text("can_check_biometrics: ${snapshot.data ?? "unknown"}");
                },
              ),
              FutureBuilder(
                future: local_auth.is_device_support,
                builder: (context, snapshot) {
                  if (snapshot.connectionState.isLoading) {
                    return const CircularProgressIndicator();
                  }
                  return Text("is_device_support: ${snapshot.data ?? "unknown"}");
                },
              ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: context.theme.dialogBackgroundColor,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   padding: const EdgeInsets.all(10),
              //   margin: const EdgeInsets.all(10),
              //   child: Column(
              //     children: [],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
