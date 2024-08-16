package com.github.amolgupta.android_auto_poi

import androidx.car.app.CarAppService
import androidx.car.app.validation.HostValidator

class Service : CarAppService() {
    override fun createHostValidator() = HostValidator.ALLOW_ALL_HOSTS_VALIDATOR

    override fun onCreateSession() = Session()

}