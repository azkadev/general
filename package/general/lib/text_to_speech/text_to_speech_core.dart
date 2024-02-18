// ignore_for_file: non_constant_identifier_names

class GeneralLibraryTextToSpeechBase {
  GeneralLibraryTextToSpeechBase();

  Future<void> dispose() async {}
  Future<void> initialized() async {}

  Future<void> speak({
    required String text,
    double volume = 1.0,
    double pitch = 1.0,
    double rate = 0.5,
  }) async {}


}
