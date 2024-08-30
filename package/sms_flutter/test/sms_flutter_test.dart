import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sms_flutter/sms_flutter.dart';

void main() {
  const MethodChannel channel = MethodChannel('plugins.elyudde.com/querySMS');
  SmsQuery smsQuery = SmsQuery();

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return [];
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getAllSms', () async {
    expect(await smsQuery.getAllSms, []);
  });
}
