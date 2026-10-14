import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'web_resource_error_type.dart';
import 'enum_method.dart';

part 'web_resource_error.g.dart';

///Encapsulates information about errors occurred during loading of web resources.
@ExchangeableObject()
class CygnusWebResourceError_ {
  ///The type of the error.
  CygnusWebResourceErrorType_ type;

  ///The string describing the error.
  String description;

  CygnusWebResourceError_({required this.type, required this.description});
}
