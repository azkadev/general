import 'package:general/pemission/pemission_type.dart';
import 'package:permission_handler/permission_handler.dart';

extension ExtensionPermissionTypeToPermission on PermissionType {
  Permission get toPermission {
    if (this == PermissionType.accessMediaLocation) {
      return Permission.accessMediaLocation;
    }

    if (this == PermissionType.accessNotificationPolicy) {
      return Permission.accessNotificationPolicy;
    }

    if (this == PermissionType.activityRecognition) {
      return Permission.activityRecognition;
    }
    if (this == PermissionType.activityRecognition) {
      return Permission.activityRecognition;
    }

    return Permission.unknown;
  }
}

extension ExtensionListPermissionTypeToPermission on List<PermissionType> {
  List<Permission> get toPermissions {
    return map((e) => e.toPermission).toList();
  }
}
