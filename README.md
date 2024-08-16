# Flutter android_auto_poi

Flutter plugin for android auto POI apps.


### Example Usage
It's as simple as invoking `syncLocations` method with a list of `POIItem` objects and attaching a listener to listen for the selected item id.

```dart
AndroidAutoPoi.syncLocations(items: [
      POIItem(
          title: 'Monmouth Coffee',
          subtitle: '27 Monmouth St, London WC2H 9EU',
          id: "abc",
          stopNumber: 1,
          latitude: 51.5136,
          longitude: -0.0923),
      POIItem(
          title: 'Flat White',
          subtitle: '17 Berwick St, London W1F 0PT',
          id: "def",
          stopNumber: 2,
          latitude: 51.5154,
          longitude: -0.1360),
      POIItem(
          title: 'Kaffeine',
          subtitle: '66 Great Titchfield St, London W1W 7QJ',
          id: "123",
          stopNumber: 3,
          latitude: 51.5188,
          longitude: -0.1420),
      POIItem(
          title: 'The Espresso Room',
          subtitle: '31-35 Great Ormond St, London WC1N 3HZ',
          id: "456",
          stopNumber: 4,
          latitude: 51.5226,
          longitude: -0.1245),
    ]);
AndroidAutoPoi.setListener((id) => {print('Location id: $id')});
```



