// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sandbox.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that describes what to allow in the iframe.
class CygnusSandbox {
  final String? _value;
  final String? _nativeValue;
  const CygnusSandbox._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusSandbox._internalMultiPlatform(
    String? value,
    Function nativeValue,
  ) => CygnusSandbox._internal(value, nativeValue());

  ///Allow all.
  static const ALLOW_ALL = const [_ALL];

  ///Allows for downloads to occur with a gesture from the user.
  static const ALLOW_DOWNLOADS = CygnusSandbox._internal(
    'allow-downloads',
    'allow-downloads',
  );

  ///Allows the resource to submit forms. If this keyword is not used, form submission is blocked.
  static const ALLOW_FORMS = CygnusSandbox._internal(
    'allow-forms',
    'allow-forms',
  );

  ///Lets the resource open modal windows.
  static const ALLOW_MODALS = CygnusSandbox._internal(
    'allow-modals',
    'allow-modals',
  );

  ///Allow none.
  static const ALLOW_NONE = const [_NONE];

  ///Lets the resource lock the screen orientation.
  static const ALLOW_ORIENTATION_LOCK = CygnusSandbox._internal(
    'allow-orientation-lock',
    'allow-orientation-lock',
  );

  ///Lets the resource use the Pointer Lock API.
  static const ALLOW_POINTER_LOCK = CygnusSandbox._internal(
    'allow-pointer-lock',
    'allow-pointer-lock',
  );

  ///Allows popups (such as `window.open()`, `target="_blank"`, or `showModalDialog()`).
  ///If this keyword is not used, the popup will silently fail to open.
  static const ALLOW_POPUPS = CygnusSandbox._internal(
    'allow-popups',
    'allow-popups',
  );

  ///Lets the sandboxed document open new windows without those windows inheriting the sandboxing.
  ///For example, this can safely sandbox an advertisement without forcing the same restrictions upon the page the ad links to.
  static const ALLOW_POPUPS_TO_ESCAPE_SANDBOX = CygnusSandbox._internal(
    'allow-popups-to-escape-sandbox',
    'allow-popups-to-escape-sandbox',
  );

  ///Lets the resource start a presentation session.
  static const ALLOW_PRESENTATION = CygnusSandbox._internal(
    'allow-presentation',
    'allow-presentation',
  );

  ///If this token is not used, the resource is treated as being from a special origin that always fails the
  ///same-origin policy (potentially preventing access to data storage/cookies and some JavaScript APIs).
  static const ALLOW_SAME_ORIGIN = CygnusSandbox._internal(
    'allow-same-origin',
    'allow-same-origin',
  );

  ///Lets the resource run scripts (but not create popup windows).
  static const ALLOW_SCRIPTS = CygnusSandbox._internal(
    'allow-scripts',
    'allow-scripts',
  );

  ///Lets the resource navigate the top-level browsing context (the one named `_top`).
  static const ALLOW_TOP_NAVIGATION = CygnusSandbox._internal(
    'allow-top-navigation',
    'allow-top-navigation',
  );

  ///Lets the resource navigate the top-level browsing context, but only if initiated by a user gesture.
  static const ALLOW_TOP_NAVIGATION_BY_USER_ACTIVATION =
      CygnusSandbox._internal(
        'allow-top-navigation-by-user-activation',
        'allow-top-navigation-by-user-activation',
      );
  static const _ALL = CygnusSandbox._internal(null, null);
  static const _NONE = CygnusSandbox._internal('', '');

  ///Set of all values of [CygnusSandbox].
  static final Set<CygnusSandbox> values = [
    CygnusSandbox.ALLOW_DOWNLOADS,
    CygnusSandbox.ALLOW_FORMS,
    CygnusSandbox.ALLOW_MODALS,
    CygnusSandbox.ALLOW_ORIENTATION_LOCK,
    CygnusSandbox.ALLOW_POINTER_LOCK,
    CygnusSandbox.ALLOW_POPUPS,
    CygnusSandbox.ALLOW_POPUPS_TO_ESCAPE_SANDBOX,
    CygnusSandbox.ALLOW_PRESENTATION,
    CygnusSandbox.ALLOW_SAME_ORIGIN,
    CygnusSandbox.ALLOW_SCRIPTS,
    CygnusSandbox.ALLOW_TOP_NAVIGATION,
    CygnusSandbox.ALLOW_TOP_NAVIGATION_BY_USER_ACTIVATION,
  ].toSet();

  /// Gets a possible [CygnusSandbox] instance value with name [name].
  ///
  /// Goes through [CygnusSandbox.values] looking for a value with
  /// name [name], as reported by [CygnusSandbox.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusSandbox? byName(String? name) {
    if (name != null) {
      try {
        return CygnusSandbox.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusSandbox] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusSandbox> asNameMap() => <String, CygnusSandbox>{
    for (final value in CygnusSandbox.values) value.name(): value,
  };

  ///Gets a possible [CygnusSandbox] instance from a native value.
  static CygnusSandbox? fromNativeValue(String? value) {
    if (value == null) {
      return CygnusSandbox._ALL;
    } else if (value == "") {
      return CygnusSandbox._NONE;
    }
    try {
      return CygnusSandbox.values.firstWhere(
        (element) => element.toNativeValue() == value,
      );
    } catch (e) {
      return null;
    }
  }

  ///Gets a possible [CygnusSandbox] instance from a [String] value.
  static CygnusSandbox? fromValue(String? value) {
    if (value == null) {
      return CygnusSandbox._ALL;
    } else if (value == "") {
      return CygnusSandbox._NONE;
    }
    try {
      return CygnusSandbox.values.firstWhere(
        (element) => element.toValue() == value,
      );
    } catch (e) {
      return null;
    }
  }

  ///Gets [String] value.
  String? toValue() => _value;
  @override
  String toString() {
    if (_value == null) return 'allow-all';
    if (_value == '') return 'allow-none';
    return _value ?? '';
  }

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'allow-downloads':
        return 'ALLOW_DOWNLOADS';
      case 'allow-forms':
        return 'ALLOW_FORMS';
      case 'allow-modals':
        return 'ALLOW_MODALS';
      case 'allow-orientation-lock':
        return 'ALLOW_ORIENTATION_LOCK';
      case 'allow-pointer-lock':
        return 'ALLOW_POINTER_LOCK';
      case 'allow-popups':
        return 'ALLOW_POPUPS';
      case 'allow-popups-to-escape-sandbox':
        return 'ALLOW_POPUPS_TO_ESCAPE_SANDBOX';
      case 'allow-presentation':
        return 'ALLOW_PRESENTATION';
      case 'allow-same-origin':
        return 'ALLOW_SAME_ORIGIN';
      case 'allow-scripts':
        return 'ALLOW_SCRIPTS';
      case 'allow-top-navigation':
        return 'ALLOW_TOP_NAVIGATION';
      case 'allow-top-navigation-by-user-activation':
        return 'ALLOW_TOP_NAVIGATION_BY_USER_ACTIVATION';
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
}
