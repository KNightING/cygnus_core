// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_start_response_action.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the action of a [CygnusDownloadStartResponse].
class CygnusDownloadStartResponseAction {
  final int _value;
  final int? _nativeValue;
  const CygnusDownloadStartResponseAction._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusDownloadStartResponseAction._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusDownloadStartResponseAction._internal(value, nativeValue());

  ///Cancel the download.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///- Linux WPE WebKit
  static final CANCEL =
      CygnusDownloadStartResponseAction._internalMultiPlatform(0, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.windows:
            return 0;
          case TargetPlatform.linux:
            return 0;
          default:
            break;
        }
        return null;
      });

  ///Set of all values of [CygnusDownloadStartResponseAction].
  static final Set<CygnusDownloadStartResponseAction> values = [
    CygnusDownloadStartResponseAction.CANCEL,
  ].toSet();

  ///Gets a possible [CygnusDownloadStartResponseAction] instance from [int] value.
  static CygnusDownloadStartResponseAction? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusDownloadStartResponseAction.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusDownloadStartResponseAction] instance from a native value.
  static CygnusDownloadStartResponseAction? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusDownloadStartResponseAction.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusDownloadStartResponseAction] instance value with name [name].
  ///
  /// Goes through [CygnusDownloadStartResponseAction.values] looking for a value with
  /// name [name], as reported by [CygnusDownloadStartResponseAction.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusDownloadStartResponseAction? byName(String? name) {
    if (name != null) {
      try {
        return CygnusDownloadStartResponseAction.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusDownloadStartResponseAction] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusDownloadStartResponseAction> asNameMap() =>
      <String, CygnusDownloadStartResponseAction>{
        for (final value in CygnusDownloadStartResponseAction.values)
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
        return 'CANCEL';
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
