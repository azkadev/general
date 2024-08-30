#import "SmsFlutterPlugin.h"
#if __has_include(<sms_flutter/sms_flutter-Swift.h>)
#import <sms_flutter/sms_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "sms_flutter-Swift.h"
#endif

@implementation SmsFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SmsFlutterPlugin registerWithRegistrar:registrar];
}
@end
