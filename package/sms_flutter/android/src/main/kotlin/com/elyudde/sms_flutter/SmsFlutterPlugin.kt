package com.elyudde.sms_flutter

import android.content.Context
import androidx.annotation.NonNull
import com.elyudde.sms_flutter.permisions.Permissions
import com.elyudde.sms_flutter.status.SmsStateHandler

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.*

/**
 * Created by crazygenius on 1/08/21.
 */

/** SmsFlutterPlugin */
class SmsFlutterPlugin() : FlutterPlugin, ActivityAware {
  private lateinit var context : Context

  private lateinit var receiveSmsChannel : EventChannel
  private lateinit var smsStatusChannel : EventChannel
  private lateinit var sendSmsChannel : MethodChannel
  private lateinit var removeSmsChannel : MethodChannel
  private lateinit var querySmsChannel : MethodChannel
  private lateinit var queryContactChannel : MethodChannel
  private lateinit var queryContactPhotoChannel : MethodChannel
  private lateinit var userProfileChannel : MethodChannel
  private lateinit var simCardChannel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {

    this.context = flutterPluginBinding.applicationContext

    this.receiveSmsChannel = EventChannel(flutterPluginBinding.binaryMessenger, "plugins.elyudde.com/recvSMS", JSONMethodCodec.INSTANCE)

    this.smsStatusChannel = EventChannel(flutterPluginBinding.binaryMessenger, "plugins.elyudde.com/statusSMS", JSONMethodCodec.INSTANCE)

    this.sendSmsChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugins.elyudde.com/sendSMS", JSONMethodCodec.INSTANCE)

    this.removeSmsChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "elyudde.sms.remove.channel")

    this.querySmsChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugins.elyudde.com/querySMS", JSONMethodCodec.INSTANCE)

    this.queryContactChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugins.elyudde.com/queryContact", JSONMethodCodec.INSTANCE)

    this.queryContactPhotoChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugins.elyudde.com/queryContactPhoto", StandardMethodCodec.INSTANCE)

    this.userProfileChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugins.elyudde.com/userProfile", JSONMethodCodec.INSTANCE)

    this.simCardChannel = MethodChannel(flutterPluginBinding.binaryMessenger, "plugins.elyudde.com/simCards", JSONMethodCodec.INSTANCE)

  }


  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    receiveSmsChannel.setStreamHandler(null)
    smsStatusChannel.setStreamHandler(null)
    sendSmsChannel.setMethodCallHandler(null)
    removeSmsChannel.setMethodCallHandler(null)
    querySmsChannel.setMethodCallHandler(null)
    queryContactChannel.setMethodCallHandler(null)
    queryContactPhotoChannel.setMethodCallHandler(null)
    userProfileChannel.setMethodCallHandler(null)
    simCardChannel.setMethodCallHandler(null)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    binding.addRequestPermissionsResultListener(Permissions.requestsResultsListener)

    // receive sms
    val smsReceiver = SmsReceiver(context, binding)
    receiveSmsChannel.setStreamHandler(smsReceiver)

    // send sms
    val sendSms = SmsSender(context, binding)
    sendSmsChannel.setMethodCallHandler(sendSms)

    // sms state
    val smsState = SmsStateHandler(context, binding)
    smsStatusChannel.setStreamHandler(smsState)

    // remove sms
    val smsRemover = SmsRemover(context, binding)
    removeSmsChannel.setMethodCallHandler(smsRemover)

    // sms query
    val smsQuery = SmsQuery(context, binding)
    querySmsChannel.setMethodCallHandler(smsQuery)

    // contact query
    val contactQuery = ContactQuery(context, binding)
    queryContactChannel.setMethodCallHandler(contactQuery)

    // contact photo query
    val contactPhotoQuery = ContactPhotoQuery(context, binding)
    queryContactPhotoChannel.setMethodCallHandler(contactPhotoQuery)

    // user profile
    val userProfile = UserProfileProvider(context, binding)
    userProfileChannel.setMethodCallHandler(userProfile)

    // simCard
    val simCard = SimCardsProvider(context, binding)
    simCardChannel.setMethodCallHandler(simCard)
  }

  override fun onDetachedFromActivityForConfigChanges() {
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
  }

  override fun onDetachedFromActivity() {
  }

}
