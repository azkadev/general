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
import 'dart:typed_data';

import 'package:general_dart/general_dart.dart';
import 'package:sms_flutter/contact.dart';
import 'package:sms_flutter/sms_flutter.dart';

// extension ExtensionTOnThreadToToThse on Photo {
//   SmsPhotoInfoData toSmsPhotoInfoData() {
//     return SmsPhotoInfoData(
//       bytes: bytes ?? Uint8List.fromList([]),
//     );
//   }
// }

extension ExtensionTOnThreadToToThses on Photo? {
  SmsPhotoInfoData toSmsPhotoInfoData() {
    Photo? photo = this;
    if (photo != null) {
      return SmsPhotoInfoData(
        bytes: photo.bytes,
      );
    }
    return SmsPhotoInfoData(
      bytes: Uint8List.fromList([]),
    );
  }
}

extension ExtensionTOnThreadToToThsse on Contact? {
  SmsContactInfoData toSmsContactInfoData() {
    Contact? contact = this;
    if (contact != null) {
      return SmsContactInfoData(
        full_name: contact.fullName ?? "",
        first_name: contact.firstName ?? "",
        last_name: contact.lastName ?? "",
        address: contact.address ?? "",
        thumbnail: contact.thumbnail.toSmsPhotoInfoData(),
        photo: contact.photo.toSmsPhotoInfoData(),
      );
    }
    return SmsContactInfoData(
      full_name: "",
      first_name: "",
      last_name: "",
      address: "",
      thumbnail: SmsPhotoInfoData(
        bytes: Uint8List.fromList([]),
      ),
      photo: SmsPhotoInfoData(
        bytes: Uint8List.fromList([]),
      ),
    );
  }
}

extension ExtensionTOnThreadToToTheasa on SmsMessage {
  SmsMessageInfoData toSmsMessageInfoData() {
    return SmsMessageInfoData(
      id: id ?? 0,
      thread_id: threadId ?? 0,
      sim: sim ?? 0,
      address: address ?? "",
      body: body ?? "",
      read: isRead ?? false,
      date: date ?? DateTime.now(),
      date_sent: dateSent ?? DateTime.now(),
    );
  }
}

extension ExtensionTOnThreadToToTheasas on List<SmsMessage> {
  List<SmsMessageInfoData> toSmsMessageInfoDatas() {
    return map((e) {
      return e.toSmsMessageInfoData();
    }).toList();
  }
}

extension ExtensionTOnThreadToToThe on SmsThread {
  SmsThreadInfoData toSmsThreadInfoData() {
    return SmsThreadInfoData(
      id: id ?? 0,
      address: address ?? "",
      contact: contact.toSmsContactInfoData(),
      messages: messages.toSmsMessageInfoDatas(),
    );
  }
}

extension ExtensionTOnThrefadToToThes on List<SmsThread> {
  List<SmsThreadInfoData> toSmsThreadInfoDatas() {
    return map((e) {
      return e.toSmsThreadInfoData();
    }).toList();
  }
}
