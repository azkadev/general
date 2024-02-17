// ignore_for_file: non_constant_identifier_names

class GeneralLibraryNotificationBase {
  GeneralLibraryNotificationBase();

  Future<bool> initialize({
    required String notificationTitle,
    required String notificationMessage,
  }) async {
    return false;
  }

  Future<bool> get has_permissions async {
    return false;
  }

  Future<bool> get enable_background async {
    return false;
  }

  bool get is_background {
    return false;
  }

  Future<bool> get disable_background async {
    return false;
  }
}
