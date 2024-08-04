package com.github.amolgupta.android_auto_poi

import android.util.Log

class ItemRepository {

    companion object {
        private val items = mutableListOf<Item>()

        fun addItem(item: Item) {
            Log.d("ItemRepository", "Adding item: $item)")
            items.add(item)
        }

        fun getItems(): List<Item> {
            Log.d("ItemRepository", "Reading items)")
            return items
        }
    }
}