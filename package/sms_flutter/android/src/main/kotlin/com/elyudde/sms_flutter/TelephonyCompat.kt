package com.elyudde.sms_flutter

import android.content.ContentResolver
import android.content.Context
import android.database.Cursor
import android.net.Uri
import android.os.Build
import android.provider.BaseColumns
import android.provider.Telephony
import java.util.*


/**
 * This code is taken from:
 * https://android.googlesource.com/platform/packages/apps/ContactsCommon/+/7aba85a08c4729123a55341e8a0f9eb5a89e1a14/src/com/android/contacts/common/compat/TelephonyThreadsCompat.java
 */
internal object TelephonyCompat {
    /**
     * Copied from [Telephony.Threads.getOrCreateThreadId]
     */
    private fun getOrCreateThreadIdInternal(context: Context, recipient: String): Long {
        val recipients: MutableSet<String> = HashSet()
        recipients.add(recipient)
        return getOrCreateThreadIdInternal(context, recipients)
    }
    // Below is code copied from Telephony and SqliteWrapper
    /**
     * Private `content://` style URL for this table.
     */
    private val THREAD_ID_CONTENT_URI = Uri.parse("content://mms-sms/threadID")
    fun getOrCreateThreadId(context: Context, recipient: String): Long {
        return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            Telephony.Threads.getOrCreateThreadId(context, recipient)
        } else {
            getOrCreateThreadIdInternal(context, recipient)
        }
    }

    /**
     * Given the recipients list and subject of an unsaved message,
     * return its thread ID.  If the message starts a new thread,
     * allocate a new thread ID.  Otherwise, use the appropriate
     * existing thread ID.
     *
     *
     * Find the thread ID of the same set of recipients (in any order,
     * without any additions). If one is found, return it. Otherwise,
     * return a unique thread ID.
     */
    private fun getOrCreateThreadIdInternal(context: Context, recipients: Set<String>): Long {
        val uriBuilder = THREAD_ID_CONTENT_URI.buildUpon()
        for (recipient in recipients) {
            uriBuilder.appendQueryParameter("recipient", recipient)
        }
        val uri = uriBuilder.build()
        val cursor = query(
            context.contentResolver, uri, arrayOf(BaseColumns._ID)
        )
        if (cursor != null) {
            try {
                if (cursor.moveToFirst()) {
                    return cursor.getLong(0)
                }
            } finally {
                cursor.close()
            }
        }
        throw IllegalArgumentException("Unable to find or allocate a thread ID.")
    }

    private fun query(resolver: ContentResolver, uri: Uri, projection: Array<String>): Cursor? {
        return try {
            resolver.query(uri, projection, null, null, null)
        } catch (e: Exception) {
            null
        }
    }
}