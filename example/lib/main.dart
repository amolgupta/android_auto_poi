import 'package:android_auto_poi/item.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:android_auto_poi/android_auto_poi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const Center(
          child: Text('Check android auto screen!'),
        ),
      ),
    );
  }
}
