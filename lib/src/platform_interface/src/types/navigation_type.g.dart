// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the type of action triggering a navigation for the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading] event.
class CygnusNavigationType {
  final String _value;
  final int? _nativeValue;
  const CygnusNavigationType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusNavigationType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusNavigationType._internal(value, nativeValue());

  ///An item from the back-forward list was requested.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationType.formSubmitted](https://developer.apple.com/documentation/webkit/wknavigationtype/formsubmitted))
  ///- macOS WKWebView ([Official API - WKNavigationType.formSubmitted](https://developer.apple.com/documentation/webkit/wknavigationtype/formsubmitted))
  ///- Windows WebView2 ([Official API - COREWEBVIEW2_NAVIGATION_KIND_BACK_OR_FORWARD](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2210.55#corewebview2_navigation_kind))
  static final BACK_FORWARD = CygnusNavigationType._internalMultiPlatform(
    'BACK_FORWARD',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return 2;
        case TargetPlatform.macOS:
          return 2;
        case TargetPlatform.windows:
          return 1;
        default:
          break;
      }
      return null;
    },
  );

  ///A form was resubmitted (for example by going back, going forward, or reloading).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationType.formSubmitted](https://developer.apple.com/documentation/webkit/wknavigationtype/formresubmitted))
  ///- macOS WKWebView ([Official API - WKNavigationType.formSubmitted](https://developer.apple.com/documentation/webkit/wknavigationtype/formresubmitted))
  static final FORM_RESUBMITTED = CygnusNavigationType._internalMultiPlatform(
    'FORM_RESUBMITTED',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return 4;
        case TargetPlatform.macOS:
          return 4;
        default:
          break;
      }
      return null;
    },
  );

  ///A form was submitted.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationType.formSubmitted](https://developer.apple.com/documentation/webkit/wknavigationtype/formsubmitted))
  ///- macOS WKWebView ([Official API - WKNavigationType.formSubmitted](https://developer.apple.com/documentation/webkit/wknavigationtype/formsubmitted))
  static final FORM_SUBMITTED = CygnusNavigationType._internalMultiPlatform(
    'FORM_SUBMITTED',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return 1;
        case TargetPlatform.macOS:
          return 1;
        default:
          break;
      }
      return null;
    },
  );

  ///A link with an href attribute was activated by the user.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationType.linkActivated](https://developer.apple.com/documentation/webkit/wknavigationtype/linkactivated))
  ///- macOS WKWebView ([Official API - WKNavigationType.linkActivated](https://developer.apple.com/documentation/webkit/wknavigationtype/linkactivated))
  ///- Windows WebView2
  static final LINK_ACTIVATED = CygnusNavigationType._internalMultiPlatform(
    'LINK_ACTIVATED',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return 0;
        case TargetPlatform.macOS:
          return 0;
        case TargetPlatform.windows:
          return 0;
        default:
          break;
      }
      return null;
    },
  );

  ///Navigation is taking place for some other reason.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationType.other](https://developer.apple.com/documentation/webkit/wknavigationtype/other))
  ///- macOS WKWebView ([Official API - WKNavigationType.other](https://developer.apple.com/documentation/webkit/wknavigationtype/other))
  ///- Windows WebView2
  static final OTHER = CygnusNavigationType._internalMultiPlatform('OTHER', () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return -1;
      case TargetPlatform.macOS:
        return -1;
      case TargetPlatform.windows:
        return 3;
      default:
        break;
    }
    return null;
  });

  ///The webpage was reloaded.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView ([Official API - WKNavigationType.reload](https://developer.apple.com/documentation/webkit/wknavigationtype/reload))
  ///- macOS WKWebView ([Official API - WKNavigationType.reload](https://developer.apple.com/documentation/webkit/wknavigationtype/reload))
  ///- Windows WebView2 ([Official API - COREWEBVIEW2_NAVIGATION_KIND_RELOAD](https://learn.microsoft.com/en-us/microsoft-edge/webview2/reference/win32/webview2-idl?view=webview2-1.0.2210.55#corewebview2_navigation_kind))
  static final RELOAD = CygnusNavigationType._internalMultiPlatform(
    'RELOAD',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.iOS:
          return 3;
        case TargetPlatform.macOS:
          return 3;
        case TargetPlatform.windows:
          return 2;
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusNavigationType].
  static final Set<CygnusNavigationType> values = [
    CygnusNavigationType.BACK_FORWARD,
    CygnusNavigationType.FORM_RESUBMITTED,
    CygnusNavigationType.FORM_SUBMITTED,
    CygnusNavigationType.LINK_ACTIVATED,
    CygnusNavigationType.OTHER,
    CygnusNavigationType.RELOAD,
  ].toSet();

  ///Gets a possible [CygnusNavigationType] instance from [String] value.
  static CygnusNavigationType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusNavigationType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusNavigationType] instance from a native value.
  static CygnusNavigationType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusNavigationType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusNavigationType] instance value with name [name].
  ///
  /// Goes through [CygnusNavigationType.values] looking for a value with
  /// name [name], as reported by [CygnusNavigationType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusNavigationType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusNavigationType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusNavigationType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusNavigationType> asNameMap() =>
      <String, CygnusNavigationType>{
        for (final value in CygnusNavigationType.values) value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'BACK_FORWARD':
        return 'BACK_FORWARD';
      case 'FORM_RESUBMITTED':
        return 'FORM_RESUBMITTED';
      case 'FORM_SUBMITTED':
        return 'FORM_SUBMITTED';
      case 'LINK_ACTIVATED':
        return 'LINK_ACTIVATED';
      case 'OTHER':
        return 'OTHER';
      case 'RELOAD':
        return 'RELOAD';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return _value;
  }
}

