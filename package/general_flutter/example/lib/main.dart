// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps

/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// /* <!-- START LICENSE -->

// Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION
// Social Media:

// - Youtube: https://youtube.com/@Global_Corporation
// - Github: https://github.com/globalcorporation
// - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

// Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

// Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

// Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

// Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

// <!-- END LICENSE --> */
// import 'dart:async';

// // import 'package:example/joy.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/services.dart' as services;
// import 'package:flutter/widgets.dart';
// import 'package:general_flutter/general_flutter.dart';
// import "package:flutter/physics.dart" as physics;

// void main(List<String> args) async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GeneralLibraryAppBaseFlutter.static_setFullScreen(true);
//   GeneralLibraryAppBaseFlutter.static_setPreferredOrientations(orientations: [
//     GeneralLibraryAppDeviceOrientationType.landscapeLeft,
//   ]);
//   runApp(const App());
// }

// class App extends StatefulWidget {
//   const App({super.key});

//   @override
//   State<App> createState() => _AppState();
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: ScreenPage(),
//     );
//   }
// }

// class ScreenPage extends StatefulWidget {
//   const ScreenPage({super.key});

//   @override
//   State<ScreenPage> createState() => _ScreenPageState();
// }

// class DenyutController {
//   late AnimationController animationController;
//   late Animation<double> scaleAnimation;
//   void Function() onTap;
//   DenyutController({
//     required this.onTap,
//   });
//   void init({
//     required TickerProvider tickerProvider,
//     double animationBegin = 1.0,
//     double animationEnd = 1.2,
//   }) {
//     animationController = AnimationController(
//       duration: Durations.short2,
//       vsync: tickerProvider,
//     );
//     scaleAnimation = Tween<double>(
//       begin: animationBegin,
//       end: animationEnd,
//     ).animate(animationController);
//   }

//   void dispose() {
//     animationController.dispose();
//   }

//   void tap({
//     required void Function() onFinished,
//   }) {
//     onTap();
//     animationController.forward().then((value) {
//       animationController.reverse();
//       onFinished();
//     });
//   }
// }

// class DenyutWidget extends StatefulWidget {
//   final DenyutController denyutController;
//   const DenyutWidget({
//     super.key,
//     required this.denyutController,
//   });

//   @override
//   State<DenyutWidget> createState() => _DenyutWidgetState();
// }

// class _DenyutWidgetState extends State<DenyutWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// class _ScreenPageState extends State<ScreenPage> with TickerProviderStateMixin {
//   DenyutController denyutController = DenyutController(
//     onTap: () {
//       print("tap");
//     },
//   );
//   DenyutController denyutController_two = DenyutController(
//     onTap: () {
//       print("tap");
//     },
//   );
//   Color _widgetColor = Colors.blue; // Initial color for the widget

//   @override
//   void initState() {
//     super.initState();
//     denyutController_two.init(
//       tickerProvider: this,
//     );
//     denyutController.init(
//       tickerProvider: this,
//     );
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       task();
//     });
//   }

//   task() {
//     Future(() async {
//       Timer.periodic(Duration(milliseconds: 500), time);
//     });
//   }

//   time(timer) async {
//     // denyutController.tap();
//   }

//   @override
//   void dispose() {
//     denyutController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Joystick(
//           onChanged: (offset) {
//             print('Joystick position: $offset');
//           },
//           onReleased: () {
//             print('Joystick released');
//           },
//         ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _widgetColor = Colors.grey;
//                 });
//                 denyutController_two.tap(
//                   onFinished: () {
//                     setState(() {
//                       _widgetColor = Colors.blue;
//                     });
//                     // print("FINSIEHD");
//                   },
//                 );
//               },
//               child: ScaleTransition(
//                 scale: denyutController_two.scaleAnimation,
//                 child: Container(
//                   width: 200.0,
//                   height: 200.0,
//                   color: _widgetColor, // Use the modified color
//                 ),
//               ),
//             ),
//           ),

//           Padding(
//             padding: EdgeInsets.all(10),
//             child: GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _widgetColor = Colors.grey;
//                 });
//                 denyutController.tap(
//                   onFinished: () {
//                     setState(() {
//                       _widgetColor = Colors.blue;
//                     });
//                     // print("FINSIEHD");
//                   },
//                 );
//               },
//               child: ScaleTransition(
//                 scale: denyutController.scaleAnimation,
//                 child: Container(
//                   width: 200.0,
//                   height: 200.0,
//                   color: _widgetColor, // Use the modified color
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//   //
//   //

