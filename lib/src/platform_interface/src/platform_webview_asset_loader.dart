import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:cygnus_core/src/platform_interface/flutter_webview_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'webview_platform.dart';
import 'types/web_resource_response.dart';

part 'platform_webview_asset_loader.g.dart';

///{@template cygnus_core.CygnusWebViewAssetLoader}
///Helper class to load local files including application's static assets and resources using http(s):// URLs inside a `WebView` class.
///Loading local files using web-like URLs instead of `file://` is desirable as it is compatible with the Same-Origin policy.
///
///For more context about application's assets and resources and how to normally access them please refer to
///[Android Developer Docs: App resources overview](https://developer.android.com/guide/topics/resources/providing-resources).
///
///Using http(s):// URLs to access local resources may conflict with a real website.
///This means that local files should only be hosted on domains your organization owns
///(at paths reserved for this purpose) or the default domain reserved for this: `appassets.androidplatform.net`.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusWebViewAssetLoader.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@ExchangeableObject(copyMethod: true)
class CygnusWebViewAssetLoader_ {
  ///An unused domain reserved for Android applications to intercept requests for app assets.
  ///
  ///It is used by default unless the user specified a different domain.
  static final String DEFAULT_DOMAIN = "appassets.androidplatform.net";

  ///Set the domain under which app assets can be accessed. The default domain is `appassets.androidplatform.net`.
  String? domain;

  ///Allow using the HTTP scheme in addition to HTTPS. The default is to not allow HTTP.
  bool? httpAllowed;

  ///List of registered path handlers.
  ///
  ///[CygnusWebViewAssetLoader] will try Path Handlers in the order they're registered,
  ///and will use whichever is the first to return a non-null.
  List<CygnusPlatformPathHandler>? pathHandlers;

  CygnusWebViewAssetLoader_({this.domain, this.httpAllowed, this.pathHandlers});
}

///{@template cygnus_core.CygnusPlatformPathHandlerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformPathHandler].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformPathHandlerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@immutable
class CygnusPlatformPathHandlerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformPathHandler].
  const CygnusPlatformPathHandlerCreationParams({required this.path});

  ///{@template cygnus_core.CygnusPlatformPathHandlerCreationParams.path}
  ///{@macro cygnus_core.CygnusPlatformPathHandler.path}
  ///{@endtemplate}
  final String path;

  ///{@template cygnus_core.CygnusPlatformPathHandlerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformPathHandlerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformPathHandler}
///A handler that produces responses for a registered path.
///
///Implement this interface to handle other use-cases according to your app's needs.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformPathHandler.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
abstract class CygnusPlatformPathHandler {
  /// Event handler object that handles the [CygnusPlatformPathHandler] events.
  late final CygnusPlatformPathHandlerEvents? eventHandler;

  ///{@template cygnus_core.CygnusPlatformPathHandler.type}
  ///The path handler type.
  ///{@endtemplate}
  String get type {
    throw UnimplementedError('type is not implemented on the current platform');
  }

  ///{@template cygnus_core.CygnusPlatformPathHandler.path}
  ///The suffix path to be handled.
  ///
  ///The path should start and end with a `"/"` and it shouldn't collide with a real web path.
  ///{@endtemplate}
  String get path {
    throw UnimplementedError('path is not implemented on the current platform');
  }

  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    throw UnimplementedError(
      'toMap is not implemented on the current platform',
    );
  }

  Map<String, dynamic> toJson() {
    throw UnimplementedError(
      'toJson is not implemented on the current platform',
    );
  }
}

///{@template cygnus_core.CygnusPlatformPathHandlerEvents}
///Interface path handler events.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformPathHandlerEvents.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
abstract class CygnusPlatformPathHandlerEvents {
  ///{@template cygnus_core.CygnusPlatformPathHandler.handle}
  ///Handles the requested URL by returning the appropriate response.
  ///
  ///Returning a `null` value means that the handler decided not to handle this path.
  ///In this case, [CygnusWebViewAssetLoader] will try the next handler registered on this path or pass to `WebView` that will fall back to network to try to resolve the URL.
  ///
  ///However, if the handler wants to save unnecessary processing either by another handler or by falling back to network,
  ///in cases like a file cannot be found, it may return a `CygnusWebResourceResponse(data: null)`
  ///which is received as an HTTP response with status code `404` and no body.
  ///{@endtemplate}
  Future<CygnusWebResourceResponse?> handle(String path) {
    throw UnimplementedError(
      'handle is not implemented on the current platform',
    );
  }
}

