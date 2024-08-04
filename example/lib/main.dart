import 'package:android_auto_poi/item.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
  final _androidAutoPoiPlugin = AndroidAutoPoi();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    _androidAutoPoiPlugin.syncLocations(items: [
      Item(
          name: 'Home',
          id: 1,
          stopNumber: 1,
          latitude: 37.4219999,
          longitude: -122.0840575),
      Item(
          name: 'Work',
          id: 2,
          stopNumber: 2,
          latitude: 37.4219999,
          longitude: -122.0840575),
    ]);
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
