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
/// Indicates the current battery state.
enum BatteryStatusType {
  /// The battery is fully charged.
  full,

  /// The battery is currently charging.
  charging,

  /// Device is connected to external power source, but not charging the battery.
  ///
  /// Usually happens when device has charge limit enabled and this limit is reached.
  /// Also, battery might be in this state if connected power source isn't powerful enough to charge the battery.
  ///
  /// Available on Android, MacOS and Linux platforms only.
  connectedNotCharging,

  /// The battery is currently losing energy.
  discharging,

  /// The state of the battery is unknown.
  unknown;
}
