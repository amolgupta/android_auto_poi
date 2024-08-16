package com.github.amolgupta.android_auto_poi

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class AndroidAutoPoiPlugin: FlutterPlugin, EventChannel.StreamHandler {
  private lateinit var channel : MethodChannel
  private lateinit var eventChannel: EventChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "android_auto_poi")
    channel.setMethodCallHandler { call, result ->
      if (call.method == "syncLocations") {
        ItemRepository.clear()
        call.argument<List<String>>("items")?.map {
          ItemRepository.addItem(PoiItem.fromArgs(it))
        } ?: result.error("NULL_ITEMS", "No items provided for syncing", null)
      } else {
        result.notImplemented()
      }
    }
    eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "android_auto_poi_events")
    eventChannel.setStreamHandler(this)
  }


  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
    AndroidAutoPoiPlugin.events = events!!
  }

  override fun onCancel(arguments: Any?) {
    events?.endOfStream()
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    eventChannel.setStreamHandler(null)
  }

  companion object {
    var events: EventChannel.EventSink? = null
  }
}