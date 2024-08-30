package com.elyudde.sms_flutter

import android.Manifest
import android.annotation.TargetApi
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.os.Build
import android.provider.Telephony
import android.telephony.SmsManager
import android.telephony.SmsMessage
import android.util.Log
import com.elyudde.sms_flutter.permisions.Permissions
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.EventChannel.EventSink
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener
import org.json.JSONObject
import java.util.*


/**
 * Created by crazygenius on 1/08/21.
 */
internal class SmsReceiver(val context: Context, private val binding: ActivityPluginBinding) : EventChannel.StreamHandler,
    RequestPermissionsResultListener {
    private var receiver: BroadcastReceiver? = null
    private val permissions: Permissions = Permissions(context, binding.activity as FlutterFragmentActivity)
    private val permissionsList =
        arrayOf(Manifest.permission.RECEIVE_SMS, Manifest.permission.READ_SMS)
    private var sink: EventSink? = null

    @TargetApi(Build.VERSION_CODES.KITKAT)
    override fun onListen(arguments: Any?, events: EventSink) {
        receiver = createSmsReceiver(events)
        context
            .registerReceiver(receiver, IntentFilter(Telephony.Sms.Intents.SMS_RECEIVED_ACTION))
        sink = events
        permissions.checkAndRequestPermission(permissionsList, Permissions.RECV_SMS_ID_REQ)
    }

    override fun onCancel(o: Any?) {
        context.unregisterReceiver(receiver)
        receiver = null
    }

    @TargetApi(Build.VERSION_CODES.KITKAT)
    private fun readMessages(intent: Intent): Array<SmsMessage> {
        return Telephony.Sms.Intents.getMessagesFromIntent(intent)
    }

    private fun createSmsReceiver(events: EventSink): BroadcastReceiver {
        return object : BroadcastReceiver() {
            @TargetApi(Build.VERSION_CODES.KITKAT)
            override fun onReceive(context: Context, intent: Intent) {
                try {
                    val msgs = readMessages(intent) ?: return
                    val obj = JSONObject()
                    obj.put("address", msgs[0].originatingAddress)
                    obj.put("date", Date().time)
                    obj.put("date_sent", msgs[0].timestampMillis)
                    obj.put(
                        "read",
                        if (msgs[0].statusOnIcc == SmsManager.STATUS_ON_ICC_READ) 1 else 0
                    )
                    obj.put(
                        "thread_id",
                        TelephonyCompat.getOrCreateThreadId(context, msgs[0].originatingAddress!!)
                    )
                    var body = ""
                    for (msg in msgs) {
                        body += msg.messageBody
                    }
                    obj.put("body", body)
                    events.success(obj)
                } catch (e: Exception) {
                    Log.d("SmsReceiver", e.toString())
                }
            }
        }
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<String>,
        grantResults: IntArray
    ): Boolean {
        if (requestCode != Permissions.RECV_SMS_ID_REQ) {
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
            return true
        }
        sink!!.endOfStream()
        return false
    }

    init {
        binding.addRequestPermissionsResultListener(this)
    }
}