///{@template cygnus_core.CygnusPlatformAssetsPathHandlerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformAssetsPathHandler].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformAssetsPathHandlerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@immutable
class CygnusPlatformAssetsPathHandlerCreationParams
    extends CygnusPlatformPathHandlerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformAssetsPathHandler].
  CygnusPlatformAssetsPathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformPathHandlerCreationParams params,
  ) : super(path: params.path);

  /// Creates a [CygnusPlatformAssetsPathHandlerCreationParams] instance based on [CygnusPlatformPathHandlerCreationParams].
  factory CygnusPlatformAssetsPathHandlerCreationParams.fromPlatformPathHandlerCreationParams(
    CygnusPlatformPathHandlerCreationParams params,
  ) {
    return CygnusPlatformAssetsPathHandlerCreationParams(params);
  }

  ///{@template cygnus_core.CygnusPlatformAssetsPathHandlerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  @override
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformAssetsPathHandlerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformAssetsPathHandler}
///Handler class to open a file from assets directory in the application APK.
///
///Opens the requested file from the application's assets directory.
///
///The matched prefix path used shouldn't be a prefix of a real web path.
///Thus, if the requested file cannot be found a [CygnusWebResourceResponse] object with a `null` data will be returned instead of `null`.
///This saves the time of falling back to network and trying to resolve a path that doesn't exist.
///A [CygnusWebResourceResponse] with `null` data will be received as an HTTP response with status code `404` and no body.
///
///The MIME type for the file will be determined from the file's extension using
///[guessContentTypeFromName](https://developer.android.com/reference/java/net/URLConnection.html#guessContentTypeFromName-java.lang.String-).
///Developers should ensure that asset files are named using standard file extensions.
///If the file does not have a recognised extension, `text/plain` will be used by default.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformAssetsPathHandler.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
abstract class CygnusPlatformAssetsPathHandler extends PlatformInterface
    implements CygnusPlatformPathHandler {
  /// Creates a new [CygnusPlatformAssetsPathHandler]
  factory CygnusPlatformAssetsPathHandler(
    CygnusPlatformAssetsPathHandlerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformAssetsPathHandler assetsPathHandler = CygnusWebViewPlatform
        .instance!
        .createPlatformAssetsPathHandler(params);
    PlatformInterface.verify(assetsPathHandler, _token);
    return assetsPathHandler;
  }

  /// Creates a new empty [CygnusPlatformAssetsPathHandler] to access static methods.
  factory CygnusPlatformAssetsPathHandler.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformAssetsPathHandler assetsPathHandlerStatic =
        CygnusWebViewPlatform.instance!.createPlatformAssetsPathHandlerStatic();
    PlatformInterface.verify(assetsPathHandlerStatic, _token);
    return assetsPathHandlerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformAssetsPathHandler].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformAssetsPathHandler.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformAssetsPathHandler].
  final CygnusPlatformAssetsPathHandlerCreationParams params;

  @override
  String get type => 'CygnusAssetsPathHandler';

  @override
  String get path => params.path;

  ///{@macro cygnus_core.CygnusPlatformAssetsPathHandlerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);
}

