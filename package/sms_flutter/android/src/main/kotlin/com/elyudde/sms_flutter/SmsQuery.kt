package com.elyudde.sms_flutter

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.database.Cursor
import android.net.Uri
import com.elyudde.sms_flutter.permisions.Permissions
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.PluginRegistry.RequestPermissionsResultListener
import org.json.JSONException
import org.json.JSONObject
import java.util.*


/**
 * Created by crazygenius on 1/08/21.
 */
internal enum class SmsQueryRequest {
    Inbox, Sent, Draft;

    fun toUri(): Uri {
        return when {
            this == Inbox -> {
                Uri.parse("content://sms/inbox")
            }
            this == Sent -> {
                Uri.parse("content://sms/sent")
            }
            else -> {
                Uri.parse("content://sms/draft")
            }
        }
    }
}

internal class SmsQueryHandler(
    private val context: Context,
    private val result: MethodChannel.Result,
    private val request: SmsQueryRequest,
    start: Int,
    count: Int,
    threadId: Int,
    address: String?
) :
    RequestPermissionsResultListener {
    private val permissionsList = arrayOf(Manifest.permission.READ_SMS)
    private var start = 0
    private var count = -1
    private var threadId = -1
    private var address: String? = null
    fun handle(permissions: Permissions) {
        if (permissions.checkAndRequestPermission(permissionsList, Permissions.SEND_SMS_ID_REQ)) {
            querySms()
        }
    }

    private fun readSms(cursor: Cursor): JSONObject {
        val res = JSONObject()
        for (idx in 0 until cursor.columnCount) {
            try {
                if (cursor.getColumnName(idx) == "address" || cursor.getColumnName(idx) == "body") {
                    res.put(cursor.getColumnName(idx), cursor.getString(idx))
                } else if (cursor.getColumnName(idx) == "date" || cursor.getColumnName(idx) == "date_sent") {
                    res.put(cursor.getColumnName(idx), cursor.getLong(idx))
                } else {
                    res.put(cursor.getColumnName(idx), cursor.getInt(idx))
                }
            } catch (e: JSONException) {
                e.printStackTrace()
            }
        }
        return res
    }

    private fun querySms() {
        val list = ArrayList<JSONObject>()
        val cursor =
            context.contentResolver.query(request.toUri(), null, null, null, null)
        if (cursor == null) {
            result.error("#01", "permission denied", null)
            return
        }
        if (!cursor.moveToFirst()) {
            cursor.close()
            result.success(list)
            return
        }
        do {
            val obj = readSms(cursor)
            try {
                if (threadId >= 0 && obj.getInt("thread_id") != threadId) {
                    continue
                }
                if (address != null && obj.getString("address") != address) {
                    continue
                }
            } catch (e: JSONException) {
                e.printStackTrace()
            }
            if (start > 0) {
                start--
                continue
            }
            list.add(obj)
            if (count > 0) {
                count--
            }
        } while (cursor.moveToNext() && count != 0)
        cursor.close()
        result.success(list)
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
        if (isOk) {
            querySms()
            return true
        }
        result.error("#01", "permission denied", null)
        return false
    }

    init {
        this.start = start
        this.count = count
        this.threadId = threadId
        this.address = address
    }
}

internal class SmsQuery(val context: Context, private val binding: ActivityPluginBinding) : MethodCallHandler {
    private val permissions: Permissions = Permissions(context, binding.activity as FlutterFragmentActivity)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        var start = 0
        var count = -1
        var threadId = -1
        var address: String? = null
        val request: SmsQueryRequest = when (call.method) {
            "getInbox" -> SmsQueryRequest.Inbox
            "getSent" -> SmsQueryRequest.Sent
            "getDraft" -> SmsQueryRequest.Draft
            else -> {
                result.notImplemented()
                return
            }
        }
        if (call.hasArgument("start")) {
            start = call.argument<Int>("start")!!
        }
        if (call.hasArgument("count")) {
            count = call.argument<Int>("count")!!
        }
        if (call.hasArgument("thread_id")) {
            threadId = call.argument<Int>("thread_id")!!
        }
        if (call.hasArgument("address")) {
            address = call.argument<String>("address")
        }
        val handler = SmsQueryHandler(context, result, request, start, count, threadId, address)
        binding.addRequestPermissionsResultListener(handler)
        handler.handle(permissions)
    }

}
