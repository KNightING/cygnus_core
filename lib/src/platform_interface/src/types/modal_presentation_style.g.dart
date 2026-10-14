// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal_presentation_style.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to specify the modal presentation style when presenting a view controller.
class CygnusModalPresentationStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusModalPresentationStyle._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusModalPresentationStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusModalPresentationStyle._internal(value, nativeValue());

  ///The default presentation style chosen by the system.
  ///
  ///**NOTE**: available on iOS 13.0+.
  static const AUTOMATIC = CygnusModalPresentationStyle._internal(9, 9);

  ///A presentation style where the content is displayed over another view controller’s content.
  static const CURRENT_CONTEXT = CygnusModalPresentationStyle._internal(3, 3);

  ///A custom view presentation style that is managed by a custom presentation controller and one or more custom animator objects.
  static const CUSTOM = CygnusModalPresentationStyle._internal(4, 4);

  ///A presentation style that displays the content centered in the screen.
  static const FORM_SHEET = CygnusModalPresentationStyle._internal(2, 2);

  ///A presentation style in which the presented view covers the screen.
  static const FULL_SCREEN = CygnusModalPresentationStyle._internal(0, 0);

  ///A presentation style that indicates no adaptations should be made.
  static const NONE = CygnusModalPresentationStyle._internal(8, 8);

  ///A presentation style where the content is displayed over another view controller’s content.
  static const OVER_CURRENT_CONTEXT = CygnusModalPresentationStyle._internal(
    6,
    6,
  );

  ///A view presentation style in which the presented view covers the screen.
  static const OVER_FULL_SCREEN = CygnusModalPresentationStyle._internal(5, 5);

  ///A presentation style that partially covers the underlying content.
  static const PAGE_SHEET = CygnusModalPresentationStyle._internal(1, 1);

  ///A presentation style where the content is displayed in a popover view.
  static const POPOVER = CygnusModalPresentationStyle._internal(7, 7);

  ///Set of all values of [CygnusModalPresentationStyle].
  static final Set<CygnusModalPresentationStyle> values = [
    CygnusModalPresentationStyle.AUTOMATIC,
    CygnusModalPresentationStyle.CURRENT_CONTEXT,
    CygnusModalPresentationStyle.CUSTOM,
    CygnusModalPresentationStyle.FORM_SHEET,
    CygnusModalPresentationStyle.FULL_SCREEN,
    CygnusModalPresentationStyle.NONE,
    CygnusModalPresentationStyle.OVER_CURRENT_CONTEXT,
    CygnusModalPresentationStyle.OVER_FULL_SCREEN,
    CygnusModalPresentationStyle.PAGE_SHEET,
    CygnusModalPresentationStyle.POPOVER,
  ].toSet();

  ///Gets a possible [CygnusModalPresentationStyle] instance from [int] value.
  static CygnusModalPresentationStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusModalPresentationStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusModalPresentationStyle] instance from a native value.
  static CygnusModalPresentationStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusModalPresentationStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusModalPresentationStyle] instance value with name [name].
  ///
  /// Goes through [CygnusModalPresentationStyle.values] looking for a value with
  /// name [name], as reported by [CygnusModalPresentationStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusModalPresentationStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusModalPresentationStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusModalPresentationStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusModalPresentationStyle> asNameMap() =>
      <String, CygnusModalPresentationStyle>{
        for (final value in CygnusModalPresentationStyle.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 9:
        return 'AUTOMATIC';
      case 3:
        return 'CURRENT_CONTEXT';
      case 4:
        return 'CUSTOM';
      case 2:
        return 'FORM_SHEET';
      case 0:
        return 'FULL_SCREEN';
      case 8:
        return 'NONE';
      case 6:
        return 'OVER_CURRENT_CONTEXT';
      case 5:
        return 'OVER_FULL_SCREEN';
      case 1:
        return 'PAGE_SHEET';
      case 7:
        return 'POPOVER';
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

///An iOS-specific class used to specify the modal presentation style when presenting a view controller.
///Use [CygnusModalPresentationStyle] instead.
@Deprecated('Use CygnusModalPresentationStyle instead')
class CygnusIOSUIModalPresentationStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSUIModalPresentationStyle._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSUIModalPresentationStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSUIModalPresentationStyle._internal(value, nativeValue());

  ///The default presentation style chosen by the system.
  ///
  ///**NOTE**: available on iOS 13.0+.
  static const AUTOMATIC = CygnusIOSUIModalPresentationStyle._internal(9, 9);

  ///A presentation style where the content is displayed over another view controller’s content.
  static const CURRENT_CONTEXT = CygnusIOSUIModalPresentationStyle._internal(
    3,
    3,
  );

  ///A custom view presentation style that is managed by a custom presentation controller and one or more custom animator objects.
  static const CUSTOM = CygnusIOSUIModalPresentationStyle._internal(4, 4);

  ///A presentation style that displays the content centered in the screen.
  static const FORM_SHEET = CygnusIOSUIModalPresentationStyle._internal(2, 2);

  ///A presentation style in which the presented view covers the screen.
  static const FULL_SCREEN = CygnusIOSUIModalPresentationStyle._internal(0, 0);

  ///A presentation style that indicates no adaptations should be made.
  static const NONE = CygnusIOSUIModalPresentationStyle._internal(8, 8);

  ///A presentation style where the content is displayed over another view controller’s content.
  static const OVER_CURRENT_CONTEXT =
      CygnusIOSUIModalPresentationStyle._internal(6, 6);

  ///A view presentation style in which the presented view covers the screen.
  static const OVER_FULL_SCREEN = CygnusIOSUIModalPresentationStyle._internal(
    5,
    5,
  );

  ///A presentation style that partially covers the underlying content.
  static const PAGE_SHEET = CygnusIOSUIModalPresentationStyle._internal(1, 1);

  ///A presentation style where the content is displayed in a popover view.
  static const POPOVER = CygnusIOSUIModalPresentationStyle._internal(7, 7);

  ///Set of all values of [CygnusIOSUIModalPresentationStyle].
  static final Set<CygnusIOSUIModalPresentationStyle> values = [
    CygnusIOSUIModalPresentationStyle.AUTOMATIC,
    CygnusIOSUIModalPresentationStyle.CURRENT_CONTEXT,
    CygnusIOSUIModalPresentationStyle.CUSTOM,
    CygnusIOSUIModalPresentationStyle.FORM_SHEET,
    CygnusIOSUIModalPresentationStyle.FULL_SCREEN,
    CygnusIOSUIModalPresentationStyle.NONE,
    CygnusIOSUIModalPresentationStyle.OVER_CURRENT_CONTEXT,
    CygnusIOSUIModalPresentationStyle.OVER_FULL_SCREEN,
    CygnusIOSUIModalPresentationStyle.PAGE_SHEET,
    CygnusIOSUIModalPresentationStyle.POPOVER,
  ].toSet();

  ///Gets a possible [CygnusIOSUIModalPresentationStyle] instance from [int] value.
  static CygnusIOSUIModalPresentationStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSUIModalPresentationStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSUIModalPresentationStyle] instance from a native value.
  static CygnusIOSUIModalPresentationStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSUIModalPresentationStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSUIModalPresentationStyle] instance value with name [name].
  ///
  /// Goes through [CygnusIOSUIModalPresentationStyle.values] looking for a value with
  /// name [name], as reported by [CygnusIOSUIModalPresentationStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSUIModalPresentationStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSUIModalPresentationStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSUIModalPresentationStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSUIModalPresentationStyle> asNameMap() =>
      <String, CygnusIOSUIModalPresentationStyle>{
        for (final value in CygnusIOSUIModalPresentationStyle.values)
          value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 9:
        return 'AUTOMATIC';
      case 3:
        return 'CURRENT_CONTEXT';
      case 4:
        return 'CUSTOM';
      case 2:
        return 'FORM_SHEET';
      case 0:
        return 'FULL_SCREEN';
      case 8:
        return 'NONE';
      case 6:
        return 'OVER_CURRENT_CONTEXT';
      case 5:
        return 'OVER_FULL_SCREEN';
      case 1:
        return 'PAGE_SHEET';
      case 7:
        return 'POPOVER';
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
