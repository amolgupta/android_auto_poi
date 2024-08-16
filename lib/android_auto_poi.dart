import 'package:flutter/services.dart';
import 'item.dart';

class AndroidAutoPoi {
  static const methodChannel = MethodChannel('android_auto_poi');
  static const EventChannel _eventChannel = EventChannel('android_auto_poi_events');

  static void setListener(Function(String) listener) {
    _eventChannel.receiveBroadcastStream().listen((locationId) {
      listener(locationId);
    });
  }

  static Future<void> syncLocations({required List<POIItem> items}) async {
    await methodChannel.invokeMethod('syncLocations', {
      'items': items.map((e) => e.toJson()).toList(),
    });
  }
}
