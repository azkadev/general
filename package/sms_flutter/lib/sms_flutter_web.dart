import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;

import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:url_launcher/url_launcher.dart';

/// A web implementation of the SmsFlutter plugin.
class SmsFlutterPlugin extends PlatformInterface {
  SmsFlutterPlugin() : super(token: _token);

  static final Object _token = Object();

  static SmsFlutterPlugin _instance = SmsFlutterPlugin();

  /// The default instance of [SmsFlutterPlugin] to use.
  ///
  /// Defaults to [MethodChannelSmsFlutterPlugin].
  static SmsFlutterPlugin get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [SmsFlutterPlugin] when they register themselves.
  static set instance(SmsFlutterPlugin instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'plugins.elyudde.com/sendSMS',
      const JSONMethodCodec(),
      registrar,
    );

    final pluginInstance = SmsFlutterPlugin();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'sendSMS':
        return sendSMS(call.arguments['address'].toString(),
            call.arguments['body'].toString());
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'sms_flutter for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  String get separator => isCupertino() ? "&" : "?";
  Future sendSMS(String address, String body) async {
    final _body = Uri.encodeComponent(body);
    return launchUrl(Uri.parse('sms:$address${separator}body=$_body'));
  }
}

bool isCupertino() {
  final _devices = [
    'iPad Simulator',
    'iPhone Simulator',
    'iPod Simulator',
    'iPad',
    'iPhone',
    'iPod',
    'Mac OS X',
  ];
  final String _agent = html.window.navigator.userAgent;
  for (final device in _devices) {
    if (_agent.contains(device)) {
      return true;
    }
  }
  return false;
}
