import 'package:flutter/services.dart';
import 'item.dart';

/// Serves as a bridge between the Flutter app and the Android Auto POI SDK.
class AndroidAutoPoi {
  static const _methodChannel = MethodChannel('android_auto_poi');
  static const EventChannel _eventChannel =
      EventChannel('android_auto_poi_events');

  /// Sets a listener to receive location IDs.
  static void setListener(Function(String) listener) {
    _eventChannel.receiveBroadcastStream().listen((locationId) {
      listener(locationId);
    });
  }

  /// Synchronizes the locations with the Android Auto POI SDK.
  static Future<void> syncLocations({required List<POIItem> items}) async {
    await _methodChannel.invokeMethod('syncLocations', {
      'items': items.map((e) => e.toJson()).toList(),
    });
  }
}
