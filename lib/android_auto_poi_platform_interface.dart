import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_auto_poi_method_channel.dart';

abstract class AndroidAutoPoiPlatform extends PlatformInterface {
  /// Constructs a AndroidAutoPoiPlatform.
  AndroidAutoPoiPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidAutoPoiPlatform _instance = MethodChannelAndroidAutoPoi();

  /// The default instance of [AndroidAutoPoiPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidAutoPoi].
  static AndroidAutoPoiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidAutoPoiPlatform] when
  /// they register themselves.
  static set instance(AndroidAutoPoiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
