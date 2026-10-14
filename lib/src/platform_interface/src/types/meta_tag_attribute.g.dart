// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_tag_attribute.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents an attribute of a `<meta>` HTML tag. It is used by the [CygnusMetaTag] class.
class CygnusMetaTagAttribute {
  ///The attribute name.
  String? name;

  ///The attribute value.
  String? value;
  CygnusMetaTagAttribute({this.name, this.value});

  ///Gets a possible [CygnusMetaTagAttribute] instance from a [Map] value.
  static CygnusMetaTagAttribute? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusMetaTagAttribute(
      name: map['name'],
      value: map['value'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"name": name, "value": value};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusMetaTagAttribute{name: $name, value: $value}';
  }
}
