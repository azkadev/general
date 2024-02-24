// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RepaintBoundary(
        key: GeneralLibraryAppBaseFlutter.flutter_navigator_key,
        child: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GeneralFlutter general_library = GeneralFlutter();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      task();
    });
    // task();
  }

  task() {
    Future(() async {
      await general_library.permission.flutter_auto_request_all();

      await general_library.sim_card.getSimcards();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("app"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FutureBuilder(
            future: general_library.sms.getAllThreads(),
            builder: (context, snapshot) {
              List<SmsThreadInfoData> threads = (snapshot.data ?? []);
              return MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                removeTop: true,
                removeLeft: true,
                removeRight: true,
                child: ListView.builder(
                  itemCount: threads.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          minVerticalPadding: 8,
                          minLeadingWidth: 4,
                          leading: CircleAvatar(
                            child: () {
                              try {} catch (e) {}
                              return const Icon(Icons.people);
                            }(),
                          ),
                          title: Text(
                            threads[index].contact.address,
                            style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              // color: Colors.black,
                            ),
                          ),
                          subtitle: Text(
                            threads[index].messages.last.body,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  },
                ),
              );
            },
          )
//
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Future(() async {
            var res = await general_library.app.screenshot_current_widget();
            print(res);
            //   for (var element in (await general_library.sms.getAllThreads())) {
            //     // for (var element_msg in element.messages) {
            //     print("MSG: ${element.messages.last.body}");
            //     // }
            //   }
          });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
