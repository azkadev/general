package com.elyudde.sms_flutter.permisions

import android.annotation.TargetApi
import androidx.fragment.app.FragmentActivity
import android.os.Build


/**
 * Created by crazygenius on 1/08/21.
 */
internal class PermissionsRequest(
    private val id: Int,
    private val permissions: Array<String>,
    private val activity: FragmentActivity
) {
    @TargetApi(Build.VERSION_CODES.M)
    fun execute() {
        activity.requestPermissions(permissions, id)
    }
}
