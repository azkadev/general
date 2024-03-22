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
// // ignore_for_file: non_constant_identifier_names

// import 'package:general_dart/general_dart.dart';
// import 'package:general_flutter/location/extension/position_to_gene.dart';
// import 'package:general_lib/general_lib.dart';
// import 'package:geolocator/geolocator.dart';

// class GeneralLibraryLocationBaseFlutter implements GeneralLibraryLocationBase {
//   GeneralLibraryLocationBaseFlutter();
//   GeolocatorPlatform geolocator = GeolocatorPlatform.instance;

//   @override
//   bool get is_support_geolocator {
//     if (dart.isLinux) {
//       if (dart.isWeb == false) {
//         return false;
//       }
//     }
//     return true;
//   }

//   @override
//   Future<bool> hashPermission() async {
//     if (is_support_geolocator) {
//       bool serviceEnabled = await geolocator.isLocationServiceEnabled();
//       if (!serviceEnabled) {
//         return false;
//       }
//       LocationPermission permission = await geolocator.checkPermission();
//       if (permission == LocationPermission.denied) {
//         permission = await geolocator.requestPermission();
//         if (permission == LocationPermission.denied) {
//           return false;
//         }
//       }
//       if (permission == LocationPermission.deniedForever) {
//         return false;
//       }
//       return true;
//     }
//     return false;
//   }

//   @override
//   Future<GeneralLibraryLocationPositionData?> getCurrent() async {
//     if (is_support_geolocator) {
//       Position position = await geolocator.getCurrentPosition();
//       return position.toGeneralLibraryLocationPositionData();
//     }
//     return null;
//   }

//   @override
//   double bearingBetween({
//     required double startLatitude,
//     required double startLongitude,
//     required double endLatitude,
//     required double endLongitude,
//   }) {
//     return GeneralLibraryLocationBase().bearingBetween(startLatitude: startLatitude, startLongitude: startLongitude, endLatitude: endLatitude, endLongitude: endLongitude);
//   }

//   @override
//   double distanceBetween({required double startLatitude, required double startLongitude, required double endLatitude, required double endLongitude}) {
//     return GeneralLibraryLocationBase().distanceBetween(startLatitude: startLatitude, startLongitude: startLongitude, endLatitude: endLatitude, endLongitude: endLongitude);
//   }
// }
