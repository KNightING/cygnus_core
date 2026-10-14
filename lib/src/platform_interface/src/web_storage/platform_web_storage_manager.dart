import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../inappwebview_platform.dart';
import '../types/main.dart';

part 'platform_web_storage_manager.g.dart';

///{@template cygnus_core.CygnusPlatformWebStorageManagerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformWebStorageManager].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebStorageManagerCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(available: '9.0'),
    LinuxPlatform(),
    MacOSPlatform(),
  ],
)
@immutable
class CygnusPlatformWebStorageManagerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformWebStorageManager].
  const CygnusPlatformWebStorageManagerCreationParams();

  ///{@template cygnus_core.CygnusPlatformWebStorageManagerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebStorageManagerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformWebStorageManager}
///Class that implements a singleton object (shared instance) which manages the web storage used by WebView instances.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformWebStorageManager.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      apiName: 'CygnusWebStorage',
      apiUrl:
          'https://developer.android.com/reference/android/webkit/CygnusWebStorage.html',
    ),
    IOSPlatform(
      apiName: 'WKWebsiteDataStore',
      apiUrl:
          'https://developer.apple.com/documentation/webkit/wkwebsitedatastore',
      available: '9.0',
    ),
    LinuxPlatform(
      apiName: 'WebKitWebsiteDataManager',
      apiUrl:
          'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/class.WebsiteDataManager.html',
    ),
    MacOSPlatform(
      apiName: 'WKWebsiteDataStore',
      apiUrl:
          'https://developer.apple.com/documentation/webkit/wkwebsitedatastore',
    ),
  ],
)
abstract class CygnusPlatformWebStorageManager extends PlatformInterface {
  /// Creates a new [CygnusPlatformWebStorageManager]
  factory CygnusPlatformWebStorageManager(
    CygnusPlatformWebStorageManagerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebStorageManager webStorageManager = CygnusWebViewPlatform
        .instance!
        .createPlatformWebStorageManager(params);
    PlatformInterface.verify(webStorageManager, _token);
    return webStorageManager;
  }

