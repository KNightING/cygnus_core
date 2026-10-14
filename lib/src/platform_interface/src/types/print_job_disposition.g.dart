// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_job_disposition.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the constants that specify values for the print job disposition of a [CygnusPlatformPrintJobController].
class CygnusPrintJobDisposition {
  final String _value;
  final String? _nativeValue;
  const CygnusPrintJobDisposition._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusPrintJobDisposition._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusPrintJobDisposition._internal(value, nativeValue());

  ///Cancel print job.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  static final CANCEL = CygnusPrintJobDisposition._internalMultiPlatform(
    'CANCEL',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 'cancel';
        default:
          break;
      }
      return null;
    },
  );

  ///Send to Preview application.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  static final PREVIEW = CygnusPrintJobDisposition._internalMultiPlatform(
    'PREVIEW',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 'preview';
        default:
          break;
      }
      return null;
    },
  );

  ///Save to a file.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  static final SAVE = CygnusPrintJobDisposition._internalMultiPlatform(
    'SAVE',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 'save';
        default:
          break;
      }
      return null;
    },
  );

  ///Normal print job.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  static final SPOOL = CygnusPrintJobDisposition._internalMultiPlatform(
    'SPOOL',
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 'spool';
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusPrintJobDisposition].
  static final Set<CygnusPrintJobDisposition> values = [
    CygnusPrintJobDisposition.CANCEL,
    CygnusPrintJobDisposition.PREVIEW,
    CygnusPrintJobDisposition.SAVE,
    CygnusPrintJobDisposition.SPOOL,
  ].toSet();

  ///Gets a possible [CygnusPrintJobDisposition] instance from [String] value.
  static CygnusPrintJobDisposition? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusPrintJobDisposition.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPrintJobDisposition] instance from a native value.
  static CygnusPrintJobDisposition? fromNativeValue(String? value) {
    if (value != null) {
      try {
        return CygnusPrintJobDisposition.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPrintJobDisposition] instance value with name [name].
  ///
  /// Goes through [CygnusPrintJobDisposition.values] looking for a value with
  /// name [name], as reported by [CygnusPrintJobDisposition.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPrintJobDisposition? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPrintJobDisposition.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPrintJobDisposition] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPrintJobDisposition> asNameMap() =>
      <String, CygnusPrintJobDisposition>{
        for (final value in CygnusPrintJobDisposition.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'CANCEL':
        return 'CANCEL';
      case 'PREVIEW':
        return 'PREVIEW';
      case 'SAVE':
        return 'SAVE';
      case 'SPOOL':
        return 'SPOOL';
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
