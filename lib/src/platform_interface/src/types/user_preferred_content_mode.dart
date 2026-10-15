import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'user_preferred_content_mode.g.dart';

///Class that represents the content mode to prefer when loading and rendering a webpage.
@ExchangeableEnum()
class CygnusUserPreferredContentMode_ {
  // ignore: unused_field
  final int _value;
  const CygnusUserPreferredContentMode_._internal(this._value);

  ///The recommended content mode for the current platform.
  static const RECOMMENDED = const CygnusUserPreferredContentMode_._internal(0);

  ///Represents content targeting mobile browsers.
  static const MOBILE = const CygnusUserPreferredContentMode_._internal(1);

  ///Represents content targeting desktop browsers.
  static const DESKTOP = const CygnusUserPreferredContentMode_._internal(2);
}