  /// Creates a new [CygnusPlatformWebStorageManager] to access static methods.
  factory CygnusPlatformWebStorageManager.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformWebStorageManager webStorageManagerStatic =
        CygnusWebViewPlatform.instance!.createPlatformWebStorageManagerStatic();
    PlatformInterface.verify(webStorageManagerStatic, _token);
    return webStorageManagerStatic;
  }

  /// Used by the platform implementation to create a new
  /// [CygnusPlatformWebStorageManager].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformWebStorageManager.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformWebStorageManager].
  final CygnusPlatformWebStorageManagerCreationParams params;

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.getOrigins}
  ///Gets the origins currently using either the Application Cache or Web SQL Database APIs.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getOrigins.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusWebStorage.getOrigins',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusWebStorage#getOrigins(android.webkit.ValueCallback%3Cjava.util.Map%3E)',
      ),
    ],
  )
  Future<List<CygnusWebStorageOrigin>> getOrigins() {
    throw UnimplementedError(
      'getOrigins is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.deleteAllData}
  ///Clears all storage currently being used by the JavaScript storage APIs.
  ///This includes the Application Cache, Web SQL Database and the HTML5 Web CygnusStorage APIs.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.deleteAllData.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusWebStorage.deleteAllData',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusWebStorage#deleteAllData()',
      ),
    ],
  )
  Future<void> deleteAllData() {
    throw UnimplementedError(
      'deleteAllData is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.deleteOrigin}
  ///Clears the storage currently being used by both the Application Cache and Web SQL Database APIs by the given [origin].
  ///The origin is specified using its string representation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.deleteOrigin.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusWebStorage.deleteOrigin',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusWebStorage#deleteOrigin(java.lang.String)',
      ),
    ],
  )
  Future<void> deleteOrigin({required String origin}) {
    throw UnimplementedError(
      'deleteOrigin is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.getQuotaForOrigin}
  ///Gets the storage quota for the Web SQL Database API for the given [origin].
  ///The quota is given in bytes and the origin is specified using its string representation.
  ///Note that a quota is not enforced on a per-origin basis for the Application Cache API.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getQuotaForOrigin.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusWebStorage.getQuotaForOrigin',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusWebStorage#getQuotaForOrigin(java.lang.String,%20android.webkit.ValueCallback%3Cjava.lang.Long%3E)',
      ),
    ],
  )
  Future<int> getQuotaForOrigin({required String origin}) {
    throw UnimplementedError(
      'getQuotaForOrigin is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.getUsageForOrigin}
  ///Gets the amount of storage currently being used by both the Application Cache and Web SQL Database APIs by the given [origin].
  ///The amount is given in bytes and the origin is specified using its string representation.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.getUsageForOrigin.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusWebStorage.getUsageForOrigin',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusWebStorage#getUsageForOrigin(java.lang.String,%20android.webkit.ValueCallback%3Cjava.lang.Long%3E)',
      ),
    ],
  )
  Future<int> getUsageForOrigin({required String origin}) {
    throw UnimplementedError(
      'getUsageForOrigin is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.fetchDataRecords}
  ///Fetches data records containing the given website data types.
  ///
  ///[dataTypes] represents the website data types to fetch records for.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.fetchDataRecords.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        available: '9.0',
        apiName: 'WKWebsiteDataStore.fetchDataRecords',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532932-fetchdatarecords',
      ),
      LinuxPlatform(
        apiName: 'webkit_website_data_manager_fetch',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebsiteDataManager.fetch.html',
      ),
      MacOSPlatform(
        apiName: 'WKWebsiteDataStore.fetchDataRecords',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532932-fetchdatarecords',
      ),
    ],
  )
  Future<List<CygnusWebsiteDataRecord>> fetchDataRecords({
    required Set<CygnusWebsiteDataType> dataTypes,
  }) {
    throw UnimplementedError(
      'fetchDataRecords is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.removeDataFor}
  ///Removes website data of the given types for the given data records.
  ///
  ///[dataTypes] represents the website data types that should be removed.
  ///
  ///[dataRecords] represents the website data records to delete website data for.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.removeDataFor.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        available: '9.0',
        apiName: 'WKWebsiteDataStore.removeData',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532936-removedata',
      ),
      LinuxPlatform(
        apiName: 'webkit_website_data_manager_remove',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebsiteDataManager.remove.html',
      ),
      MacOSPlatform(
        apiName: 'WKWebsiteDataStore.removeData',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532936-removedata',
      ),
    ],
  )
  Future<void> removeDataFor({
    required Set<CygnusWebsiteDataType> dataTypes,
    required List<CygnusWebsiteDataRecord> dataRecords,
  }) {
    throw UnimplementedError(
      'removeDataFor is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.removeDataModifiedSince}
  ///Removes all website data of the given types that has been modified since the given date.
  ///
  ///[dataTypes] represents the website data types that should be removed.
  ///
  ///[date] represents a date. All website data modified after this date will be removed.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformWebStorageManager.removeDataModifiedSince.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      IOSPlatform(
        available: '9.0',
        apiName: 'WKWebsiteDataStore.removeData',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532938-removedata',
      ),
      LinuxPlatform(
        apiName: 'webkit_website_data_manager_clear',
        apiUrl:
            'https://wpewebkit.org/reference/stable/wpe-webkit-2.0/method.WebsiteDataManager.clear.html',
      ),
      MacOSPlatform(
        apiName: 'WKWebsiteDataStore.removeData',
        apiUrl:
            'https://developer.apple.com/documentation/webkit/wkwebsitedatastore/1532938-removedata',
      ),
    ],
  )
  Future<void> removeDataModifiedSince({
    required Set<CygnusWebsiteDataType> dataTypes,
    required DateTime date,
  }) {
    throw UnimplementedError(
      'removeDataModifiedSince is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformWebStorageManagerClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformWebStorageManager.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformWebStorageManagerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformWebStorageManagerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
