// Make sure to add following packages to pubspec.yaml:
// * media_kit
// * media_kit_video
// * media_kit_libs_video
import 'package:flutter/material.dart';
import 'package:general_flutter/general_flutter.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GeneralLibraryPlayerBaseDart.staticEnsureInitialized();
  runApp(
    const MaterialApp(
      home: MyScreen(),
    ),
  );
}

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);
  @override
  State<MyScreen> createState() => MyScreenState();
}

class MyScreenState extends State<MyScreen> {
  GeneralFlutter generalFlutter = GeneralFlutter();

  late final GeneralLibraryPlayerControllerBaseDart generalLibraryPlayerControllerBaseDart;
  bool is_init = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      generalLibraryPlayerControllerBaseDart = generalFlutter.player.createPlayer(
        player_id: "main",
      );

      setState(() {
        is_init = true;
      });

      generalLibraryPlayerControllerBaseDart.open(GeneralLibraryPlayerMediaBase("https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4"));
    });
  }

  @override
  void dispose() {
    generalLibraryPlayerControllerBaseDart.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 9.0 / 16.0,
        // Use [Video] widget to display video output.
        child: Builder(
          builder: (context) {
            if (is_init) {
              return GeneralLibraryPlayerWidget(
                generalLibraryPlayerControllerBaseDart: generalLibraryPlayerControllerBaseDart,
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
