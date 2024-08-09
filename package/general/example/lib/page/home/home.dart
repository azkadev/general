import 'package:example/model/feature.dart';
import 'package:example/page/battery/battery.dart';
import 'package:example/page/camera/camera.dart';
import 'package:example/page/device/device.dart';
import 'package:example/page/gamepad/gamepad.dart';
import 'package:example/page/local_auth/local_auth.dart';
import 'package:example/page/permission/permission.dart';
import 'package:example/page/sim_card/sim_card.dart';
import 'package:example/page/speech_to_text/speech_to_text.dart';
import 'package:example/page/text_to_speech/text_to_speech.dart';
import 'package:flutter/material.dart';
import 'package:general_lib_flutter/general_lib_flutter.dart';

class HomePageGeneralApp extends StatefulWidget {
  const HomePageGeneralApp({super.key});

  @override
  State<HomePageGeneralApp> createState() => _HomePageGeneralAppState();
}

class _HomePageGeneralAppState extends State<HomePageGeneralApp> {
  final ScrollControllerAutoKeepStateData scrollControllerAutoKeepStateData =
      ScrollControllerAutoKeepStateData(
    keyId: "home_page_general_app",
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((d) {
      task();
    });
  }

  @override
  void dispose() {
    scrollControllerAutoKeepStateData.dispose();
    super.dispose();
  }

  task() async {
    setState(() {});
    Future(() async {});
  }

  List<GeneralFeatureData> get generalFeatureDatas => [
        GeneralFeatureData(
          title: "App",
          iconData: Icons.apps,
          onTap: (BuildContext context) {},
        ),
        GeneralFeatureData(
          title: "App Background",
          iconData: Icons.extension,
          onTap: (BuildContext context) {},
        ),
        GeneralFeatureData(
          title: "Battery",
          iconData: Icons.battery_full,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const BatteryPage();
              },
            ));
          },
        ),
        GeneralFeatureData(
          title: "Camera",
          iconData: Icons.camera,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const CameraPage();
              },
            ));
          },
        ),
        GeneralFeatureData(
          title: "Device",
          iconData: Icons.devices,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const DevicePage();
              },
            ));
          },
        ),
        GeneralFeatureData(
          title: "Gamepad / Joystick",
          iconData: Icons.gamepad,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const GamePadPage();
              },
            ));
          },
        ),
        GeneralFeatureData(
          title: "Local Auth",
          iconData: Icons.fingerprint,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const LocalAuthPage();
              },
            ));
          },
        ),
        GeneralFeatureData(
          title: "Location",
          iconData: Icons.location_pin,
          onTap: (BuildContext context) {},
        ),
        GeneralFeatureData(
          title: "Notification",
          iconData: Icons.notifications,
          onTap: (BuildContext context) {},
        ),
        GeneralFeatureData(
          title: "Permission",
          iconData: Icons.security,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const PermissionPage();
              },
            ));
          },
        ),
        GeneralFeatureData(
          title: "Player",
          iconData: Icons.play_circle_rounded,
          onTap: (BuildContext context) {},
        ),
        GeneralFeatureData(
          title: "Sim Card",
          iconData: Icons.sim_card,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const SimCardPage();
              },
            ));
          },
        ),
        GeneralFeatureData(
          title: "Sms",
          iconData: Icons.sms,
          onTap: (BuildContext context) {},
        ),
        GeneralFeatureData(
          title: "Speech To Text",
          iconData: Icons.text_format,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const SpeechToTextPage();
              },
            ));
          },
        ),
        GeneralFeatureData(
          title: "Text To Speech",
          iconData: Icons.voice_chat,
          onTap: (BuildContext context) {
            context.navigator().push(MaterialPageRoute(
              builder: (context) {
                return const TextToSpeechPage();
              },
            ));
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page General App"),
      ),
      body: scrollControllerAutoKeepStateData.builderWidget(
        builder: (context, pageStorageBucket) {
          return SingleChildScrollView(
            controller: scrollControllerAutoKeepStateData.scroll_controller,
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: context.height,
                minWidth: context.width,
              ),
              child: Builder(
                builder: (context) {
                  final List<Widget> children = [];
                  children.add(SizedBox(
                    height: context.mediaQueryData.padding.top,
                  ));

                  final List<GeneralFeatureData> general_feature_datas =
                      generalFeatureDatas;
                  for (var i = 0; i < general_feature_datas.length; i++) {
                    final GeneralFeatureData generalFeatureData =
                        general_feature_datas[i];
                    final ListTile child = ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      leading: Icon(generalFeatureData.iconData),
                      title: Text(generalFeatureData.title),
                      onTap: () {
                        handleFunction(
                          onFunction: (context, statefulWidget) async {
                            await generalFeatureData.onTap(context);
                            setState(() {});
                          },
                        );
                      },
                    );
                    children.add(child);
                  }

                  children.add(SizedBox(
                    height: context.mediaQueryData.padding.bottom,
                  ));
                  return Column(
                    children: children,
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
