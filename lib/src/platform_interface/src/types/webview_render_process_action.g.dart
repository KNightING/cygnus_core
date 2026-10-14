// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_render_process_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the action to take used by the [CygnusPlatformWebViewCreationParams.onRenderProcessUnresponsive] and [CygnusPlatformWebViewCreationParams.onRenderProcessResponsive] event
///to terminate the Android [WebViewRenderProcess](https://developer.android.com/reference/android/webkit/WebViewRenderProcess).
class CygnusWebViewRenderProcessAction {
  final int _value;
  final int? _nativeValue;
  const CygnusWebViewRenderProcessAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusWebViewRenderProcessAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusWebViewRenderProcessAction._internal(value, nativeValue());

  ///Cause this renderer to terminate.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final TERMINATE =
      CygnusWebViewRenderProcessAction._internalMultiPlatform(0, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 0;
          default:
            break;
        }
        return null;
      });

  ///Set of all values of [CygnusWebViewRenderProcessAction].
  static final Set<CygnusWebViewRenderProcessAction> values = [
    CygnusWebViewRenderProcessAction.TERMINATE,
  ].toSet();

  ///Gets a possible [CygnusWebViewRenderProcessAction] instance from [int] value.
  static CygnusWebViewRenderProcessAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebViewRenderProcessAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWebViewRenderProcessAction] instance from a native value.
  static CygnusWebViewRenderProcessAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebViewRenderProcessAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWebViewRenderProcessAction] instance value with name [name].
  ///
  /// Goes through [CygnusWebViewRenderProcessAction.values] looking for a value with
  /// name [name], as reported by [CygnusWebViewRenderProcessAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWebViewRenderProcessAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWebViewRenderProcessAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWebViewRenderProcessAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWebViewRenderProcessAction> asNameMap() =>
      <String, CygnusWebViewRenderProcessAction>{
        for (final value in CygnusWebViewRenderProcessAction.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 0:
        return 'TERMINATE';
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
