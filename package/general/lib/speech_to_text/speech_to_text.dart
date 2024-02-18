export 'speech_to_text_core.dart'; 
/// Describes the goal of your speech recognition to the system.
///
/// Currently only supported on **iOS**.
///
/// See also:
/// * https://developer.apple.com/documentation/speech/sfspeechrecognitiontaskhint
enum ListenModeType {
  /// The device default.
  deviceDefault,

  /// When using captured speech for text entry.
  ///
  /// Use this when you are using speech recognition for a task that's similar to the keyboard's built-in dictation function.
  dictation,

  /// When using captured speech to specify search terms.
  ///
  /// Use this when you are using speech recognition to identify search terms.
  search,

  /// When using captured speech for short, confirmation-style requests.
  ///
  /// Use this when you are using speech recognition to handle confirmation commands, such as "yes", "no" or "maybe".
  confirmation,
}