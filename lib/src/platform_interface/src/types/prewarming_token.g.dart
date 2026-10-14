// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prewarming_token.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the Prewarming Token returned by [CygnusPlatformChromeSafariBrowser.prewarmConnections].
class CygnusPrewarmingToken {
  ///Prewarming Token id.
  final String id;
  CygnusPrewarmingToken({required this.id});

  ///Gets a possible [CygnusPrewarmingToken] instance from a [Map] value.
  static CygnusPrewarmingToken? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusPrewarmingToken(id: map['id']);
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"id": id};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusPrewarmingToken{id: $id}';
  }
}
