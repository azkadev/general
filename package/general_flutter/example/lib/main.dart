import 'package:flutter/material.dart';
import 'package:general_flutter/general_flutter.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await GeneralLibraryAppBaseFlutter.static_setFullScreen(true);
  GeneralLibraryAppBaseFlutter.static_setPreferredOrientations(orientations: [
    GeneralLibraryAppDeviceOrientationType.landscapeLeft,
  ]);
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenPage(),
    );
  }
}

class ScreenPage extends StatefulWidget {
  const ScreenPage({super.key});

  @override
  State<ScreenPage> createState() => _ScreenPageState();
}

class _ScreenPageState extends State<ScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
        },
      ),
    );
  }
}