// //   // Map tombol Xbox
// //   Map<String, String> _xboxButtons = {
// //     'A': 'assets/images/xbox_a.png',
// //     'B': 'assets/images/xbox_b.png',
// //     'X': 'assets/images/xbox_x.png',
// //     'Y': 'assets/images/xbox_y.png',
// //     'DPadUp': 'assets/images/xbox_dpad_up.png',
// //     'DPadDown': 'assets/images/xbox_dpad_down.png',
// //     'DPadLeft': 'assets/images/xbox_dpad_left.png',
// //     'DPadRight': 'assets/images/xbox_dpad_right.png',
// //     'Start': 'assets/images/xbox_start.png',
// //     'Back': 'assets/images/xbox_back.png',
// //     'LeftStick': 'assets/images/xbox_left_stick.png',
// //     'RightStick': 'assets/images/xbox_right_stick.png',
// //   };

// //   // Animasi
// //   Map<String, AnimationController> _animationControllers = {};
// //   Map<String, Animation<double>> _scaleAnimations = {};

// //   // Tombol yang ditekan saat ini
// //   String _pressedButton = "";

// //   @override
// //   void initState() {
// //     super.initState();

// //     // Inisialisasi animasi untuk setiap tombol
// //     _xboxButtons.forEach((buttonName, buttonImage) {
// //       _animationControllers[buttonName] = AnimationController(
// //         duration: Duration(milliseconds: 200),
// //         vsync: this,
// //       );
// //       _scaleAnimations[buttonName] = Tween<double>(
// //         begin: 1.0,
// //         end: 0.8,
// //       ).animate(_animationControllers[buttonName]!);
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     // Hapus semua animasi
// //     _animationControllers.forEach((buttonName, controller) => controller.dispose());
// //     super.dispose();
// //   }

// //   void _onTapDown(String buttonName) {
// //     // Putar suara efek di sini (opsional)
// //     // Anda dapat menggunakan pustaka suara seperti 'audioplayers' atau 'flutter_sound'

// //     setState(() {
// //       _pressedButton = buttonName;
// //     });
// //     _animationControllers[buttonName]!.forward();
// //   }

// //   void _onTapUp(String buttonName) {
// //     setState(() {
// //       _pressedButton = "";
// //     });
// //     _animationControllers[buttonName]!.reverse();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(

// //       body: Center(
// //         child: Container(
// //           width: 400.0,
// //           height: 400.0,
// //           decoration: BoxDecoration(
// //             border: Border.all(color: Colors.black),
// //           ),
// //           child: Stack(
// //             children: [
// //               Joystick(),
// //               // Posisikan tombol-tombol
// //               Positioned(
// //                 top: 50.0,
// //                 left: 50.0,
// //                 child: _buildButton('A'),
// //               ),
// //               Positioned(
// //                 top: 50.0,
// //                 right: 50.0,
// //                 child: _buildButton('B'),
// //               ),
// //               Positioned(
// //                 bottom: 50.0,
// //                 left: 50.0,
// //                 child: _buildButton('X'),
// //               ),
// //               Positioned(
// //                 bottom: 50.0,
// //                 right: 50.0,
// //                 child: _buildButton('Y'),
// //               ),
// //               // Posisikan tombol D-Pad
// //               Positioned(
// //                 top: 150.0,
// //                 left: 150.0,
// //                 child: _buildDpadButton('DPadUp'),
// //               ),
// //               Positioned(
// //                 bottom: 150.0,
// //                 left: 150.0,
// //                 child: _buildDpadButton('DPadDown'),
// //               ),
// //               Positioned(
// //                 left: 100.0,
// //                 top: 150.0,
// //                 child: _buildDpadButton('DPadLeft'),
// //               ),
// //               Positioned(
// //                 right: 100.0,
// //                 top: 150.0,
// //                 child: _buildDpadButton('DPadRight'),
// //               ),
// //               // Posisikan tombol Start dan Back
// //               Positioned(
// //                 top: 50.0,
// //                 left: 150.0,
// //                 child: _buildButton('Start'),
// //               ),
// //               Positioned(
// //                 top: 50.0,
// //                 right: 150.0,
// //                 child: _buildButton('Back'),
// //               ),
// //               // Posisikan joystick
// //               Positioned(
// //                 top: 100.0,
// //                 left: 250.0,
// //                 child: _buildJoystick('LeftStick'),
// //               ),
// //               Positioned(
// //                 top: 100.0,
// //                 right: 250.0,
// //                 child: _buildJoystick('RightStick'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildButton(String buttonName) {
// //     return GestureDetector(
// //       onTapDown: (_) => _onTapDown(buttonName),
// //       onTapUp: (_) => _onTapUp(buttonName),
// //       child: ScaleTransition(
// //         scale:  _scaleAnimations[buttonName]!,
// //         child: Container(
// //           width: 50.0,
// //           height: 50.0,
// //           // decoration: BoxDecoration(
// //           //   image: DecorationImage(
// //           //     image: AssetImage(_xboxButtons[buttonName]),
// //           //     fit: BoxFit.contain,
// //           //   ),
// //           // ),
// //           child: Text(buttonName),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDpadButton(String buttonName) {
// //     return GestureDetector(
// //       onTapDown: (_) => _onTapDown(buttonName),
// //       onTapUp: (_) => _onTapUp(buttonName),
// //       child: ScaleTransition(
// //         scale: _scaleAnimations[buttonName]!,
// //         child: Container(
// //           width: 30.0,
// //           height: 30.0,
// //           decoration: BoxDecoration(
// //             // image: DecorationImage(
// //             //   image: AssetImage(_xboxButtons[buttonName]),
// //             //   fit: BoxFit.contain,
// //             // ),
// //           ),
// //           child: Text(buttonName),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildJoystick(String buttonName) {
// //     return GestureDetector(
// //       onTapDown: (_) => _onTapDown(buttonName),
// //       onTapUp: (_) => _onTapUp(buttonName),
// //       child: Container(
// //         width: 50.0,
// //         height: 50.0,
// //         decoration: BoxDecoration(
// //           border: Border.all(color: Colors.black),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class Joystick extends StatefulWidget {
// //   @override
// //   _JoystickState createState() => _JoystickState();
// // }

