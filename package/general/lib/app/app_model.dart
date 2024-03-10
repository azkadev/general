
/// Used by [SystemChrome.setPreferredOrientations].
enum GeneralLibraryAppDeviceOrientationType {
  /// If the device shows its boot logo in portrait, then the boot logo is shown
  /// in [portraitUp]. Otherwise, the device shows its boot logo in landscape
  /// and this orientation is obtained by rotating the device 90 degrees
  /// clockwise from its boot orientation.
  portraitUp,

  /// The orientation that is 90 degrees clockwise from [portraitUp].
  ///
  /// If the device shows its boot logo in landscape, then the boot logo is
  /// shown in [landscapeLeft].
  landscapeLeft,

  /// The orientation that is 180 degrees from [portraitUp].
  portraitDown,

  /// The orientation that is 90 degrees counterclockwise from [portraitUp].
  landscapeRight,
}
