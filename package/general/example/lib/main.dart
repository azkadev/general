import 'package:example/page/home/home.dart';
import 'package:flutter/material.dart';
import 'package:general/flutter/flutter.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const GeneralExampleMainApp());
}

class GeneralExampleMainApp extends StatelessWidget {
  static GeneralLibFlutterApp generalLibFlutterApp = GeneralLibFlutterApp();
  static GeneralFlutter generalFlutter = GeneralFlutter();
  const GeneralExampleMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralLibFlutterAppMain(
      generalLibFlutterApp: generalLibFlutterApp,
      builder: (themeMode, lightTheme, darkTheme, widget) {
        final MaterialApp materialApp = MaterialApp(
          themeMode: themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: const GeneralExampleApp(),
          debugShowCheckedModeBanner: false,
        );
        return materialApp;
      },
    );
  }
}

class GeneralExampleApp extends StatefulWidget {
  const GeneralExampleApp({super.key});

  @override
  State<GeneralExampleApp> createState() => _GeneralExampleAppState();
}

class _GeneralExampleAppState extends State<GeneralExampleApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      task();
    });
  }

  task() async {
    setState(() {});
    Future(() async {
      GeneralExampleMainApp.generalLibFlutterApp.initState(
        context: context,
        themeMode: GeneralExampleMainApp.generalLibFlutterApp.themeMode,
        onSet: () {
          setState(() {});
        },
      );
      context.navigator().pushReplacement(MaterialPageRoute(
        builder: (context) {
          return const HomePageGeneralApp();
        },
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: context.theme.indicatorColor,
        ),
      ),
    );
  }
}
