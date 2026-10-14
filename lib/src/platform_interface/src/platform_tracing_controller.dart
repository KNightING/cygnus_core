import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'webview_platform.dart';
import 'types/tracing_mode.dart';
import 'types/main.dart';

part 'platform_tracing_controller.g.dart';

///{@template cygnus_core.CygnusPlatformTracingControllerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformTracingController].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformTracingControllerCreationParams.supported_platforms}
@SupportedPlatforms(platforms: [AndroidPlatform()])
@immutable
class CygnusPlatformTracingControllerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformTracingController].
  const CygnusPlatformTracingControllerCreationParams();

  ///{@template cygnus_core.CygnusPlatformTracingControllerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformTracingControllerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );
}

///{@template cygnus_core.CygnusPlatformTracingController}
///Manages tracing of `WebView`s.
///In particular provides functionality for the app to enable/disable tracing of parts of code and to collect tracing data.
///This is useful for profiling performance issues, debugging and memory usage analysis in production and real life scenarios.
///
///The resulting trace data is sent back as a byte sequence in json format.
///This file can be loaded in "chrome://tracing" for further analysis.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformTracingController.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      apiName: 'CygnusTracingController',
      apiUrl:
          'https://developer.android.com/reference/androidx/webkit/CygnusTracingController',
    ),
  ],
)
abstract class CygnusPlatformTracingController extends PlatformInterface {
  /// Creates a new [CygnusPlatformTracingController]
  factory CygnusPlatformTracingController(
    CygnusPlatformTracingControllerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformTracingController tracingController = CygnusWebViewPlatform
        .instance!
        .createPlatformTracingController(params);
    PlatformInterface.verify(tracingController, _token);
    return tracingController;
  }

  /// Creates a new [CygnusPlatformTracingController]
  factory CygnusPlatformTracingController.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `flutter_inappwebview` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformTracingController tracingControllerStatic =
        CygnusWebViewPlatform.instance!.createPlatformTracingControllerStatic();
    PlatformInterface.verify(tracingControllerStatic, _token);
    return tracingControllerStatic;
  }

  /// Used by the platform implementation to create a new
  /// [CygnusPlatformTracingController].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformTracingController.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformTracingController].
  final CygnusPlatformTracingControllerCreationParams params;

  ///{@template cygnus_core.CygnusPlatformTracingController.start}
  ///Starts tracing all `WebView`s.
  ///Depending on the trace mode in trace config specifies how the trace events are recorded.
  ///For tracing modes [CygnusTracingMode.RECORD_UNTIL_FULL] and [CygnusTracingMode.RECORD_CONTINUOUSLY]
  ///the events are recorded using an internal buffer and flushed to the outputStream
  ///when [stop] is called.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformTracingController.start.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusTracingController.start',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusTracingController#start(android.webkit.TracingConfig)',
      ),
    ],
  )
  Future<void> start({required CygnusTracingSettings settings}) {
    throw UnimplementedError(
      'start is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformTracingController.stop}
  ///Stops tracing and flushes tracing data to the specified output stream.
  ///The data is sent to the specified output stream in json format typically in
  ///chunks.
  ///
  ///Returns `false` if the WebView framework was not tracing at the time of the call,
  ///`true` otherwise.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformTracingController.stop.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusTracingController.stop',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusTracingController#stop(java.io.OutputStream,%20java.util.concurrent.Executor)',
      ),
    ],
  )
  Future<bool> stop({String? filePath}) {
    throw UnimplementedError('stop is not implemented on the current platform');
  }

  ///{@template cygnus_core.CygnusPlatformTracingController.isTracing}
  ///Returns whether the WebView framework is tracing.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformTracingController.isTracing.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'CygnusTracingController.isTracing',
        apiUrl:
            'https://developer.android.com/reference/android/webkit/CygnusTracingController#isTracing()',
      ),
    ],
  )
  Future<bool> isTracing() {
    throw UnimplementedError(
      'isTracing is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformTracingControllerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformTracingController.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformTracingControllerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformTracingControllerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}

List<dynamic> _deserializeCategories(
  List<dynamic> categories, {
  CygnusEnumMethod? enumMethod,
}) {
  List<dynamic> deserializedCategories = [];
  for (dynamic category in categories) {
    if (category is String) {
      deserializedCategories.add(category);
    } else if (category is int) {
      final mode = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusTracingCategory.fromNativeValue(category),
        CygnusEnumMethod.value => CygnusTracingCategory.fromValue(category),
        CygnusEnumMethod.name => null,
      };
      if (mode != null) {
        deserializedCategories.add(mode);
      }
    }
  }
  return deserializedCategories;
}

List<dynamic> _serializeCategories(
  List<dynamic> categories, {
  CygnusEnumMethod? enumMethod,
}) {
  List<dynamic> serializedCategories = [];
  for (dynamic category in categories) {
    if (category is String) {
      serializedCategories.add(category);
    } else if (category is CygnusTracingCategory) {
      serializedCategories.add(switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => category.toNativeValue(),
        CygnusEnumMethod.value => category.toValue(),
        CygnusEnumMethod.name => null,
      });
    }
  }
  return serializedCategories;
}

///{@template cygnus_core.CygnusTracingSettings}
///Class that represents the settings used to configure the [CygnusPlatformTracingController].
///{@endtemplate}
///
///{@macro cygnus_core.CygnusTracingSettings.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(
      apiName: 'TracingConfig',
      apiUrl:
          'https://developer.android.com/reference/androidx/webkit/TracingConfig',
    ),
  ],
)
@ExchangeableObject(copyMethod: true)
class CygnusTracingSettings_ {
  ///Adds predefined [CygnusTracingCategory] and/or custom [String] sets of categories to be included in the trace output.
  ///
  ///Note that the categories are defined by the currently-in-use version of WebView.
  ///They live in chromium code and are not part of the Android API.
  ///See [chromium documentation on tracing](https://www.chromium.org/developers/how-tos/trace-event-profiling-tool)
  ///for more details.
  ///
  ///A category pattern can contain wildcards, e.g. `"blink*"` or full category name e.g. `"renderer.scheduler"`.
  @ExchangeableObjectProperty(
    deserializer: _deserializeCategories,
    serializer: _serializeCategories,
  )
  List<dynamic> categories;

  ///The tracing mode for this configuration.
  ///When tracingMode is not set explicitly, the default is [CygnusTracingMode.RECORD_CONTINUOUSLY].
  ///
  ///{@macro cygnus_core.CygnusTracingSettings.tracingMode.supported_platforms}
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  CygnusTracingMode_? tracingMode;

  @ExchangeableObjectConstructor()
  CygnusTracingSettings_({this.categories = const [], this.tracingMode}) {
    assert(
      this.categories
          .map(
            (e) => e.runtimeType is String || e.runtimeType is CygnusTracingCategory,
          )
          .contains(false),
      "categories must contain only String or CygnusTracingCategory items",
    );
  }

  ///{@template cygnus_core.CygnusTracingSettings.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusTracingSettingsClassSupported.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusTracingSettings.isPropertySupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  static bool isPropertySupported(
    CygnusTracingSettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusTracingSettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );
}
