package com.elyudde.sms_flutter

import android.Manifest
import android.annotation.TargetApi
import android.content.Context
import android.content.pm.PackageManager
import android.net.Uri
import android.os.Build
import android.provider.ContactsContract
import com.elyudde.sms_flutter.permisions.Permissions
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener
import org.json.JSONException
import org.json.JSONObject


/**
 * Created by crazygenius on 1/08/21.
 */
internal class ContactQueryHandler(
    private val context: Context,
    private val result: MethodChannel.Result,
    private val contactAddress: String?
) :
    RequestPermissionsResultListener {
    private val permissionsList = arrayOf(Manifest.permission.READ_CONTACTS)
    fun handle(permissions: Permissions) {
        if (permissions.checkAndRequestPermission(
                permissionsList,
                Permissions.READ_CONTACT_ID_REQ
            )
        ) {
            queryContact()
        }
    }

    @TargetApi(Build.VERSION_CODES.HONEYCOMB)
    private fun queryContact() {
        val uri = Uri.withAppendedPath(
            ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(
                contactAddress
            )
        )
        val projection = arrayOf(
            ContactsContract.PhoneLookup.DISPLAY_NAME,
            ContactsContract.PhoneLookup.PHOTO_URI,
            ContactsContract.PhoneLookup.PHOTO_THUMBNAIL_URI
        )
        val obj = JSONObject()
        val cursor = context.contentResolver.query(uri, projection, null, null, null)
        if (cursor != null) {
            if (cursor.moveToFirst()) {
                try {
                    obj.put("name", cursor.getString(0))
                    obj.put("photo", cursor.getString(1))
                    obj.put("thumbnail", cursor.getString(2))
                } catch (e: JSONException) {
                    e.printStackTrace()
                }
            }
            cursor.close()
        }
        result.success(obj)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ): Boolean {
        if (requestCode != Permissions.READ_CONTACT_ID_REQ) {
            return false
        }
        var isOk = true
        for (res in grantResults) {
            if (res != PackageManager.PERMISSION_GRANTED) {
                isOk = false
                break
            }
        }
        if (isOk) {
            queryContact()
            return true
        }
        result.error("#01", "permission denied", null)
        return false
    }
}

internal class ContactQuery(val context: Context, private val binding: ActivityPluginBinding) : MethodCallHandler {
    private val permissions: Permissions = Permissions(context, binding.activity as FlutterFragmentActivity)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method != "getContact") {
            result.notImplemented()
        } else if (!call.hasArgument("address")) {
            result.error("#02", "missing argument 'address'", null)
        } else {
            val contactAddress = call.argument<String>("address")
            val handler = ContactQueryHandler(context, result, contactAddress)
            binding.addRequestPermissionsResultListener(handler)
            handler.handle(permissions)
        }
    }

}
