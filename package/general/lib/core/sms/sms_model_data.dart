/* <!-- START LICENSE -->


This Software / Program / Source Code Created By Developer From Company GLOBAL CORPORATION
Social Media:

   - Youtube: https://youtube.com/@Global_Corporation 
   - Github: https://github.com/globalcorporation
   - TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

All code script in here created 100% original without copy / steal from other code if we copy we add description source at from top code

If you wan't edit you must add credit me (don't change)

If this Software / Program / Source Code has you

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
// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

import 'package:general/core/utils.dart';

/// UncompleteDocumentation
class SmsPhotoInfoData {
  /// UncompleteDocumentation
  Uint8List? bytes;

  /// UncompleteDocumentation
  SmsPhotoInfoData({
    required this.bytes,
  });
}

/// UncompleteDocumentation
class SmsContactInfoData {
  /// UncompleteDocumentation
  String full_name;

  /// UncompleteDocumentation
  String first_name;

  /// UncompleteDocumentation

  String last_name;

  /// UncompleteDocumentation
  String address;

  /// UncompleteDocumentation
  SmsPhotoInfoData thumbnail;

  /// UncompleteDocumentation
  SmsPhotoInfoData photo;

  /// UncompleteDocumentation
  SmsContactInfoData({
    required this.full_name,
    required this.first_name,
    required this.last_name,
    required this.address,
    required this.thumbnail,
    required this.photo,
  });
}

/// UncompleteDocumentation
class SmsThreadInfoData {
  /// UncompleteDocumentation
  int id;

  /// UncompleteDocumentation
  String address;

  /// UncompleteDocumentation
  SmsContactInfoData contact;

  /// UncompleteDocumentation
  List<SmsMessageInfoData> messages = [];

  /// UncompleteDocumentation
  SmsThreadInfoData({
    required this.id,
    required this.address,
    required this.contact,
    required this.messages,
  });

  /// UncompleteDocumentation
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

/// UncompleteDocumentation
class SmsMessageInfoData {
  /// UncompleteDocumentation
  int id;

  /// UncompleteDocumentation
  int thread_id;

  /// UncompleteDocumentation
  int sim;

  /// UncompleteDocumentation
  String address;

  /// UncompleteDocumentation
  String body;

  /// UncompleteDocumentation

  bool read;

  /// UncompleteDocumentation
  DateTime date;

  /// UncompleteDocumentation
  DateTime date_sent;

  // SmsMessageKind kind;
  // SmsMessageState state = SmsMessageState.None;
  // final StreamController<SmsMessageState> _stateStreamController =
  // StreamController<SmsMessageState>();
  /// UncompleteDocumentation
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

  /// UncompleteDocumentation

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
