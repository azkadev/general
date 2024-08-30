package com.elyudde.sms_flutter.status

import android.Manifest
import android.annotation.TargetApi
import android.content.BroadcastReceiver
import android.content.Context
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.os.Build
import com.elyudde.sms_flutter.permisions.Permissions
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener


/**
 * Created by crazygenius on 1/08/21.
 */
class SmsStateHandler(val context: Context, private val binding: ActivityPluginBinding) : EventChannel.StreamHandler,
    RequestPermissionsResultListener {
    private var smsStateChangeReceiver: BroadcastReceiver? = null
    private val permissions: Permissions
    var eventSink: EventSink? = null
    override fun onListen(argument: Any?, eventSink: EventSink) {
        this.eventSink = eventSink
        smsStateChangeReceiver = SmsStateChangeReceiver(eventSink)
        if (permissions.checkAndRequestPermission(
                arrayOf(Manifest.permission.RECEIVE_SMS),
                Permissions.BROADCAST_SMS
            )
        ) {
            registerDeliveredReceiver()
            registerSentReceiver()
        }
    }

    @TargetApi(Build.VERSION_CODES.KITKAT)
    private fun registerDeliveredReceiver() {
        context.registerReceiver(
            smsStateChangeReceiver,
            IntentFilter("SMS_DELIVERED")
        )
    }

    @TargetApi(Build.VERSION_CODES.KITKAT)
    private fun registerSentReceiver() {
        context.registerReceiver(
            smsStateChangeReceiver,
            IntentFilter("SMS_SENT")
        )
    }

    override fun onCancel(argument: Any?) {
        context.unregisterReceiver(smsStateChangeReceiver)
        smsStateChangeReceiver = null
    }

    @TargetApi(Build.VERSION_CODES.KITKAT)
    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ): Boolean {
        if (requestCode != Permissions.BROADCAST_SMS) {
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
            registerDeliveredReceiver()
            registerSentReceiver()
            return true
        }
        eventSink!!.error("#01", "permission denied", null)
        return false
    }

    init {
        permissions = Permissions(context, binding.activity as FlutterFragmentActivity)
        binding.addRequestPermissionsResultListener(this)
    }
}