///{@template cygnus_core.CygnusPlatformResourcesPathHandlerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformResourcesPathHandler].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformResourcesPathHandlerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@immutable
class CygnusPlatformResourcesPathHandlerCreationParams
    extends CygnusPlatformPathHandlerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformResourcesPathHandler].
  CygnusPlatformResourcesPathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformPathHandlerCreationParams params,
  ) : super(path: params.path);

  /// Creates a [CygnusPlatformResourcesPathHandlerCreationParams] instance based on [CygnusPlatformPathHandlerCreationParams].
  factory CygnusPlatformResourcesPathHandlerCreationParams.fromPlatformPathHandlerCreationParams(
    CygnusPlatformPathHandlerCreationParams params,
  ) {
    return CygnusPlatformResourcesPathHandlerCreationParams(params);
  }

  ///{@template cygnus_core.CygnusPlatformResourcesPathHandlerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  @override
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformResourcesPathHandlerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformResourcesPathHandler}
///Handler class to open a file from resources directory in the application APK.
///
///Opens the requested file from application's resources directory.
///
///The matched prefix path used shouldn't be a prefix of a real web path.
///Thus, if the requested file cannot be found a [CygnusWebResourceResponse] object with a `null` data will be returned instead of `null`.
///This saves the time of falling back to network and trying to resolve a path that doesn't exist.
///A [CygnusWebResourceResponse] with `null` data will be received as an HTTP response with status code `404` and no body.
///
///The MIME type for the file will be determined from the file's extension using
///[guessContentTypeFromName](https://developer.android.com/reference/java/net/URLConnection.html#guessContentTypeFromName-java.lang.String-).
///Developers should ensure that asset files are named using standard file extensions.
///If the file does not have a recognised extension, `text/plain` will be used by default.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformResourcesPathHandler.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
abstract class CygnusPlatformResourcesPathHandler extends PlatformInterface
    implements CygnusPlatformPathHandler {
  /// Creates a new [CygnusPlatformResourcesPathHandler]
  factory CygnusPlatformResourcesPathHandler(
    CygnusPlatformResourcesPathHandlerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformResourcesPathHandler resourcesPathHandler =
        CygnusWebViewPlatform.instance!.createPlatformResourcesPathHandler(
          params,
        );
    PlatformInterface.verify(resourcesPathHandler, _token);
    return resourcesPathHandler;
  }

  /// Creates a new empty [CygnusPlatformResourcesPathHandler] to access static methods.
  factory CygnusPlatformResourcesPathHandler.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformResourcesPathHandler resourcesPathHandlerStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformResourcesPathHandlerStatic();
    PlatformInterface.verify(resourcesPathHandlerStatic, _token);
    return resourcesPathHandlerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformResourcesPathHandler].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformResourcesPathHandler.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformResourcesPathHandler].
  final CygnusPlatformResourcesPathHandlerCreationParams params;

  @override
  String get type => 'CygnusResourcesPathHandler';

  @override
  String get path => params.path;

  ///{@macro cygnus_core.CygnusPlatformResourcesPathHandlerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);
}

///{@template cygnus_core.CygnusPlatformInternalStoragePathHandlerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformInternalStoragePathHandler].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandlerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@immutable
class CygnusPlatformInternalStoragePathHandlerCreationParams
    extends CygnusPlatformPathHandlerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformInternalStoragePathHandler].
  CygnusPlatformInternalStoragePathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformPathHandlerCreationParams params, {
    required this.directory,
  }) : super(path: params.path);

  /// Creates a [CygnusPlatformInternalStoragePathHandlerCreationParams] instance based on [CygnusPlatformPathHandlerCreationParams].
  factory CygnusPlatformInternalStoragePathHandlerCreationParams.fromPlatformPathHandlerCreationParams(
    CygnusPlatformPathHandlerCreationParams params, {
    required String directory,
  }) {
    return CygnusPlatformInternalStoragePathHandlerCreationParams(
      params,
      directory: directory,
    );
  }

  ///{@template cygnus_core.CygnusPlatformInternalStoragePathHandlerCreationParams.directory}
  ///The directory for which files should be served.
  ///{@endtemplate}
  final String directory;

  ///{@template cygnus_core.CygnusPlatformInternalStoragePathHandlerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  @override
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformInternalStoragePathHandlerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformInternalStoragePathHandler}
///Handler class to open files from application internal storage.
///For more information about android storage please refer to
///[Android Developers Docs: Data and file storage overview](https://developer.android.com/guide/topics/data/data-storage).
///
///To avoid leaking user or app data to the web, make sure to choose [directory] carefully,
///and assume any file under this directory could be accessed by any web page subject to same-origin rules.
///
///Opens the requested file from the exposed data directory.
///
///The matched prefix path used shouldn't be a prefix of a real web path.
///Thus, if the requested file cannot be found a [CygnusWebResourceResponse] object with a `null` data will be returned instead of `null`.
///This saves the time of falling back to network and trying to resolve a path that doesn't exist.
///A [CygnusWebResourceResponse] with `null` data will be received as an HTTP response with status code `404` and no body.
///
///The MIME type for the file will be determined from the file's extension using
///[guessContentTypeFromName](https://developer.android.com/reference/java/net/URLConnection.html#guessContentTypeFromName-java.lang.String-).
///Developers should ensure that asset files are named using standard file extensions.
///If the file does not have a recognised extension, `text/plain` will be used by default.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandler.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
abstract class CygnusPlatformInternalStoragePathHandler extends PlatformInterface
    implements CygnusPlatformPathHandler {
  /// Creates a new [CygnusPlatformInternalStoragePathHandler]
  factory CygnusPlatformInternalStoragePathHandler(
    CygnusPlatformInternalStoragePathHandlerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformInternalStoragePathHandler internalStoragePathHandler =
        CygnusWebViewPlatform.instance!.createPlatformInternalStoragePathHandler(
          params,
        );
    PlatformInterface.verify(internalStoragePathHandler, _token);
    return internalStoragePathHandler;
  }

  /// Creates a new empty [CygnusPlatformInternalStoragePathHandler] to access static methods.
  factory CygnusPlatformInternalStoragePathHandler.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformInternalStoragePathHandler internalStoragePathHandlerStatic =
        CygnusWebViewPlatform.instance!
            .createPlatformInternalStoragePathHandlerStatic();
    PlatformInterface.verify(internalStoragePathHandlerStatic, _token);
    return internalStoragePathHandlerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformInternalStoragePathHandler].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformInternalStoragePathHandler.implementation(this.params)
    : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformInternalStoragePathHandler].
  final CygnusPlatformInternalStoragePathHandlerCreationParams params;

  @override
  String get type => 'CygnusInternalStoragePathHandler';

  @override
  String get path => params.path;

  ///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandlerCreationParams.directory}
  String get directory => params.directory;

  ///{@macro cygnus_core.CygnusPlatformInternalStoragePathHandlerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);
}

