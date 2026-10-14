// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_message.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///The type corresponding to the [CygnusWebMessage].
class CygnusWebMessageType {
  final int _value;
  final int? _nativeValue;
  const CygnusWebMessageType._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusWebMessageType._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusWebMessageType._internal(value, nativeValue());

  ///Indicates the payload of WebMessageCompat is JavaScript ArrayBuffer.
  ///
  ///**NOTE**: available only if [CygnusWebViewFeature.WEB_MESSAGE_ARRAY_BUFFER] feature is supported.
  static const ARRAY_BUFFER = CygnusWebMessageType._internal(1, 1);

  ///Indicates the payload of WebMessageCompat is String.
  static const STRING = CygnusWebMessageType._internal(0, 0);

  ///Set of all values of [CygnusWebMessageType].
  static final Set<CygnusWebMessageType> values = [
    CygnusWebMessageType.ARRAY_BUFFER,
    CygnusWebMessageType.STRING,
  ].toSet();

  ///Gets a possible [CygnusWebMessageType] instance from [int] value.
  static CygnusWebMessageType? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebMessageType.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWebMessageType] instance from a native value.
  static CygnusWebMessageType? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusWebMessageType.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWebMessageType] instance value with name [name].
  ///
  /// Goes through [CygnusWebMessageType.values] looking for a value with
  /// name [name], as reported by [CygnusWebMessageType.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWebMessageType? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWebMessageType.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWebMessageType] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWebMessageType> asNameMap() =>
      <String, CygnusWebMessageType>{
        for (final value in CygnusWebMessageType.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 1:
        return 'ARRAY_BUFFER';
      case 0:
        return 'STRING';
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

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///The Dart representation of the HTML5 PostMessage event.
///See https://html.spec.whatwg.org/multipage/comms.html#the-messageevent-interfaces for definition of a MessageEvent in HTML5.
class CygnusWebMessage {
  ///The data of the message.
  dynamic data;

  ///The ports that are sent with the message.
  List<CygnusIWebMessagePort>? ports;

  ///The payload type of the message.
  CygnusWebMessageType type;
  CygnusWebMessage({
    this.data,
    this.type = CygnusWebMessageType.STRING,
    this.ports,
  }) {
    assert(
      ((this.data == null || this.data is String) &&
              this.type == CygnusWebMessageType.STRING) ||
          (this.data != null &&
              this.data is Uint8List &&
              this.type == CygnusWebMessageType.ARRAY_BUFFER),
    );
  }

  ///Gets a possible [CygnusWebMessage] instance from a [Map] value.
  static CygnusWebMessage? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebMessage(
      data: map['data'],
      ports: map['ports'] != null
          ? List<CygnusIWebMessagePort>.from(map['ports'].map((e) => e))
          : null,
      type: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusWebMessageType.fromNativeValue(
          map['type'],
        ),
        CygnusEnumMethod.value => CygnusWebMessageType.fromValue(map['type']),
        CygnusEnumMethod.name => CygnusWebMessageType.byName(map['type']),
      }!,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "data": data,
      "ports": ports?.map((e) => e.toMap(enumMethod: enumMethod)).toList(),
      "type": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => type.toNativeValue(),
        CygnusEnumMethod.value => type.toValue(),
        CygnusEnumMethod.name => type.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebMessage{data: $data, ports: $ports, type: $type}';
  }
}
