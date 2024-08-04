
import 'android_auto_poi_platform_interface.dart';

class AndroidAutoPoi {
  Future<String?> getPlatformVersion() {
    return AndroidAutoPoiPlatform.instance.getPlatformVersion();
  }
}