// // class _JoystickState extends State<Joystick> {
// //   // Posisi joystick
// //   double _joystickX = 0.0;
// //   double _joystickY = 0.0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onPanDown: (details) => _onPanDown(details),
// //       onPanUpdate: (details) => _onPanUpdate(details),
// //       child: Container(
// //         width: 100.0,
// //         height: 100.0,
// //         decoration: BoxDecoration(
// //           border: Border.all(color: Colors.black),
// //         ),
// //         child: Stack(
// //           children: [
// //             // Posisikan knob joystick
// //             Positioned(
// //               left: _joystickX,
// //               top: _joystickY,
// //               child: Container(
// //                 width: 50.0,
// //                 height: 50.0,
// //                 decoration: BoxDecoration(
// //                   color: Colors.red,
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _onPanDown(DragDownDetails details) {
// //     // Perbarui posisi joystick saat ditekan
// //     _joystickX = details.localPosition.dx;
// //     _joystickY = details.localPosition.dy;
// //   }

// //   void _onPanUpdate(DragUpdateDetails details) {
// //     // Perbarui posisi joystick saat digeser
// //     _joystickX = details.localPosition.dx.clamp(0.0, 100.0);
// //     _joystickY = details.localPosition.dy.clamp(0.0, 100.0);
// //   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:general_flutter/battery/battery.dart';
import 'package:general_flutter/general_flutter.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  bool is_loading = true;
  GeneralLibraryBatteryBaseFlutter generalLibraryBatteryBaseFlutter = GeneralLibraryBatteryBaseFlutter();
  GeneralLibraryAppBaseFlutter generalLibraryAppBaseFlutter = GeneralLibraryAppBaseFlutter();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {});

      unawaited(task());
    });
  }

  Future<void> task() async {
    setState(() {
      is_loading = true;
    });

    await tasks();

    setState(() {
      is_loading = false;
    });
  }

  String status = "";
  Future<void> tasks() async {
    generalLibraryBatteryBaseFlutter.status_realtime.listen((event) {
      status = event.name;
      print("slebew");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (is_loading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Battery: ${status}",
          ),
          FutureBuilder(
            future: generalLibraryAppBaseFlutter.wake_lock_is_enabled(),
            builder: (context, snapshot) {
              return Text(
                "Wake Lock: ${snapshot.data}",
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await generalLibraryAppBaseFlutter.wake_lock_toggle(enable: true)
;
          setState(() {});
          // print(await generalLibraryBatteryBaseFlutter.battery.batteryLevel);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
