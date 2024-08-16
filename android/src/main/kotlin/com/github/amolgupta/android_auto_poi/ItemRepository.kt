package com.github.amolgupta.android_auto_poi

class ItemRepository {

    companion object {
        private val items = mutableListOf<PoiItem>()

        fun addItem(item: PoiItem) {
            items.add(item)
        }

        fun getItems(): List<PoiItem> {
            return items
        }

        fun clear() {
            items.clear()
        }
    }
}