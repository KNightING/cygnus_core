// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_blocker_trigger_resource_type.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the possible resource type defined for a [CygnusContentBlockerTrigger].
class CygnusContentBlockerTriggerResourceType {
  final String _value;
  final String? _nativeValue;
  const CygnusContentBlockerTriggerResourceType._internal(
    this._value,
    this._nativeValue,
  );
  // ignore: unused_element
  factory CygnusContentBlockerTriggerResourceType._internalMultiPlatform(
    String value,
    Function nativeValue,
  ) => CygnusContentBlockerTriggerResourceType._internal(value, nativeValue());
  static const DOCUMENT = CygnusContentBlockerTriggerResourceType._internal(
    'document',
    'document',
  );
  static const FONT = CygnusContentBlockerTriggerResourceType._internal(
    'font',
    'font',
  );
  static const IMAGE = CygnusContentBlockerTriggerResourceType._internal(
    'image',
    'image',
  );
  static const MEDIA = CygnusContentBlockerTriggerResourceType._internal(
    'media',
    'media',
  );

  ///Any untyped load
  static const RAW = CygnusContentBlockerTriggerResourceType._internal(
    'raw',
    'raw',
  );
  static const SCRIPT = CygnusContentBlockerTriggerResourceType._internal(
    'script',
    'script',
  );
  static const STYLE_SHEET = CygnusContentBlockerTriggerResourceType._internal(
    'style-sheet',
    'style-sheet',
  );
  static const SVG_DOCUMENT = CygnusContentBlockerTriggerResourceType._internal(
    'svg-document',
    'svg-document',
  );

  ///Set of all values of [CygnusContentBlockerTriggerResourceType].
  static final Set<CygnusContentBlockerTriggerResourceType> values = [
    CygnusContentBlockerTriggerResourceType.DOCUMENT,
    CygnusContentBlockerTriggerResourceType.FONT,
    CygnusContentBlockerTriggerResourceType.IMAGE,
    CygnusContentBlockerTriggerResourceType.MEDIA,
    CygnusContentBlockerTriggerResourceType.RAW,
    CygnusContentBlockerTriggerResourceType.SCRIPT,
    CygnusContentBlockerTriggerResourceType.STYLE_SHEET,
    CygnusContentBlockerTriggerResourceType.SVG_DOCUMENT,
  ].toSet();

  ///Gets a possible [CygnusContentBlockerTriggerResourceType] instance from [String] value.
  static CygnusContentBlockerTriggerResourceType? fromValue(String? value) {
    if (value != null) {
      try {
        return CygnusContentBlockerTriggerResourceType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusContentBlockerTriggerResourceType] instance from a native value.
  static CygnusContentBlockerTriggerResourceType? fromNativeValue(
    String? value,
  ) {
    if (value != null) {
      try {
        return CygnusContentBlockerTriggerResourceType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusContentBlockerTriggerResourceType] instance value with name [name].
  ///
  /// Goes through [CygnusContentBlockerTriggerResourceType.values] looking for a value with
  /// name [name], as reported by [CygnusContentBlockerTriggerResourceType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusContentBlockerTriggerResourceType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusContentBlockerTriggerResourceType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusContentBlockerTriggerResourceType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusContentBlockerTriggerResourceType> asNameMap() =>
      <String, CygnusContentBlockerTriggerResourceType>{
        for (final value in CygnusContentBlockerTriggerResourceType.values)
          value.name(): value,
      };

  ///Gets [String] value.
  String toValue() => _value;

  ///Gets [String] native value if supported by the current platform, otherwise `null`.
  String? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 'document':
        return 'DOCUMENT';
      case 'font':
        return 'FONT';
      case 'image':
        return 'IMAGE';
      case 'media':
        return 'MEDIA';
      case 'raw':
        return 'RAW';
      case 'script':
        return 'SCRIPT';
      case 'style-sheet':
        return 'STYLE_SHEET';
      case 'svg-document':
        return 'SVG_DOCUMENT';
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
