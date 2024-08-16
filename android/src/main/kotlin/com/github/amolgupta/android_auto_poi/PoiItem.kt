package com.github.amolgupta.android_auto_poi

import com.google.gson.Gson
import com.google.gson.annotations.SerializedName
import androidx.annotation.Keep

@Keep
data class PoiItem(
    @SerializedName("id") val id: String,
    @SerializedName("title") val title: String,
    @SerializedName("subtitle") val subtitle: String,
    @SerializedName("lat") val lat: Double,
    @SerializedName("lon") val lon: Double,
    @SerializedName("stopNumber") val stopNumber: Int
){
    companion object {
        fun fromArgs(json: String): PoiItem {
            val gson = Gson()
            return gson.fromJson(json, PoiItem::class.java)
        }
    }
}