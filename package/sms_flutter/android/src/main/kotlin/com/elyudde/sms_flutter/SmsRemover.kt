package com.elyudde.sms_flutter

import android.content.ContentValues
import android.content.Context
import android.content.pm.PackageManager
import android.net.Uri
import android.util.Log
import com.elyudde.sms_flutter.permisions.Permissions
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener


/**
 * Created by crazygenius on 1/08/21.
 */
class SmsRemover internal constructor(val context: Context, private val binding: ActivityPluginBinding) :
    RequestPermissionsResultListener,
    MethodCallHandler {
    private val permissions: Permissions = Permissions(context, binding.activity as FlutterFragmentActivity)
    private fun deleteSms(id: Int, thread_id: Int): Boolean {
        try {
            context.contentResolver.delete(
                Uri.parse("content://sms"),
                "thread_id=? and _id=?",
                arrayOf(thread_id.toString(), id.toString())
            )
            Log.i("DELETE-SMS", "deleted sms with id: $id")
        } catch (e: Exception) {
            Log.e(ContentValues.TAG, "deleteSms: id + $id", e)
            return false
        }
        return true
    }

    override fun onMethodCall(methodCall: MethodCall, result: MethodChannel.Result) {
        when (methodCall.method) {
            "removeSms" -> if (methodCall.hasArgument("id")) {
                Log.i(
                    "SMSREMOVER",
                    "method called for removing sms: " + methodCall.argument<Any>("id")
                )
                result.success(
                    deleteSms(
                        methodCall.argument<Any>("id").toString().toInt(),
                        methodCall.argument<Any>("thread_id").toString().toInt()
                    )
                )
            }
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ): Boolean {
        if (requestCode != Permissions.READ_SMS_ID_REQ) {
            return false
        }
        var isOk = true
        for (res in grantResults) {
            if (res != PackageManager.PERMISSION_GRANTED) {
                isOk = false
                break
            }
        }
        return isOk
    }

    init {

        binding.addRequestPermissionsResultListener(this)
    }
}


