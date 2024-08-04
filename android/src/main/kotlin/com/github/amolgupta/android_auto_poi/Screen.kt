package com.github.amolgupta.android_auto_poi

import android.content.Intent
import android.net.Uri
import android.text.Spannable
import android.text.SpannableString
import androidx.annotation.OptIn
import androidx.car.app.CarContext
import androidx.car.app.Screen
import androidx.car.app.annotations.ExperimentalCarApi
import androidx.car.app.model.CarLocation
import androidx.car.app.model.Distance
import androidx.car.app.model.DistanceSpan
import androidx.car.app.model.ItemList
import androidx.car.app.model.Metadata
import androidx.car.app.model.PlaceListMapTemplate
import androidx.car.app.model.PlaceMarker
import androidx.car.app.model.Row
import androidx.car.app.model.Template

internal class Screen(carContext: CarContext) : Screen(carContext) {
    @OptIn(ExperimentalCarApi::class)
    override fun onGetTemplate(): Template {

        val itemListBuilder = ItemList.Builder()
            .setNoItemsMessage("No places to show")
        ItemRepository.getItems().forEach {
            itemListBuilder.addItem(
                Row.Builder()
                    .setTitle(it.name)
                    .addText(SpannableString(" ").apply {
                        setSpan(
                            DistanceSpan.create(
                                Distance.create(Math.random() * 100, Distance.UNIT_KILOMETERS)
                            ), 0, 1, Spannable.SPAN_INCLUSIVE_INCLUSIVE
                        )
                    })
                    .setBrowsable(true)
                    .setNumericDecoration(it.stopNumber)
                    .setOnClickListener {
                        startNavigation(it.lat, it.lon)
                    }
                    .setMetadata(
                        Metadata.Builder()
                            .setPlace(
                                androidx.car.app.model.Place.Builder(
                                    CarLocation.create(
                                        it.lat,
                                        it.lon
                                    )
                                )
                                    .setMarker(PlaceMarker.Builder().build())
                                    .build()
                            )
                            .build()
                    ).build()
            )
        }
        return PlaceListMapTemplate.Builder()
            .setTitle("Relay Drops for today")
            .setItemList(itemListBuilder.build())
            .build()
    }

    private fun startNavigation(latitude: Double, longitude: Double) {

        val intent = Intent(Intent.ACTION_VIEW).apply {
            data = Uri.parse("google.navigation:q=$latitude,$longitude")
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK) // Add this flag
            setPackage("com.google.android.apps.maps") // Ensure it opens with Google Maps
        }
        carContext.startActivity(intent)
    }
}
