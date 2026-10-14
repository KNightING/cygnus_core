// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_file_chooser_request_mode.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///It represents file chooser mode of a [CygnusShowFileChooserRequest].
class CygnusShowFileChooserRequestMode {
  final int _value;
  final int? _nativeValue;
  const CygnusShowFileChooserRequestMode._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusShowFileChooserRequestMode._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusShowFileChooserRequestMode._internal(value, nativeValue());

  ///Open single file. Requires that the file exists before allowing the user to pick it.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final OPEN = CygnusShowFileChooserRequestMode._internalMultiPlatform(
    0,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 0;
        default:
          break;
      }
      return null;
    },
  );

  ///Like Open but allows a folder to be selected.
  ///The implementation should enumerate all files selected by this operation.
  ///This feature is not supported at the moment.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final OPEN_FOLDER =
      CygnusShowFileChooserRequestMode._internalMultiPlatform(2, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 2;
          default:
            break;
        }
        return null;
      });

  ///Like Open but allows multiple files to be selected.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final OPEN_MULTIPLE =
      CygnusShowFileChooserRequestMode._internalMultiPlatform(1, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.android:
            return 1;
          default:
            break;
        }
        return null;
      });

  ///Allows picking a nonexistent file and saving it.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  static final SAVE = CygnusShowFileChooserRequestMode._internalMultiPlatform(
    3,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          return 3;
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusShowFileChooserRequestMode].
  static final Set<CygnusShowFileChooserRequestMode> values = [
    CygnusShowFileChooserRequestMode.OPEN,
    CygnusShowFileChooserRequestMode.OPEN_FOLDER,
    CygnusShowFileChooserRequestMode.OPEN_MULTIPLE,
    CygnusShowFileChooserRequestMode.SAVE,
  ].toSet();

  ///Gets a possible [CygnusShowFileChooserRequestMode] instance from [int] value.
  static CygnusShowFileChooserRequestMode? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusShowFileChooserRequestMode.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusShowFileChooserRequestMode] instance from a native value.
  static CygnusShowFileChooserRequestMode? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusShowFileChooserRequestMode.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusShowFileChooserRequestMode] instance value with name [name].
  ///
  /// Goes through [CygnusShowFileChooserRequestMode.values] looking for a value with
  /// name [name], as reported by [CygnusShowFileChooserRequestMode.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusShowFileChooserRequestMode? byName(String? name) {
    if (name != null) {
      try {
        return CygnusShowFileChooserRequestMode.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusShowFileChooserRequestMode] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusShowFileChooserRequestMode> asNameMap() =>
      <String, CygnusShowFileChooserRequestMode>{
        for (final value in CygnusShowFileChooserRequestMode.values)
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
        return 'OPEN';
      case 2:
        return 'OPEN_FOLDER';
      case 1:
        return 'OPEN_MULTIPLE';
      case 3:
        return 'SAVE';
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
