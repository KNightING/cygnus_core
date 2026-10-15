import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import '../types/enum_method.dart';

part 'web_storage_item.g.dart';

///Class that represents a single web storage item of the JavaScript `window.sessionStorage` and `window.localStorage` objects.
@ExchangeableObject()
class CygnusWebStorageItem_ {
  ///Item key.
  String? key;

  ///Item value.
  dynamic value;

  CygnusWebStorageItem_({this.key, this.value});
}
