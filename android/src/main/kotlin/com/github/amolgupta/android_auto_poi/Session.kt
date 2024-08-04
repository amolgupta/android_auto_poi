package com.github.amolgupta.android_auto_poi

import android.content.Intent
import androidx.car.app.Screen
import androidx.car.app.Session

class Session : Session() {
    override fun onCreateScreen(intent: Intent): Screen {
        return Screen(carContext)
    }
}