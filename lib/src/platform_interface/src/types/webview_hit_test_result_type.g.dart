// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_hit_test_result_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class representing the [CygnusWebViewHitTestResult] type.
class CygnusWebViewHitTestResultType {
  final int _value;
  final int? _nativeValue;
  const CygnusWebViewHitTestResultType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusWebViewHitTestResultType._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusWebViewHitTestResultType._internal(value, nativeValue());

  ///[CygnusWebViewHitTestResult] for hitting an edit text area.
  static const EDIT_TEXT_TYPE = CygnusWebViewHitTestResultType._internal(9, 9);

  ///[CygnusWebViewHitTestResult] for hitting an email address.
  static const EMAIL_TYPE = CygnusWebViewHitTestResultType._internal(4, 4);

  ///[CygnusWebViewHitTestResult] for hitting a map address.
  static const GEO_TYPE = CygnusWebViewHitTestResultType._internal(3, 3);

  ///[CygnusWebViewHitTestResult] for hitting an HTML::img tag.
  static const IMAGE_TYPE = CygnusWebViewHitTestResultType._internal(5, 5);

  ///[CygnusWebViewHitTestResult] for hitting a phone number.
  static const PHONE_TYPE = CygnusWebViewHitTestResultType._internal(2, 2);

  ///[CygnusWebViewHitTestResult] for hitting a HTML::a tag with src=http.
  static const SRC_ANCHOR_TYPE = CygnusWebViewHitTestResultType._internal(7, 7);

  ///[CygnusWebViewHitTestResult] for hitting a HTML::a tag with src=http + HTML::img.
  static const SRC_IMAGE_ANCHOR_TYPE = CygnusWebViewHitTestResultType._internal(
    8,
    8,
  );

  ///Default [CygnusWebViewHitTestResult], where the target is unknown.
  static const UNKNOWN_TYPE = CygnusWebViewHitTestResultType._internal(0, 0);

  ///Set of all values of [CygnusWebViewHitTestResultType].
  static final Set<CygnusWebViewHitTestResultType> values = [
    CygnusWebViewHitTestResultType.EDIT_TEXT_TYPE,
    CygnusWebViewHitTestResultType.EMAIL_TYPE,
    CygnusWebViewHitTestResultType.GEO_TYPE,
    CygnusWebViewHitTestResultType.IMAGE_TYPE,
    CygnusWebViewHitTestResultType.PHONE_TYPE,
    CygnusWebViewHitTestResultType.SRC_ANCHOR_TYPE,
    CygnusWebViewHitTestResultType.SRC_IMAGE_ANCHOR_TYPE,
    CygnusWebViewHitTestResultType.UNKNOWN_TYPE,
  ].toSet();

  ///Gets a possible [CygnusWebViewHitTestResultType] instance from [int] value.
  static CygnusWebViewHitTestResultType? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebViewHitTestResultType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWebViewHitTestResultType] instance from a native value.
  static CygnusWebViewHitTestResultType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebViewHitTestResultType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWebViewHitTestResultType] instance value with name [name].
  ///
  /// Goes through [CygnusWebViewHitTestResultType.values] looking for a value with
  /// name [name], as reported by [CygnusWebViewHitTestResultType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWebViewHitTestResultType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWebViewHitTestResultType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWebViewHitTestResultType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWebViewHitTestResultType> asNameMap() =>
      <String, CygnusWebViewHitTestResultType>{
        for (final value in CygnusWebViewHitTestResultType.values)
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
        return 'EDIT_TEXT_TYPE';
      case 4:
        return 'EMAIL_TYPE';
      case 3:
        return 'GEO_TYPE';
      case 5:
        return 'IMAGE_TYPE';
      case 2:
        return 'PHONE_TYPE';
      case 7:
        return 'SRC_ANCHOR_TYPE';
      case 8:
        return 'SRC_IMAGE_ANCHOR_TYPE';
      case 0:
        return 'UNKNOWN_TYPE';
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
