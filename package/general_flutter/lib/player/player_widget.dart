/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:general_dart/general_dart.dart';
import 'package:media_kit_video/media_kit_video.dart';

class GeneralLibraryPlayerWidget extends StatefulWidget {
  final GeneralLibraryPlayerControllerBaseDart generalLibraryPlayerControllerBaseDart;
  const GeneralLibraryPlayerWidget({
    super.key,
    required this.generalLibraryPlayerControllerBaseDart,
  });

  @override
  State<GeneralLibraryPlayerWidget> createState() => _GeneralLibraryPlayerWidgetState();
}

class _GeneralLibraryPlayerWidgetState extends State<GeneralLibraryPlayerWidget> {
  late final VideoController videoController;
  bool is_init = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      videoController = VideoController(
        widget.generalLibraryPlayerControllerBaseDart.player,
      );
      setState(() {
        is_init = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (is_init) {
      return Video(controller: videoController);
    }
    return Container();
  }
}
