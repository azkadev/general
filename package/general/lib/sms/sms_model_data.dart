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


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names
 
import 'dart:typed_data';

import 'package:general/utils.dart';

class SmsPhotoInfoData { 
  Uint8List? bytes;
  SmsPhotoInfoData({ 
    required this.bytes,
  });
  
}

class SmsContactInfoData {
  String full_name;
  String first_name;
  String last_name;
  String address;
  SmsPhotoInfoData thumbnail;
  SmsPhotoInfoData photo;
  SmsContactInfoData({
    required this.full_name,
    required this.first_name,
    required this.last_name,
    required this.address,
    required this.thumbnail,
    required this.photo,
  });
}

class SmsThreadInfoData {
  int id;
  String address;
  SmsContactInfoData contact;
  List<SmsMessageInfoData> messages = [];
  SmsThreadInfoData({
    required this.id,
    required this.address,
    required this.contact,
    required this.messages,
  });

  Map toJson() {
    return {
      "@type": "simCardInfoData",
    };
  }

  @override
  String toString() {
    return GeneralUtils.to_string_pretty(data: toJson());
  }
}

class SmsMessageInfoData {

  int id;
  int thread_id;
  int sim;
  String address;
  String body;
  bool read;
  DateTime date;
  DateTime date_sent;
  // SmsMessageKind kind;
  // SmsMessageState state = SmsMessageState.None;
  // final StreamController<SmsMessageState> _stateStreamController =
      // StreamController<SmsMessageState>();
  SmsMessageInfoData({
    required this.id,
    required this.thread_id,
    required this.sim,
    required this.address,
    required this.body,
    required this.read,
    required this.date,
    required this.date_sent,
  });

  Map toJson() {
    return {
      "@type": "simCardInfoData",
    };
  }

  @override
  String toString() {
    return GeneralUtils.to_string_pretty(data: toJson());
  }
}
