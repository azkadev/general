package com.elyudde.sms_flutter.permisions

import android.annotation.TargetApi
import android.os.Build
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener
import java.util.*
import java.util.concurrent.LinkedBlockingQueue


/**
 * Created by crazygenius on 1/08/21.
 */
internal class PermissionsRequestHandler : RequestPermissionsResultListener {
    @TargetApi(Build.VERSION_CODES.M)
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ): Boolean {
        isRequesting = requests.size > 0
        if (isRequesting) {
            requests.poll().execute()
        }
        return false
    }

    companion object {
        private val requests: Queue<PermissionsRequest> = LinkedBlockingQueue()
        private var isRequesting = false
        @TargetApi(Build.VERSION_CODES.M)
        fun requestPermissions(permissionsRequest: PermissionsRequest) {
            if (!isRequesting) {
                isRequesting = true
                permissionsRequest.execute()
            } else {
                requests.add(permissionsRequest)
            }
        }
    }
}
