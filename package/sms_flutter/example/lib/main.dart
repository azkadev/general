import 'package:flutter/material.dart';
import 'package:sms_flutter/sms_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SmsQuery query = SmsQuery();
  List<SmsThread> threads = [];

  @override
  void initState() {
    super.initState();
    query.getAllThreads.then((value) {
      threads = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Example"),
          ),
          body: ListView.builder(
            itemCount: threads.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    minVerticalPadding: 8,
                    minLeadingWidth: 4,
                    title: Text(threads[index].messages.last.body ?? 'empty'),
                    subtitle: Text(threads[index].contact?.address ?? 'empty'),
                  ),
                  const Divider()
                ],
              );
            },
          ),
        ));
  }
}
