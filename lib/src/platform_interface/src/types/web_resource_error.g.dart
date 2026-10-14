// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_resource_error.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Encapsulates information about errors occurred during loading of web resources.
class CygnusWebResourceError {
  ///The string describing the error.
  String description;

  ///The type of the error.
  CygnusWebResourceErrorType type;
  CygnusWebResourceError({required this.description, required this.type});

  ///Gets a possible [CygnusWebResourceError] instance from a [Map] value.
  static CygnusWebResourceError? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebResourceError(
      description: map['description'],
      type: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusWebResourceErrorType.fromNativeValue(map['type']),
        CygnusEnumMethod.value => CygnusWebResourceErrorType.fromValue(
          map['type'],
        ),
        CygnusEnumMethod.name => CygnusWebResourceErrorType.byName(map['type']),
      }!,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "description": description,
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
    return 'CygnusWebResourceError{description: $description, type: $type}';
  }
}
