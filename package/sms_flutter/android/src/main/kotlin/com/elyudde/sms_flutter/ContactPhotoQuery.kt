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
import java.io.ByteArrayOutputStream
import java.io.IOException
import java.io.InputStream


/**
 * Created by crazygenius on 1/08/21.
 */
internal class ContactPhotoQueryHandler(
    private val context: Context,
    private val result: MethodChannel.Result,
    private val photoUri: String?,
    private val fullSize: Boolean
) :
    RequestPermissionsResultListener {
    private val permissionsList = arrayOf(Manifest.permission.READ_CONTACTS)
    fun handle(permissions: Permissions) {
        if (permissions.checkAndRequestPermission(
                permissionsList,
                Permissions.READ_CONTACT_ID_REQ
            )
        ) {
            if (fullSize) {
                queryContactPhoto()
            } else {
                queryContactThumbnail()
            }
        }
    }

    @TargetApi(Build.VERSION_CODES.ECLAIR)
    private fun queryContactThumbnail() {
        val uri = Uri.withAppendedPath(
            ContactsContract.AUTHORITY_URI,
            photoUri
        )
        val cursor = context.contentResolver.query(
            uri,
            arrayOf(ContactsContract.CommonDataKinds.Photo.PHOTO),
            null,
            null,
            null
        )
            ?: return
        try {
            if (cursor.moveToFirst()) {
                result.success(cursor.getBlob(0))
            }
        } finally {
            cursor.close()
        }
    }

    @TargetApi(Build.VERSION_CODES.ECLAIR)
    private fun queryContactPhoto() {
        val uri = Uri.withAppendedPath(
            ContactsContract.AUTHORITY_URI,
            photoUri
        )
        try {
            val fd = context.contentResolver.openAssetFileDescriptor(
                uri, "r"
            )
            if (fd != null) {
                val stream: InputStream = fd.createInputStream()
                val bytes = getBytesFromInputStream(stream)
                stream.close()
                result.success(bytes)
            }
        } catch (e: IOException) {
            e.printStackTrace()
        }
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
            queryContactPhoto()
            return true
        }
        result.error("#01", "permission denied", null)
        return false
    }

    companion object {
        @Throws(IOException::class)
        fun getBytesFromInputStream(`is`: InputStream): ByteArray {
            val os = ByteArrayOutputStream()
            val buffer = ByteArray(0xFFFF)
            var len = `is`.read(buffer)
            while (len != -1) {
                os.write(buffer, 0, len)
                len = `is`.read(buffer)
            }
            return os.toByteArray()
        }
    }
}

internal class ContactPhotoQuery(val context: Context, private val binding: ActivityPluginBinding) : MethodCallHandler {
    private val permissions: Permissions = Permissions(context, binding.activity as FlutterFragmentActivity)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method != "getContactPhoto") {
            result.notImplemented()
            return
        }
        if (!call.hasArgument("photoUri")) {
            result.error("#02", "missing argument 'photoUri'", null)
            return
        }
        val photoUri = call.argument<String>("photoUri")
        val fullSize = call.hasArgument("fullSize") && call.argument<Any>("fullSize") as Boolean
        val handler = ContactPhotoQueryHandler(context, result, photoUri, fullSize)
        binding.addRequestPermissionsResultListener(handler)
        handler.handle(permissions)
    }

}
