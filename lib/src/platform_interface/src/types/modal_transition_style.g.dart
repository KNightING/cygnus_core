// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modal_transition_style.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used to specify the transition style when presenting a view controller.
class CygnusModalTransitionStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusModalTransitionStyle._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusModalTransitionStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusModalTransitionStyle._internal(value, nativeValue());

  ///When the view controller is presented, its view slides up from the bottom of the screen.
  ///On dismissal, the view slides back down. This is the default transition style.
  static const COVER_VERTICAL = CygnusModalTransitionStyle._internal(0, 0);

  ///When the view controller is presented, the current view fades out while the new view fades in at the same time.
  ///On dismissal, a similar type of cross-fade is used to return to the original view.
  static const CROSS_DISSOLVE = CygnusModalTransitionStyle._internal(2, 2);

  ///When the view controller is presented, the current view initiates a horizontal 3D flip from right-to-left,
  ///resulting in the revealing of the new view as if it were on the back of the previous view.
  ///On dismissal, the flip occurs from left-to-right, returning to the original view.
  static const FLIP_HORIZONTAL = CygnusModalTransitionStyle._internal(1, 1);

  ///When the view controller is presented, one corner of the current view curls up to reveal the presented view underneath.
  ///On dismissal, the curled up page unfurls itself back on top of the presented view.
  ///A view controller presented using this transition is itself prevented from presenting any additional view controllers.
  static const PARTIAL_CURL = CygnusModalTransitionStyle._internal(3, 3);

  ///Set of all values of [CygnusModalTransitionStyle].
  static final Set<CygnusModalTransitionStyle> values = [
    CygnusModalTransitionStyle.COVER_VERTICAL,
    CygnusModalTransitionStyle.CROSS_DISSOLVE,
    CygnusModalTransitionStyle.FLIP_HORIZONTAL,
    CygnusModalTransitionStyle.PARTIAL_CURL,
  ].toSet();

  ///Gets a possible [CygnusModalTransitionStyle] instance from [int] value.
  static CygnusModalTransitionStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusModalTransitionStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusModalTransitionStyle] instance from a native value.
  static CygnusModalTransitionStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusModalTransitionStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusModalTransitionStyle] instance value with name [name].
  ///
  /// Goes through [CygnusModalTransitionStyle.values] looking for a value with
  /// name [name], as reported by [CygnusModalTransitionStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusModalTransitionStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusModalTransitionStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusModalTransitionStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusModalTransitionStyle> asNameMap() =>
      <String, CygnusModalTransitionStyle>{
        for (final value in CygnusModalTransitionStyle.values)
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
        return 'COVER_VERTICAL';
      case 2:
        return 'CROSS_DISSOLVE';
      case 1:
        return 'FLIP_HORIZONTAL';
      case 3:
        return 'PARTIAL_CURL';
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

///An iOS-specific class used to specify the transition style when presenting a view controller.
///Use [CygnusModalTransitionStyle] instead.
@Deprecated('Use CygnusModalTransitionStyle instead')
class CygnusIOSUIModalTransitionStyle {
  final int _value;
  final int? _nativeValue;
  const CygnusIOSUIModalTransitionStyle._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusIOSUIModalTransitionStyle._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusIOSUIModalTransitionStyle._internal(value, nativeValue());

  ///When the view controller is presented, its view slides up from the bottom of the screen.
  ///On dismissal, the view slides back down. This is the default transition style.
  static const COVER_VERTICAL = CygnusIOSUIModalTransitionStyle._internal(0, 0);

  ///When the view controller is presented, the current view fades out while the new view fades in at the same time.
  ///On dismissal, a similar type of cross-fade is used to return to the original view.
  static const CROSS_DISSOLVE = CygnusIOSUIModalTransitionStyle._internal(2, 2);

  ///When the view controller is presented, the current view initiates a horizontal 3D flip from right-to-left,
  ///resulting in the revealing of the new view as if it were on the back of the previous view.
  ///On dismissal, the flip occurs from left-to-right, returning to the original view.
  static const FLIP_HORIZONTAL = CygnusIOSUIModalTransitionStyle._internal(
    1,
    1,
  );

  ///When the view controller is presented, one corner of the current view curls up to reveal the presented view underneath.
  ///On dismissal, the curled up page unfurls itself back on top of the presented view.
  ///A view controller presented using this transition is itself prevented from presenting any additional view controllers.
  static const PARTIAL_CURL = CygnusIOSUIModalTransitionStyle._internal(3, 3);

  ///Set of all values of [CygnusIOSUIModalTransitionStyle].
  static final Set<CygnusIOSUIModalTransitionStyle> values = [
    CygnusIOSUIModalTransitionStyle.COVER_VERTICAL,
    CygnusIOSUIModalTransitionStyle.CROSS_DISSOLVE,
    CygnusIOSUIModalTransitionStyle.FLIP_HORIZONTAL,
    CygnusIOSUIModalTransitionStyle.PARTIAL_CURL,
  ].toSet();

  ///Gets a possible [CygnusIOSUIModalTransitionStyle] instance from [int] value.
  static CygnusIOSUIModalTransitionStyle? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSUIModalTransitionStyle.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusIOSUIModalTransitionStyle] instance from a native value.
  static CygnusIOSUIModalTransitionStyle? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusIOSUIModalTransitionStyle.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusIOSUIModalTransitionStyle] instance value with name [name].
  ///
  /// Goes through [CygnusIOSUIModalTransitionStyle.values] looking for a value with
  /// name [name], as reported by [CygnusIOSUIModalTransitionStyle.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusIOSUIModalTransitionStyle? byName(String? name) {
    if (name != null) {
      try {
        return CygnusIOSUIModalTransitionStyle.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusIOSUIModalTransitionStyle] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusIOSUIModalTransitionStyle> asNameMap() =>
      <String, CygnusIOSUIModalTransitionStyle>{
        for (final value in CygnusIOSUIModalTransitionStyle.values)
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
        return 'COVER_VERTICAL';
      case 2:
        return 'CROSS_DISSOLVE';
      case 1:
        return 'FLIP_HORIZONTAL';
      case 3:
        return 'PARTIAL_CURL';
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
