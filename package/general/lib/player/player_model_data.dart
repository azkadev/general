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
abstract class GeneralLibraryPlayerPlayableBase {
  /// {@macro playable}
  const GeneralLibraryPlayerPlayableBase();
}

class GeneralLibraryPlayerMediaBase extends GeneralLibraryPlayerPlayableBase {
  String resource;
  Map<String, dynamic>? extras;
  Map<String, String>? httpHeaders;
  GeneralLibraryPlayerMediaBase(
    this.resource, {
    this.extras,
    this.httpHeaders,
  });
}

class GeneralLibraryPlayerPlayListBase extends GeneralLibraryPlayerPlayableBase {
  /// Currently opened [List] of [Media]s.
  final List<GeneralLibraryPlayerMediaBase> medias;

  /// Currently playing [index].
  final int index;

  /// {@macro playlist}
  const GeneralLibraryPlayerPlayListBase(
    this.medias, {
    this.index = 0,
  });
}
