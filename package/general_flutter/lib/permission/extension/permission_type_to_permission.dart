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
// ignore_for_file: deprecated_member_use
import 'package:general/pemission/pemission_type.dart';
import 'package:permission_handler/permission_handler.dart';

extension ExtensionPermissionTypeToPermission on PermissionType {
  Permission get toPermission {
    if (this == PermissionType.calendar) {
      return Permission.calendar;
    }

    if (this == PermissionType.camera) {
      return Permission.camera;
    }

    if (this == PermissionType.contacts) {
      return Permission.contacts;
    }

    if (this == PermissionType.location) {
      return Permission.location;
    }

    if (this == PermissionType.locationAlways) {
      return Permission.locationAlways;
    }

    if (this == PermissionType.locationWhenInUse) {
      return Permission.locationWhenInUse;
    }

    if (this == PermissionType.mediaLibrary) {
      return Permission.mediaLibrary;
    }

    if (this == PermissionType.microphone) {
      return Permission.microphone;
    }

    if (this == PermissionType.phone) {
      return Permission.phone;
    }

    if (this == PermissionType.photos) {
      return Permission.photos;
    }

    if (this == PermissionType.photosAddOnly) {
      return Permission.photosAddOnly;
    }

    if (this == PermissionType.reminders) {
      return Permission.reminders;
    }

    if (this == PermissionType.sensors) {
      return Permission.sensors;
    }

    if (this == PermissionType.sms) {
      return Permission.sms;
    }

    if (this == PermissionType.speech) {
      return Permission.speech;
    }

    if (this == PermissionType.storage) {
      return Permission.storage;
    }

    if (this == PermissionType.ignoreBatteryOptimizations) {
      return Permission.ignoreBatteryOptimizations;
    }

    if (this == PermissionType.notification) {
      return Permission.notification;
    }

    if (this == PermissionType.accessMediaLocation) {
      return Permission.accessMediaLocation;
    }

    if (this == PermissionType.activityRecognition) {
      return Permission.activityRecognition;
    }

    if (this == PermissionType.unknown) {
      return Permission.unknown;
    }

    if (this == PermissionType.bluetooth) {
      return Permission.bluetooth;
    }

    if (this == PermissionType.manageExternalStorage) {
      return Permission.manageExternalStorage;
    }

    if (this == PermissionType.systemAlertWindow) {
      return Permission.systemAlertWindow;
    }

    if (this == PermissionType.requestInstallPackages) {
      return Permission.requestInstallPackages;
    }

    if (this == PermissionType.appTrackingTransparency) {
      return Permission.appTrackingTransparency;
    }

    if (this == PermissionType.criticalAlerts) {
      return Permission.criticalAlerts;
    }

    if (this == PermissionType.accessNotificationPolicy) {
      return Permission.accessNotificationPolicy;
    }

    if (this == PermissionType.bluetoothScan) {
      return Permission.bluetoothScan;
    }

    if (this == PermissionType.bluetoothAdvertise) {
      return Permission.bluetoothAdvertise;
    }

    if (this == PermissionType.bluetoothConnect) {
      return Permission.bluetoothConnect;
    }

    if (this == PermissionType.nearbyWifiDevices) {
      return Permission.nearbyWifiDevices;
    }

    if (this == PermissionType.videos) {
      return Permission.videos;
    }

    if (this == PermissionType.audio) {
      return Permission.audio;
    }

    if (this == PermissionType.scheduleExactAlarm) {
      return Permission.scheduleExactAlarm;
    }

    if (this == PermissionType.sensorsAlways) {
      return Permission.sensorsAlways;
    }

    if (this == PermissionType.calendarWriteOnly) {
      return Permission.calendarWriteOnly;
    }

    if (this == PermissionType.calendarFullAccess) {
      return Permission.calendarFullAccess;
    }

    if (this == PermissionType.assistant) {
      return Permission.assistant;
    }

    if (this == PermissionType.backgroundRefresh) {
      return Permission.backgroundRefresh;
    }

    return Permission.unknown;
  }
}

extension ExtensionListPermissionTypeToPermission on List<PermissionType> {
  List<Permission> get toPermissions {
    return map((e) => e.toPermission).toList();
  }
}
