// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:general_dart/general_dart.dart';
import 'package:general_flutter/sms/extensions/list_extension_to_threads.dart';
import 'package:general_lib/general_lib.dart';
import 'package:sms_flutter/contact.dart';
import 'package:sms_flutter/sms_flutter.dart';

class GeneralLibrarySmsBaseFlutter implements GeneralLibrarySmsBase {
  // Future<void> test() async {

  bool get isIOS => !dart.isWeb && dart.isIOS;
  bool get isAndroid => !dart.isWeb && dart.isAndroid;
  bool get isWindows => !dart.isWeb && dart.isWindows;

  bool get isWeb => dart.isWeb;

  bool get flutter_is_support_flutter_sms {
    if (dart.isLinux || dart.isWindows || dart.isMacOS) {
      if (dart.isWeb == false) {
        return false;
      }
    }
    return true;
  }

  @override
  Future<List<SmsMessageInfoData>> querySms() async {
    if (flutter_is_support_flutter_sms) {
      try {
        return (await SmsQuery().querySms()).toSmsMessageInfoDatas();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }

    return [];
  }

  @override
  Future<List<SmsThreadInfoData>> queryThreads() async {
    if (flutter_is_support_flutter_sms) {
      try {
        ContactQuery();
        return(await SmsQuery().queryThreads([])).toSmsThreadInfoDatas();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }

    return [];
  }

  @override
  Future<List<SmsMessageInfoData>> getAllSms() async {
    if (flutter_is_support_flutter_sms) {
      try {
        return (await SmsQuery().getAllSms).toSmsMessageInfoDatas();
        
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }

    return [];
  }

  @override
  Future<List<SmsThreadInfoData>> getAllThreads() async {
    if (flutter_is_support_flutter_sms) {
      try { 
        return (await SmsQuery().getAllThreads).toSmsThreadInfoDatas();
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return [];
  }

  Future<List<SmsThread>> get_threads() async {
    if (flutter_is_support_flutter_sms) {
      try {
        List<SmsThread> sms_threads = await SmsQuery().getAllThreads; 
        return sms_threads;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return [];
  }
}
