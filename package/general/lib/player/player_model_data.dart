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