///Class that represents the type of action triggering a navigation on iOS for the [CygnusPlatformWebViewCreationParams.shouldOverrideUrlLoading] event.
///Use [CygnusNavigationType] instead.
@Deprecated('Use CygnusNavigationType instead')
class CygnusIOSWKNavigationType {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSWKNavigationType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusIOSWKNavigationType._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSWKNavigationType._internal(value, nativeValue());

  ///An item from the back-forward list was requested.
  static const BACK_FORWARD = CygnusIOSWKNavigationType._internal(2, 2);

  ///A form was resubmitted (for example by going back, going forward, or reloading).
  static const FORM_RESUBMITTED = CygnusIOSWKNavigationType._internal(4, 4);

  ///A form was submitted.
  static const FORM_SUBMITTED = CygnusIOSWKNavigationType._internal(1, 1);

  ///A link with an href attribute was activated by the user.
  static const LINK_ACTIVATED = CygnusIOSWKNavigationType._internal(0, 0);

  ///Navigation is taking place for some other reason.
  static const OTHER = CygnusIOSWKNavigationType._internal(-1, -1);

  ///The webpage was reloaded.
  static const RELOAD = CygnusIOSWKNavigationType._internal(3, 3);

  ///Set of all values of [CygnusIOSWKNavigationType].
  static final Set<CygnusIOSWKNavigationType> values = [
    CygnusIOSWKNavigationType.BACK_FORWARD,
    CygnusIOSWKNavigationType.FORM_RESUBMITTED,
    CygnusIOSWKNavigationType.FORM_SUBMITTED,
    CygnusIOSWKNavigationType.LINK_ACTIVATED,
    CygnusIOSWKNavigationType.OTHER,
    CygnusIOSWKNavigationType.RELOAD,
  ].toSet();

  ///Gets a possible [CygnusIOSWKNavigationType] instance from [int] value.
  static CygnusIOSWKNavigationType? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSWKNavigationType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSWKNavigationType] instance from a native value.
  static CygnusIOSWKNavigationType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSWKNavigationType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSWKNavigationType] instance value with name [name].
  ///
  /// Goes through [CygnusIOSWKNavigationType.values] looking for a value with
  /// name [name], as reported by [CygnusIOSWKNavigationType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSWKNavigationType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSWKNavigationType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSWKNavigationType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSWKNavigationType> asNameMap() =>
      <String, CygnusIOSWKNavigationType>{
        for (final value in CygnusIOSWKNavigationType.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 2:
        return 'BACK_FORWARD';
      case 4:
        return 'FORM_RESUBMITTED';
      case 1:
        return 'FORM_SUBMITTED';
      case 0:
        return 'LINK_ACTIVATED';
      case -1:
        return 'OTHER';
      case 3:
        return 'RELOAD';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return name();
  }
}