///{@template cygnus_core.CygnusPlatformCustomPathHandlerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformCustomPathHandler].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformCustomPathHandlerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@immutable
class CygnusPlatformCustomPathHandlerCreationParams
    extends CygnusPlatformPathHandlerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformCustomPathHandler].
  CygnusPlatformCustomPathHandlerCreationParams(
    // This parameter prevents breaking changes later.
    // ignore: avoid_unused_constructor_parameters
    CygnusPlatformPathHandlerCreationParams params,
  ) : super(path: params.path);

  /// Creates a [CygnusPlatformCustomPathHandlerCreationParams] instance based on [CygnusPlatformPathHandlerCreationParams].
  factory CygnusPlatformCustomPathHandlerCreationParams.fromPlatformPathHandlerCreationParams(
    CygnusPlatformPathHandlerCreationParams params,
  ) {
    return CygnusPlatformCustomPathHandlerCreationParams(params);
  }

  ///{@template cygnus_core.CygnusPlatformCustomPathHandlerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  @override
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformCustomPathHandlerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformCustomPathHandler}
///Custom handler class used to implement a custom logic to open a file.
///
///The matched prefix path used shouldn't be a prefix of a real web path.
///Thus, if the requested file cannot be found a [CygnusWebResourceResponse] object with a `null` data will be returned instead of `null`.
///This saves the time of falling back to network and trying to resolve a path that doesn't exist.
///A [CygnusWebResourceResponse] with `null` data will be received as an HTTP response with status code `404` and no body.
///
///The MIME type for the file will be determined from the file's extension using
///[guessContentTypeFromName](https://developer.android.com/reference/java/net/URLConnection.html#guessContentTypeFromName-java.lang.String-).
///Developers should ensure that asset files are named using standard file extensions.
///If the file does not have a recognised extension, `text/plain` will be used by default.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformCustomPathHandler.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
abstract class CygnusPlatformCustomPathHandler extends PlatformInterface
    implements CygnusPlatformPathHandler {
  /// Creates a new [CygnusPlatformCustomPathHandler]
  factory CygnusPlatformCustomPathHandler(
    CygnusPlatformCustomPathHandlerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformCustomPathHandler customPathHandler = CygnusWebViewPlatform
        .instance!
        .createPlatformCustomPathHandler(params);
    PlatformInterface.verify(customPathHandler, _token);
    return customPathHandler;
  }

  /// Creates a new empty [CygnusPlatformCustomPathHandler] to access static methods.
  factory CygnusPlatformCustomPathHandler.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformCustomPathHandler customPathHandlerStatic =
        CygnusWebViewPlatform.instance!.createPlatformCustomPathHandlerStatic();
    PlatformInterface.verify(customPathHandlerStatic, _token);
    return customPathHandlerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformCustomPathHandler].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformCustomPathHandler.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformCustomPathHandler].
  final CygnusPlatformCustomPathHandlerCreationParams params;

  @override
  String get type => 'CygnusCustomPathHandler';

  @override
  String get path => params.path;

  ///{@macro cygnus_core.CygnusPlatformCustomPathHandlerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);
}
