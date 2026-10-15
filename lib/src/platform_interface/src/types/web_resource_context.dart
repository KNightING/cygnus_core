import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';

part 'web_resource_context.g.dart';

///Constants that describe the web resource request contexts.
@ExchangeableEnum()
class CygnusWebResourceContext_ {
  // ignore: unused_field
  final int _value;
  const CygnusWebResourceContext_._internal(this._value);

  ///All resources.
  static const ALL = CygnusWebResourceContext_._internal(0);

  ///Document resource.
  static const DOCUMENT = CygnusWebResourceContext_._internal(1);

  ///CSS resource.
  static const STYLESHEET = CygnusWebResourceContext_._internal(2);

  ///Image resource.
  static const IMAGE = CygnusWebResourceContext_._internal(3);

  ///Media resource.
  static const MEDIA = CygnusWebResourceContext_._internal(4);

  ///Font resource.
  static const FONT = CygnusWebResourceContext_._internal(5);

  ///Script resource.
  static const SCRIPT = CygnusWebResourceContext_._internal(6);

  ///XML HTTP request resource.
  static const XML_HTTP_REQUEST = CygnusWebResourceContext_._internal(7);

  ///Fetch API resource.
  static const FETCH = CygnusWebResourceContext_._internal(8);

  ///TextTrack resource.
  static const TEXT_TRACK = CygnusWebResourceContext_._internal(9);

  ///EventSource resource.
  static const EVENT_SOURCE = CygnusWebResourceContext_._internal(10);

  ///WebSocket resource.
  static const WEBSOCKET = CygnusWebResourceContext_._internal(11);

  ///Web App Manifest resource.
  static const MANIFEST = CygnusWebResourceContext_._internal(12);

  ///Signed HTTP Exchange resource.
  static const SIGNED_EXCHANGE = CygnusWebResourceContext_._internal(13);

  ///Ping request.
  static const PING = CygnusWebResourceContext_._internal(14);

  ///CSP Violation Report resource.
  static const CSP_VIOLATION_REPORT = CygnusWebResourceContext_._internal(15);

  ///Other resource.
  static const OTHER = CygnusWebResourceContext_._internal(16);
}
