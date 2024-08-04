import 'package:flutter_test/flutter_test.dart';
import 'package:android_auto_poi/android_auto_poi.dart';
import 'package:android_auto_poi/android_auto_poi_platform_interface.dart';
import 'package:android_auto_poi/android_auto_poi_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAndroidAutoPoiPlatform
    with MockPlatformInterfaceMixin
    implements AndroidAutoPoiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AndroidAutoPoiPlatform initialPlatform = AndroidAutoPoiPlatform.instance;

  test('$MethodChannelAndroidAutoPoi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAndroidAutoPoi>());
  });

  test('getPlatformVersion', () async {
    AndroidAutoPoi androidAutoPoiPlugin = AndroidAutoPoi();
    MockAndroidAutoPoiPlatform fakePlatform = MockAndroidAutoPoiPlatform();
    AndroidAutoPoiPlatform.instance = fakePlatform;

    expect(await androidAutoPoiPlugin.getPlatformVersion(), '42');
  });
}
