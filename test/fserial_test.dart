import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fserial/fserial.dart';

void main() {
  const MethodChannel channel = MethodChannel('fserial');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Fserial.platformVersion, '42');
  });
}
