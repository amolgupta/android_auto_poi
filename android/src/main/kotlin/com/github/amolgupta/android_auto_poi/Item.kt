package com.github.amolgupta.android_auto_poi

import com.google.gson.Gson

data class Item(
    val id: Int,
    val name: String,
    val lat: Double,
    val lon: Double,
    val stopNumber: Int
){
    companion object {
        fun fromArgs(json: String): Item {
            val gson = Gson()
            return gson.fromJson(json, Item::class.java)
        }
    }
}