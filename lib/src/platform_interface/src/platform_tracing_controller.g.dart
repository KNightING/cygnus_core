// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_tracing_controller.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///{@template cygnus_core.CygnusTracingSettings}
///Class that represents the settings used to configure the [CygnusPlatformTracingController].
///{@endtemplate}
///
///{@macro cygnus_core.CygnusTracingSettings.supported_platforms}
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView ([Official API - TracingConfig](https://developer.android.com/reference/androidx/webkit/TracingConfig))
class CygnusTracingSettings {
  ///Adds predefined [CygnusTracingCategory] and/or custom [String] sets of categories to be included in the trace output.
  ///
  ///Note that the categories are defined by the currently-in-use version of WebView.
  ///They live in chromium code and are not part of the Android API.
  ///See [chromium documentation on tracing](https://www.chromium.org/developers/how-tos/trace-event-profiling-tool)
  ///for more details.
  ///
  ///A category pattern can contain wildcards, e.g. `"blink*"` or full category name e.g. `"renderer.scheduler"`.
  List<dynamic> categories;

  ///The tracing mode for this configuration.
  ///When tracingMode is not set explicitly, the default is [CygnusTracingMode.RECORD_CONTINUOUSLY].
  ///
  ///{@macro cygnus_core.CygnusTracingSettings.tracingMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  CygnusTracingMode? tracingMode;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - TracingConfig](https://developer.android.com/reference/androidx/webkit/TracingConfig))
  CygnusTracingSettings({this.categories = const [], this.tracingMode}) {
    assert(
      this.categories
          .map(
            (e) =>
                e.runtimeType is String ||
                e.runtimeType is CygnusTracingCategory,
          )
          .contains(false),
      "categories must contain only String or CygnusTracingCategory items",
    );
  }

  ///Gets a possible [CygnusTracingSettings] instance from a [Map] value.
  static CygnusTracingSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusTracingSettings(
      tracingMode: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusTracingMode.fromNativeValue(
          map['tracingMode'],
        ),
        CygnusEnumMethod.value => CygnusTracingMode.fromValue(
          map['tracingMode'],
        ),
        CygnusEnumMethod.name => CygnusTracingMode.byName(map['tracingMode']),
      },
    );
    if (map['categories'] != null) {
      instance.categories = _deserializeCategories(
        map['categories'],
        enumMethod: enumMethod,
      );
    }
    return instance;
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

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "categories": _serializeCategories(categories, enumMethod: enumMethod),
      "tracingMode": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => tracingMode?.toNativeValue(),
        CygnusEnumMethod.value => tracingMode?.toValue(),
        CygnusEnumMethod.name => tracingMode?.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusTracingSettings.
  CygnusTracingSettings copy() {
    return CygnusTracingSettings.fromMap(toMap()) ?? CygnusTracingSettings();
  }

  @override
  String toString() {
    return 'CygnusTracingSettings{categories: $categories, tracingMode: $tracingMode}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

extension _CygnusPlatformTracingControllerCreationParamsClassSupported
    on CygnusPlatformTracingControllerCreationParams {
  ///{@template cygnus_core.CygnusPlatformTracingControllerCreationParams.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPlatformTracingControllerCreationParams.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

extension _CygnusPlatformTracingControllerClassSupported
    on CygnusPlatformTracingController {
  ///{@template cygnus_core.CygnusPlatformTracingController.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusTracingController](https://developer.android.com/reference/androidx/webkit/CygnusTracingController))
  ///
  ///Use the [CygnusPlatformTracingController.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusPlatformTracingController]'s methods that can be used to check if they are supported or not by the current platform.
enum CygnusPlatformTracingControllerMethod {
  ///Can be used to check if the [CygnusPlatformTracingController.isTracing] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformTracingController.isTracing.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusTracingController.isTracing](https://developer.android.com/reference/android/webkit/CygnusTracingController#isTracing()))
  ///
  ///Use the [CygnusPlatformTracingController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  isTracing,

  ///Can be used to check if the [CygnusPlatformTracingController.start] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformTracingController.start.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusTracingController.start](https://developer.android.com/reference/android/webkit/CygnusTracingController#start(android.webkit.TracingConfig)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [settings]: all platforms
  ///
  ///Use the [CygnusPlatformTracingController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  start,

  ///Can be used to check if the [CygnusPlatformTracingController.stop] method is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPlatformTracingController.stop.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - CygnusTracingController.stop](https://developer.android.com/reference/android/webkit/CygnusTracingController#stop(java.io.OutputStream,%20java.util.concurrent.Executor)))
  ///
  ///**Parameters - Officially Supported Platforms/Implementations**:
  ///- [filePath]: all platforms
  ///
  ///Use the [CygnusPlatformTracingController.isMethodSupported] method to check if this method is supported at runtime.
  ///{@endtemplate}
  stop,
}

extension _CygnusPlatformTracingControllerMethodSupported
    on CygnusPlatformTracingController {
  static bool isMethodSupported(
    CygnusPlatformTracingControllerMethod method, {
    TargetPlatform? platform,
  }) {
    switch (method) {
      case CygnusPlatformTracingControllerMethod.isTracing:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformTracingControllerMethod.start:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPlatformTracingControllerMethod.stop:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}

extension _CygnusTracingSettingsClassSupported on CygnusTracingSettings {
  ///{@template cygnus_core.CygnusTracingSettings.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView ([Official API - TracingConfig](https://developer.android.com/reference/androidx/webkit/TracingConfig))
  ///
  ///Use the [CygnusTracingSettings.isClassSupported] method to check if this class is supported at runtime.
  ///{@endtemplate}
  static bool isClassSupported({TargetPlatform? platform}) {
    return ((kIsWeb && platform != null) || !kIsWeb) &&
        [TargetPlatform.android].contains(platform ?? defaultTargetPlatform);
  }
}

///List of [CygnusTracingSettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusTracingSettingsProperty {
  ///Can be used to check if the [CygnusTracingSettings.tracingMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusTracingSettings.tracingMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusTracingSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  tracingMode,
}

extension _CygnusTracingSettingsPropertySupported on CygnusTracingSettings {
  static bool isPropertySupported(
    CygnusTracingSettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusTracingSettingsProperty.tracingMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
    }
  }
}
