import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'meta_tag.dart';
import 'enum_method.dart';

part 'meta_tag_attribute.g.dart';

///Class that represents an attribute of a `<meta>` HTML tag. It is used by the [CygnusMetaTag] class.
@ExchangeableObject()
class CygnusMetaTagAttribute_ {
  ///The attribute name.
  String? name;

  ///The attribute value.
  String? value;

  CygnusMetaTagAttribute_({this.name, this.value});
}
