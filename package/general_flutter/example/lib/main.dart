import 'package:flutter/material.dart';
import 'package:general_flutter/general_flutter.dart';
import 'package:general_flutter/general_flutter_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GeneralFlutter generalFlutter = GeneralFlutter();
  runApp(MyApp(
    generalFlutter: generalFlutter,
  ));
}

class MyApp extends StatelessWidget {
  final GeneralFlutter generalFlutter;
  const MyApp({super.key, required this.generalFlutter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        generalFlutter: generalFlutter,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final GeneralFlutter generalFlutter;
  const MyHomePage({super.key, required this.title, required this.generalFlutter});
 
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String realt_time_text_speech = "";

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      task();
    });
  }

  task() {
    Future(() async {
      await widget.generalFlutter.permission.flutter_auto_request_all();
      await widget.generalFlutter.notification.initialize(notificationTitle: "", notificationMessage: "");
      await widget.generalFlutter.app_background.has_permissions;
      await widget.generalFlutter.app_background.initialize(
        notificationTitle: "General Flutter",
        notificationMessage: "Berjalan",
      );
      await widget.generalFlutter.app_background.enable_background;
      widget.generalFlutter.gamepad.events.listen(onGamePad);
      await widget.generalFlutter.text_to_speech.initialized();
      await widget.generalFlutter.speech_to_text.initialized();
    });
  }

  void onGamePad(GamePadControllerEventData gamePadControllerEventData) {
    // incrementCounter();
  }

  void _incrementCounter() {
    widget.generalFlutter.text_to_speech.speak(text: "Hallo Gais");
    setState(() {
      
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Theme.of(context).colorScheme.inversePrimary, 
        title: Text(widget.title),
      ),
      body: Center( 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder(
              future: widget.generalFlutter.battery.level,
              builder: (context, snapshot) {
                return Text(" batteru ${snapshot.data ?? 0}");
              },
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Recognized words:',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                realt_time_text_speech.trim(),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  widget.generalFlutter.speech_to_text.is_available ? 'Tap the microphone to start listening...' : 'Speech not available',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.generalFlutter.speech_to_text.is_not_listening ? _startListening : _stopListening,
        tooltip: 'Listen',
        child: Icon(widget.generalFlutter.speech_to_text.is_not_listening ? Icons.mic_off : Icons.mic),
      ),
    );
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await widget.generalFlutter.speech_to_text.realtime_speech_to_text_word(
      onResult: (result) {
        setState(() {
          realt_time_text_speech = result;
        });
      },
      listenModeType:ListenModeType.dictation,
    );
    setState(() {});
  }
 
  void _stopListening() async {
    await widget.generalFlutter.speech_to_text.stop();
    setState(() {});
  }
}
