import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_auto_poi_platform_interface.dart';

/// An implementation of [AndroidAutoPoiPlatform] that uses method channels.
class MethodChannelAndroidAutoPoi extends AndroidAutoPoiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_auto_poi');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
