// ignore_for_file: non_constant_identifier_names, empty_catches

import 'package:flutter/material.dart';

import 'package:general_flutter/general_flutter.dart';

class DevicePage extends StatefulWidget {
  const DevicePage({super.key});
  @override
  State<DevicePage> createState() => _DevicePageState();
}

class _DevicePageState extends State<DevicePage> {
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
      await general_library.device.android_is_development_mode_enable; // detek rom is debug
      await general_library.device.android_is_on_external_storage;
      await general_library.device.can_mock_location; 
      await general_library.device.is_jailbroken; // detek root / or jailbreak
      await general_library.device.is_real_device; // detek emulator or not
      await general_library.device.is_safe_device; // 
    });
  }

  // --- code
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
