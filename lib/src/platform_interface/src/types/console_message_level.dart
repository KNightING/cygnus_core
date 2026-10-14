import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

part 'console_message_level.g.dart';

///Class representing the level of a console message.
@ExchangeableEnum()
class CygnusConsoleMessageLevel_ {
  // ignore: unused_field
  final int _value;
  const CygnusConsoleMessageLevel_._internal(this._value);

  ///Console TIP level
  static const TIP = const CygnusConsoleMessageLevel_._internal(0);

  ///Console LOG level
  static const LOG = const CygnusConsoleMessageLevel_._internal(1);

  ///Console WARNING level
  static const WARNING = const CygnusConsoleMessageLevel_._internal(2);

  ///Console ERROR level
  static const ERROR = const CygnusConsoleMessageLevel_._internal(3);

  ///Console DEBUG level
  static const DEBUG = const CygnusConsoleMessageLevel_._internal(4);
}
