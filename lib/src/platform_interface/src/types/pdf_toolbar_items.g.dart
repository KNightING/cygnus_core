// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_toolbar_items.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to customize the PDF toolbar items.
class CygnusPdfToolbarItems {
  final int _value;
  final int? _nativeValue;
  const CygnusPdfToolbarItems._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusPdfToolbarItems._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusPdfToolbarItems._internal(value, nativeValue());

  ///The bookmarks button.
  static const BOOKMARKS = CygnusPdfToolbarItems._internal(256, 256);

  ///The fit page button.
  static const FIT_PAGE = CygnusPdfToolbarItems._internal(64, 64);

  ///The full screen button.
  static const FULL_SCREEN = CygnusPdfToolbarItems._internal(2048, 2048);

  ///The more settings button.
  static const MORE_SETTINGS = CygnusPdfToolbarItems._internal(4096, 4096);

  ///No item.
  static const NONE = CygnusPdfToolbarItems._internal(0, 0);

  ///The page layout button.
  static const PAGE_LAYOUT = CygnusPdfToolbarItems._internal(128, 128);

  ///The page select button.
  static const PAGE_SELECTOR = CygnusPdfToolbarItems._internal(512, 512);

  ///The print button.
  static const PRINT = CygnusPdfToolbarItems._internal(2, 2);

  ///The rotate button.
  static const ROTATE = CygnusPdfToolbarItems._internal(32, 32);

  ///The save button.
  static const SAVE = CygnusPdfToolbarItems._internal(1, 1);

  ///The save as button.
  static const SAVE_AS = CygnusPdfToolbarItems._internal(4, 4);

  ///The search button.
  static const SEARCH = CygnusPdfToolbarItems._internal(1024, 1024);

  ///The zoom in button.
  static const ZOOM_IN = CygnusPdfToolbarItems._internal(8, 8);

  ///The zoom out button.
  static const ZOOM_OUT = CygnusPdfToolbarItems._internal(16, 16);

  ///Set of all values of [CygnusPdfToolbarItems].
  static final Set<CygnusPdfToolbarItems> values = [
    CygnusPdfToolbarItems.BOOKMARKS,
    CygnusPdfToolbarItems.FIT_PAGE,
    CygnusPdfToolbarItems.FULL_SCREEN,
    CygnusPdfToolbarItems.MORE_SETTINGS,
    CygnusPdfToolbarItems.NONE,
    CygnusPdfToolbarItems.PAGE_LAYOUT,
    CygnusPdfToolbarItems.PAGE_SELECTOR,
    CygnusPdfToolbarItems.PRINT,
    CygnusPdfToolbarItems.ROTATE,
    CygnusPdfToolbarItems.SAVE,
    CygnusPdfToolbarItems.SAVE_AS,
    CygnusPdfToolbarItems.SEARCH,
    CygnusPdfToolbarItems.ZOOM_IN,
    CygnusPdfToolbarItems.ZOOM_OUT,
  ].toSet();

  ///Gets a possible [CygnusPdfToolbarItems] instance from [int] value.
  static CygnusPdfToolbarItems? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusPdfToolbarItems.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return CygnusPdfToolbarItems._internal(value, value);
      }
    }
    return null;
  }

  ///Gets a possible [CygnusPdfToolbarItems] instance from a native value.
  static CygnusPdfToolbarItems? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusPdfToolbarItems.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusPdfToolbarItems] instance value with name [name].
  ///
  /// Goes through [CygnusPdfToolbarItems.values] looking for a value with
  /// name [name], as reported by [CygnusPdfToolbarItems.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusPdfToolbarItems? byName(String? name) {
    if (name != null) {
      try {
        return CygnusPdfToolbarItems.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusPdfToolbarItems] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusPdfToolbarItems> asNameMap() =>
      <String, CygnusPdfToolbarItems>{
        for (final value in CygnusPdfToolbarItems.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 256:
        return 'BOOKMARKS';
      case 64:
        return 'FIT_PAGE';
      case 2048:
        return 'FULL_SCREEN';
      case 4096:
        return 'MORE_SETTINGS';
      case 0:
        return 'NONE';
      case 128:
        return 'PAGE_LAYOUT';
      case 512:
        return 'PAGE_SELECTOR';
      case 2:
        return 'PRINT';
      case 32:
        return 'ROTATE';
      case 1:
        return 'SAVE';
      case 4:
        return 'SAVE_AS';
      case 1024:
        return 'SEARCH';
      case 8:
        return 'ZOOM_IN';
      case 16:
        return 'ZOOM_OUT';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  CygnusPdfToolbarItems operator |(CygnusPdfToolbarItems value) =>
      CygnusPdfToolbarItems._internal(
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
