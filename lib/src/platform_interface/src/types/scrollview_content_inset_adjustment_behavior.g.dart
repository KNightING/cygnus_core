// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scrollview_content_inset_adjustment_behavior.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to configure how safe area insets are added to the adjusted content inset.
class CygnusScrollViewContentInsetAdjustmentBehavior {
  final int _value;
  final int? _nativeValue;
  const CygnusScrollViewContentInsetAdjustmentBehavior._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusScrollViewContentInsetAdjustmentBehavior._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusScrollViewContentInsetAdjustmentBehavior._internal(
    value,
    nativeValue(),
  );

  ///Always include the safe area insets in the content adjustment.
  static const ALWAYS =
      CygnusScrollViewContentInsetAdjustmentBehavior._internal(3, 3);

  ///Automatically adjust the scroll view insets.
  static const AUTOMATIC =
      CygnusScrollViewContentInsetAdjustmentBehavior._internal(0, 0);

  ///Do not adjust the scroll view insets.
  static const NEVER = CygnusScrollViewContentInsetAdjustmentBehavior._internal(
    2,
    2,
  );

  ///Adjust the insets only in the scrollable directions.
  static const SCROLLABLE_AXES =
      CygnusScrollViewContentInsetAdjustmentBehavior._internal(1, 1);

  ///Set of all values of [CygnusScrollViewContentInsetAdjustmentBehavior].
  static final Set<CygnusScrollViewContentInsetAdjustmentBehavior> values = [
    CygnusScrollViewContentInsetAdjustmentBehavior.ALWAYS,
    CygnusScrollViewContentInsetAdjustmentBehavior.AUTOMATIC,
    CygnusScrollViewContentInsetAdjustmentBehavior.NEVER,
    CygnusScrollViewContentInsetAdjustmentBehavior.SCROLLABLE_AXES,
  ].toSet();

  ///Gets a possible [CygnusScrollViewContentInsetAdjustmentBehavior] instance from [int] value.
  static CygnusScrollViewContentInsetAdjustmentBehavior? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusScrollViewContentInsetAdjustmentBehavior.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusScrollViewContentInsetAdjustmentBehavior] instance from a native value.
  static CygnusScrollViewContentInsetAdjustmentBehavior? fromNativeValue(
    int? value,
  ) {
    if (value != null) {
      try {
        return CygnusScrollViewContentInsetAdjustmentBehavior.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusScrollViewContentInsetAdjustmentBehavior] instance value with name [name].
  ///
  /// Goes through [CygnusScrollViewContentInsetAdjustmentBehavior.values] looking for a value with
  /// name [name], as reported by [CygnusScrollViewContentInsetAdjustmentBehavior.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusScrollViewContentInsetAdjustmentBehavior? byName(String? name) {
    if (name != null) {
      try {
        return CygnusScrollViewContentInsetAdjustmentBehavior.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusScrollViewContentInsetAdjustmentBehavior] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusScrollViewContentInsetAdjustmentBehavior>
  asNameMap() => <String, CygnusScrollViewContentInsetAdjustmentBehavior>{
    for (final value in CygnusScrollViewContentInsetAdjustmentBehavior.values)
      value.name(): value,
  };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 3:
        return 'ALWAYS';
      case 0:
        return 'AUTOMATIC';
      case 2:
        return 'NEVER';
      case 1:
        return 'SCROLLABLE_AXES';
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

///An iOS-specific class used to configure how safe area insets are added to the adjusted content inset.
///
///**NOTE**: available on iOS 11.0+.
///
///Use [CygnusScrollViewContentInsetAdjustmentBehavior] instead.
@Deprecated('Use CygnusScrollViewContentInsetAdjustmentBehavior instead')
class CygnusIOSUIScrollViewContentInsetAdjustmentBehavior {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSUIScrollViewContentInsetAdjustmentBehavior._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSUIScrollViewContentInsetAdjustmentBehavior._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSUIScrollViewContentInsetAdjustmentBehavior._internal(
    value,
    nativeValue(),
  );

  ///Always include the safe area insets in the content adjustment.
  static const ALWAYS =
      CygnusIOSUIScrollViewContentInsetAdjustmentBehavior._internal(3, 3);

  ///Automatically adjust the scroll view insets.
  static const AUTOMATIC =
      CygnusIOSUIScrollViewContentInsetAdjustmentBehavior._internal(0, 0);

  ///Do not adjust the scroll view insets.
  static const NEVER =
      CygnusIOSUIScrollViewContentInsetAdjustmentBehavior._internal(2, 2);

  ///Adjust the insets only in the scrollable directions.
  static const SCROLLABLE_AXES =
      CygnusIOSUIScrollViewContentInsetAdjustmentBehavior._internal(1, 1);

  ///Set of all values of [CygnusIOSUIScrollViewContentInsetAdjustmentBehavior].
  static final Set<CygnusIOSUIScrollViewContentInsetAdjustmentBehavior> values =
      [
        CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.ALWAYS,
        CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.AUTOMATIC,
        CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.NEVER,
        CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.SCROLLABLE_AXES,
      ].toSet();

  ///Gets a possible [CygnusIOSUIScrollViewContentInsetAdjustmentBehavior] instance from [int] value.
  static CygnusIOSUIScrollViewContentInsetAdjustmentBehavior? fromValue(
    int? value,
  ) {
    if (value != null) {
      try {
        return CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.values
            .firstWhere((element) => element.toValue() == value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSUIScrollViewContentInsetAdjustmentBehavior] instance from a native value.
  static CygnusIOSUIScrollViewContentInsetAdjustmentBehavior? fromNativeValue(
    int? value,
  ) {
    if (value != null) {
      try {
        return CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.values
            .firstWhere((element) => element.toNativeValue() == value);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSUIScrollViewContentInsetAdjustmentBehavior] instance value with name [name].
  ///
  /// Goes through [CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.values] looking for a value with
  /// name [name], as reported by [CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSUIScrollViewContentInsetAdjustmentBehavior? byName(
    String? name,
  ) {
    if (name != null) {
      try {
        return CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.values
            .firstWhere((element) => element.name() == name);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSUIScrollViewContentInsetAdjustmentBehavior] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSUIScrollViewContentInsetAdjustmentBehavior>
  asNameMap() => <String, CygnusIOSUIScrollViewContentInsetAdjustmentBehavior>{
    for (final value
        in CygnusIOSUIScrollViewContentInsetAdjustmentBehavior.values)
      value.name(): value,
  };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 3:
        return 'ALWAYS';
      case 0:
        return 'AUTOMATIC';
      case 2:
        return 'NEVER';
      case 1:
        return 'SCROLLABLE_AXES';
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
