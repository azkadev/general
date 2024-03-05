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
