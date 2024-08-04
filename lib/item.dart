import 'dart:convert';

class Item {
  final String name;
  final double latitude;
  final double longitude;
  final int stopNumber;
  final int id;

  Item({
    required this.id,
    required this.stopNumber,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stopNumber': stopNumber,
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      stopNumber: map['stopNumber'],
      name: map['name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
