import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_auto_poi_platform_interface.dart';
import 'item.dart';

class MethodChannelAndroidAutoPoi extends AndroidAutoPoiPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('android_auto_poi');

  @override
  Future<void> syncLocations({required List<Item> items}) async {
    await methodChannel.invokeMethod('syncLocations', {
      'items': items.map((e) => e.toJson()).toList(),
    });
  }
}
