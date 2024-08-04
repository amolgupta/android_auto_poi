import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_auto_poi_method_channel.dart';
import 'item.dart';

abstract class AndroidAutoPoiPlatform extends PlatformInterface {
  AndroidAutoPoiPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidAutoPoiPlatform _instance = MethodChannelAndroidAutoPoi();

  static AndroidAutoPoiPlatform get instance => _instance;

  static set instance(AndroidAutoPoiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> syncLocations({required List<Item> items}) async {
    throw UnimplementedError('syncLocations() has not been implemented.');
  }
}
