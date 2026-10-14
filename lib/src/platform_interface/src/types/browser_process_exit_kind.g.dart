// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_process_exit_kind.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///The kind of browser process exit that has occurred.
class CygnusBrowserProcessExitKind {
  final int _value;
  final int? _nativeValue;
  const CygnusBrowserProcessExitKind._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusBrowserProcessExitKind._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusBrowserProcessExitKind._internal(value, nativeValue());

  ///Indicates that the browser process ended unexpectedly.
  ///A [CygnusPlatformWebViewCreationParams.onProcessFailed] event will also be
  ///raised to listening WebViews from the [CygnusPlatformWebViewEnvironment] associated to the failed process.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  static final FAILED = CygnusBrowserProcessExitKind._internalMultiPlatform(
    1,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.windows:
          return 1;
        default:
          break;
      }
      return null;
    },
  );

  ///Indicates that the browser process ended normally.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  static final NORMAL = CygnusBrowserProcessExitKind._internalMultiPlatform(
    0,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.windows:
          return 0;
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusBrowserProcessExitKind].
  static final Set<CygnusBrowserProcessExitKind> values = [
    CygnusBrowserProcessExitKind.FAILED,
    CygnusBrowserProcessExitKind.NORMAL,
  ].toSet();

  ///Gets a possible [CygnusBrowserProcessExitKind] instance from [int] value.
  static CygnusBrowserProcessExitKind? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusBrowserProcessExitKind.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return CygnusBrowserProcessExitKind._internal(value, value);
      }
    }
    return null;
  }

  ///Gets a possible [CygnusBrowserProcessExitKind] instance from a native value.
  static CygnusBrowserProcessExitKind? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusBrowserProcessExitKind.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusBrowserProcessExitKind] instance value with name [name].
  ///
  /// Goes through [CygnusBrowserProcessExitKind.values] looking for a value with
  /// name [name], as reported by [CygnusBrowserProcessExitKind.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusBrowserProcessExitKind? byName(String? name) {
    if (name != null) {
      try {
        return CygnusBrowserProcessExitKind.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusBrowserProcessExitKind] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusBrowserProcessExitKind> asNameMap() =>
      <String, CygnusBrowserProcessExitKind>{
        for (final value in CygnusBrowserProcessExitKind.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'FAILED';
      case 0:
        return 'NORMAL';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  CygnusBrowserProcessExitKind operator |(CygnusBrowserProcessExitKind value) =>
      CygnusBrowserProcessExitKind._internal(
        value.toValue() | _value,
        value.toNativeValue() != null && _nativeValue != null
            ? value.toNativeValue()! | _nativeValue!
            : null,
      );

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return name();
  }
}
