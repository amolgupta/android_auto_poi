import 'dart:convert';

class POIItem {
  final String title;
  final String subtitle;
  final double latitude;
  final double longitude;
  final int stopNumber;
  final String id;

  POIItem({
    required this.id,
    required this.stopNumber,
    required this.title,
    required this.subtitle,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stopNumber': stopNumber,
      "title": title,
      "subtitle": subtitle,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory POIItem.fromMap(Map<String, dynamic> map) {
    return POIItem(
      id: map['id'],
      stopNumber: map['stopNumber'],
      title: map['title'],
      subtitle: map['subtitle'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory POIItem.fromJson(String source) => POIItem.fromMap(json.decode(source));
}
