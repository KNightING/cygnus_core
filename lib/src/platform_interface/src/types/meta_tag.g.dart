// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_tag.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a `<meta>` HTML tag. It is used by the [CygnusPlatformWebViewController.getMetaTags] method.
class CygnusMetaTag {
  ///The meta tag attributes list.
  List<CygnusMetaTagAttribute>? attrs;

  ///The meta tag content value.
  String? content;

  ///The meta tag name value.
  String? name;
  CygnusMetaTag({this.attrs, this.content, this.name});

  ///Gets a possible [CygnusMetaTag] instance from a [Map] value.
  static CygnusMetaTag? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusMetaTag(
      attrs: map['attrs'] != null
          ? List<CygnusMetaTagAttribute>.from(
              map['attrs'].map(
                (e) => CygnusMetaTagAttribute.fromMap(
                  e?.cast<String, dynamic>(),
                  enumMethod: enumMethod,
                )!,
              ),
            )
          : null,
      content: map['content'],
      name: map['name'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "attrs": attrs?.map((e) => e.toMap(enumMethod: enumMethod)).toList(),
      "content": content,
      "name": name,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusMetaTag{attrs: $attrs, content: $content, name: $name}';
  }
}
