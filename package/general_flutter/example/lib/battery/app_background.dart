// ignore_for_file: non_constant_identifier_names, empty_catches, unused_local_variable

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});
  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  // ini bisa pakai generaldart dan anda bebas mengatur di manapun
  GeneralFlutter general_library = GeneralFlutter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      task();
    });
    // task();
  }

  void task() {
    Future(() async {
      await general_library.battery.is_save_mode;
      await general_library.battery.level;
      await general_library.battery.status_type;
      // get realtime device battery charger or discharge
      general_library.battery.status_realtime.listen((event) {
        print(event);
      });
    });
  }

  // --- code
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
