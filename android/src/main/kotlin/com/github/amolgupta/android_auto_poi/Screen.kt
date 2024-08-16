package com.github.amolgupta.android_auto_poi


import android.Manifest
import android.content.Intent
import android.net.Uri
import android.service.credentials.Action
import android.text.Spannable
import android.text.SpannableString
import androidx.annotation.OptIn
import androidx.car.app.CarAppService
import androidx.car.app.CarContext
import androidx.car.app.Screen
import androidx.car.app.Session
import androidx.car.app.annotations.ExperimentalCarApi
import androidx.car.app.model.CarLocation
import androidx.car.app.model.ItemList
import androidx.car.app.model.Metadata
import androidx.car.app.model.PlaceListMapTemplate
import androidx.car.app.model.PlaceMarker
import androidx.car.app.model.Row
import androidx.car.app.model.Template


internal class Screen(carContext: CarContext) : Screen(carContext) {

    private var hasLocationPermission = false

    init {
        carContext.requestPermissions(
            listOf(
                Manifest.permission.ACCESS_FINE_LOCATION
            )
        ) { granted, _ ->
            if (granted.contains(
                    Manifest.permission.ACCESS_FINE_LOCATION
                )
            ) {
                hasLocationPermission = true
            }
        }
    }


    @OptIn(ExperimentalCarApi::class)
    override fun onGetTemplate(): Template {

        val itemListBuilder = ItemList.Builder()
            .setNoItemsMessage("No places to show")
        ItemRepository.getItems().forEach { it ->
            itemListBuilder.addItem(itemRow(it))
        }

        val builder = PlaceListMapTemplate.Builder()
            .setItemList(itemListBuilder.build())

        if (hasLocationPermission) {
            builder.setCurrentLocationEnabled(true)
        }

        return builder
            .build()
    }

    private fun itemRow(it: PoiItem): Row {
        return Row.Builder()
            .setTitle(it.title)
            .addText(SpannableString(it.subtitle))
            .setBrowsable(true)
            .setNumericDecoration(it.stopNumber)

            .setOnClickListener {
                AndroidAutoPoiPlugin.events?.success(it.id)
                startNavigation(it.latitude, it.longitude)
            }
            .setMetadata(
                Metadata.Builder()
                    .setPlace(
                        androidx.car.app.model.Place.Builder(
                            CarLocation.create(
                                it.latitude,
                                it.longitude
                            )
                        )
                            .setMarker(PlaceMarker.Builder().build())
                            .build()
                    )
                    .build()
            )
            .build()
    }

    private fun startNavigation(latitude: Double, longitude: Double) {
        val intent = Intent(Intent.ACTION_VIEW).apply {
            data = Uri.parse("geo:$latitude,$longitude?q=$latitude,$longitude");
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK) // Add this flag
            setPackage("com.google.android.apps.maps") // Ensure it opens with Google Maps
        }
        carContext.startActivity(intent)
    }

}
