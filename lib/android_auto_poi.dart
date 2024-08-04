import 'android_auto_poi_platform_interface.dart';
import 'item.dart';

class AndroidAutoPoi {
  Future<void> syncLocations({required List<Item> items}) async {
    return AndroidAutoPoiPlatform.instance.syncLocations(items: items);
  }
}
