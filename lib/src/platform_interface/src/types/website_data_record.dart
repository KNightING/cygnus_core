import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

import 'website_data_type.dart';
import 'enum_method.dart';

part 'website_data_record.g.dart';

///Class that represents website data, grouped by domain name using the public suffix list.
@ExchangeableObject()
class CygnusWebsiteDataRecord_ {
  ///The display name for the data record. This is usually the domain name.
  String? displayName;

  ///The various types of website data that exist for this data record.
  Set<CygnusWebsiteDataType_>? dataTypes;

  CygnusWebsiteDataRecord_({this.displayName, this.dataTypes});
}

///Class that represents website data, grouped by domain name using the public suffix list.
///
///**NOTE**: available on iOS 9.0+.
///
///Use [CygnusWebsiteDataRecord] instead.
@Deprecated("Use CygnusWebsiteDataRecord instead")
@ExchangeableObject()
class CygnusIOSWKWebsiteDataRecord_ {
  ///The display name for the data record. This is usually the domain name.
  String? displayName;

  ///The various types of website data that exist for this data record.
  Set<CygnusIOSWKWebsiteDataType_>? dataTypes;

  CygnusIOSWKWebsiteDataRecord_({this.displayName, this.dataTypes});
}
