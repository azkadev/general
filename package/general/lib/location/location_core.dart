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
// // ignore_for_file: non_constant_identifier_names

// import 'dart:math';

// import 'package:general/general.dart';

// class GeneralLibraryLocationBase {
//   GeneralLibraryLocationBase();

//   bool get is_support_geolocator {
//     return false;
//   }

//   Future<bool> hashPermission() async {
//     return false;
//   }

//   // @override
//   Future<GeneralLibraryLocationPositionData?> getCurrent() async {
//     return null;
//   }

//   double distanceBetween({
//     required double startLatitude,
//     required double startLongitude,
//     required double endLatitude,
//     required double endLongitude,
//   }) {
//     var earthRadius = 6378137.0;
//     var dLat = _toRadians(endLatitude - startLatitude);
//     var dLon = _toRadians(endLongitude - startLongitude);
//     var a = pow(sin(dLat / 2), 2) + pow(sin(dLon / 2), 2) * cos(_toRadians(startLatitude)) * cos(_toRadians(endLatitude));
//     var c = 2 * asin(sqrt(a));
//     return earthRadius * c;
//   }

//   static _toRadians(double degree) {
//     return degree * pi / 180;
//   }

//   /// Constant factor to convert and angle from degrees to radians.
//   final double _degrees2Radians = pi / 180.0;

//   /// Constant factor to convert and angle from radians to degrees.
//   final double _radians2Degrees = 180.0 / pi;

//   /// Convert [radians] to degrees.
//   double _degrees(double radians) => radians * _radians2Degrees;

//   /// Convert [degrees] to radians.
//   double _radians(double degrees) => degrees * _degrees2Radians;

//   double bearingBetween({
//    required double startLatitude,
//    required double startLongitude,
//    required double endLatitude,
//    required double endLongitude,
//   }) {
//     var startLongitudeRadians = _radians(startLongitude);
//     var startLatitudeRadians = _radians(startLatitude);
//     var endLongitudeRadians = _radians(endLongitude);
//     var endLatitudeRadians = _radians(endLatitude);

//     var y = sin(endLongitudeRadians - startLongitudeRadians) * cos(endLatitudeRadians);
//     var x = cos(startLatitudeRadians) * sin(endLatitudeRadians) - sin(startLatitudeRadians) * cos(endLatitudeRadians) * cos(endLongitudeRadians - startLongitudeRadians);

//     return _degrees(atan2(y, x));
//   }
// }
