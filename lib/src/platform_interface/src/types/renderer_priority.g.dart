// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renderer_priority.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class used by [CygnusRendererPriorityPolicy] class.
class CygnusRendererPriority {
  final int _value;
  final int? _nativeValue;
  const CygnusRendererPriority._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusRendererPriority._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusRendererPriority._internal(value, nativeValue());

  ///The renderer associated with this WebView is bound with the default priority for services.
  static const RENDERER_PRIORITY_BOUND = CygnusRendererPriority._internal(1, 1);

  ///The renderer associated with this WebView is bound with Android `Context#BIND_IMPORTANT`.
  static const RENDERER_PRIORITY_IMPORTANT = CygnusRendererPriority._internal(
    2,
    2,
  );

  ///The renderer associated with this WebView is bound with Android `Context#BIND_WAIVE_PRIORITY`.
  ///At this priority level WebView renderers will be strong targets for out of memory killing.
  static const RENDERER_PRIORITY_WAIVED = CygnusRendererPriority._internal(
    0,
    0,
  );

  ///Set of all values of [CygnusRendererPriority].
  static final Set<CygnusRendererPriority> values = [
    CygnusRendererPriority.RENDERER_PRIORITY_BOUND,
    CygnusRendererPriority.RENDERER_PRIORITY_IMPORTANT,
    CygnusRendererPriority.RENDERER_PRIORITY_WAIVED,
  ].toSet();

  ///Gets a possible [CygnusRendererPriority] instance from [int] value.
  static CygnusRendererPriority? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusRendererPriority.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusRendererPriority] instance from a native value.
  static CygnusRendererPriority? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusRendererPriority.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusRendererPriority] instance value with name [name].
  ///
  /// Goes through [CygnusRendererPriority.values] looking for a value with
  /// name [name], as reported by [CygnusRendererPriority.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusRendererPriority? byName(String? name) {
    if (name != null) {
      try {
        return CygnusRendererPriority.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusRendererPriority] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusRendererPriority> asNameMap() =>
      <String, CygnusRendererPriority>{
        for (final value in CygnusRendererPriority.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'RENDERER_PRIORITY_BOUND';
      case 2:
        return 'RENDERER_PRIORITY_IMPORTANT';
      case 0:
        return 'RENDERER_PRIORITY_WAIVED';
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
