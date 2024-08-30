package com.elyudde.sms_flutter.status

import android.annotation.TargetApi
import android.app.Activity
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Build
import android.telephony.SmsManager
import android.util.Log
import io.flutter.plugin.common.EventChannel.EventSink
import org.json.JSONException
import org.json.JSONObject


/**
 * Created by crazygenius on 1/08/21.
 */
class SmsStateChangeReceiver(private val eventSink: EventSink) : BroadcastReceiver() {
    @TargetApi(Build.VERSION_CODES.KITKAT)
    override fun onReceive(context: Context, intent: Intent) {
        try {
            val stateChange = JSONObject()
            stateChange.put("sentId", intent.getIntExtra("sentId", -1))
            val action = intent.action
            when (action ?: "none") {
                "SMS_SENT" -> {
                    if (resultCode != Activity.RESULT_OK) {
                        stateChange.put("state", "fail")
                    } else {
                        stateChange.put("state", "sent")
                    }
                    Log.d("flutter_sms", "Sent result: " + sentResult(resultCode))
                }
                "SMS_DELIVERED" -> {
                    stateChange.put("state", "delivered")
                }
                else -> {
                    stateChange.put("state", "none")
                }
            }
            eventSink.success(stateChange)
        } catch (e: JSONException) {
            e.printStackTrace()
            eventSink.error("#01", e.message, null)
        }
    }

    private fun sentResult(resultCode: Int): String {
        return when (resultCode) {
            Activity.RESULT_OK -> "Activity.RESULT_OK"
            SmsManager.RESULT_ERROR_GENERIC_FAILURE -> "SmsManager.RESULT_ERROR_GENERIC_FAILURE"
            SmsManager.RESULT_ERROR_RADIO_OFF -> "SmsManager.RESULT_ERROR_RADIO_OFF"
            SmsManager.RESULT_ERROR_NULL_PDU -> "SmsManager.RESULT_ERROR_NULL_PDU"
            SmsManager.RESULT_ERROR_NO_SERVICE -> "SmsManager.RESULT_ERROR_NO_SERVICE"
            else -> "Unknown error code"
        }
    }
}
