// ignore_for_file: non_constant_identifier_names

class GeneralLibraryNotificationBase {

  GeneralLibraryNotificationBase();
  
  bool get is_support_awesome_notification {
    return false;
  }
  Future<bool> initialize({
    required String notificationTitle,
    required String notificationMessage,
  }) async {
    return false;
  }
  Future<bool> createSimpleNotification({
    required String title,
    required String text,
  }) async {
    return false;
  }
}
