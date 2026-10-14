package com.github.knighting.cygnus.core.credential_database

import android.content.Context
import com.github.knighting.cygnus.core.types.URLCredential
import com.github.knighting.cygnus.core.types.URLProtectionSpace

open class CredentialDatabase private constructor(
  db: CredentialDatabaseHelper,
  protectionSpaceDao: URLProtectionSpaceDao,
  credentialDao: URLCredentialDao
) {

  @JvmField
  var protectionSpaceDao: URLProtectionSpaceDao = protectionSpaceDao

  @JvmField
  var credentialDao: URLCredentialDao = credentialDao

  @JvmField
  var db: CredentialDatabaseHelper = db

  fun getHttpAuthCredentials(host: String?, protocol: String?, realm: String?, port: Int?): MutableList<URLCredential> {
    var credentials: MutableList<URLCredential> = ArrayList()
    val protectionSpace = protectionSpaceDao.find(host, protocol, realm, port)
    if (protectionSpace != null) {
      credentials = credentialDao.getAllByProtectionSpaceId(protectionSpace.id)
    }
    return credentials
  }

  fun clearAllAuthCredentials() {
    db.clearAllTables(db.writableDatabase)
  }

  fun removeHttpAuthCredentials(host: String?, protocol: String?, realm: String?, port: Int?) {
    val urlProtectionSpace = protectionSpaceDao.find(host, protocol, realm, port)
    if (urlProtectionSpace != null) {
      protectionSpaceDao.delete(urlProtectionSpace)
    }
  }

  fun removeHttpAuthCredential(host: String?, protocol: String?, realm: String?, port: Int?, username: String?, password: String?) {
    val protectionSpace = protectionSpaceDao.find(host, protocol, realm, port)
    if (protectionSpace != null) {
      val credential = credentialDao.find(username, password, protectionSpace.id)
      credentialDao.delete(credential!!)
    }
  }

  fun setHttpAuthCredential(host: String?, protocol: String?, realm: String?, port: Int?, username: String?, password: String?) {
    val protectionSpace = protectionSpaceDao.find(host, protocol, realm, port)
    val protectionSpaceId: Long?
    if (protectionSpace == null) {
      protectionSpaceId = protectionSpaceDao.insert(URLProtectionSpace(null, host, protocol, realm, port!!))
    } else {
      protectionSpaceId = protectionSpace.id
    }

    var credential = credentialDao.find(username, password, protectionSpaceId)
    if (credential != null) {
      var needUpdate = false
      if (!credential.username!!.equals(username)) {
        credential.username = username
        needUpdate = true
      }
      if (!credential.password!!.equals(password)) {
        credential.password = password
        needUpdate = true
      }
      if (needUpdate)
        credentialDao.update(credential)
    } else {
      credential = URLCredential(null, username!!, password!!, protectionSpaceId)
      credential.id = credentialDao.insert(credential)
    }
  }

  companion object {
    private var instance: CredentialDatabase? = null
    const val LOG_TAG = "CredentialDatabase" // package-private in Java

    // If you change the database schema, you must increment the database version.
    const val DATABASE_VERSION = 2
    const val DATABASE_NAME = "CredentialDatabase.db"

    @JvmStatic
    fun getInstance(context: Context): CredentialDatabase {
      if (instance != null)
        return instance!!
      val db = CredentialDatabaseHelper(context)
      instance = CredentialDatabase(db, URLProtectionSpaceDao(db), URLCredentialDao(db))
      return instance!!
    }
  }
}
