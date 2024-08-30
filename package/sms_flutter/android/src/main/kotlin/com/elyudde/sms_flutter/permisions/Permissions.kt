package com.elyudde.sms_flutter.permisions

import android.content.Context
import android.content.pm.PackageManager
import android.os.Build
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener


/**
 * Created by crazygenius on 1/08/21.
 */
class Permissions(private val context: Context, val activity: FlutterFragmentActivity) {
    private fun hasPermission(permission: String): Boolean {
        return (Build.VERSION.SDK_INT < Build.VERSION_CODES.M
                || context.checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED)
    }

    private fun hasPermissions(permissions: Array<String>): Boolean {
        for (perm in permissions) {
            if (!hasPermission(perm)) {
                return false
            }
        }
        return true
    }


    fun checkAndRequestPermission(permissions: Array<String>, id: Int): Boolean {
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
            return true
        }
        if (!hasPermissions(permissions)) {
            PermissionsRequestHandler.requestPermissions(
                PermissionsRequest(id, permissions, activity)
            )
            return false
        }
        return true
    }

    companion object {
        const val RECV_SMS_ID_REQ = 1
        const val SEND_SMS_ID_REQ = 2
        const val READ_SMS_ID_REQ = 3
        const val READ_CONTACT_ID_REQ = 4
        const val BROADCAST_SMS = 5
        const val READ_PHONE_STATE = 6
        private val requestsListener = PermissionsRequestHandler()
        val requestsResultsListener: RequestPermissionsResultListener
            get() = requestsListener
    }
}
