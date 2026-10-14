// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_storage_item.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a single web storage item of the JavaScript `window.sessionStorage` and `window.localStorage` objects.
class CygnusWebStorageItem {
  ///Item key.
  String? key;

  ///Item value.
  dynamic value;
  CygnusWebStorageItem({this.key, this.value});

  ///Gets a possible [CygnusWebStorageItem] instance from a [Map] value.
  static CygnusWebStorageItem? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebStorageItem(key: map['key'], value: map['value']);
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"key": key, "value": value};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebStorageItem{key: $key, value: $value}';
  }
}
