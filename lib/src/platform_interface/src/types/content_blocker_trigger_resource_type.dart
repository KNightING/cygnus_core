import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../content_blocker.dart';

part 'content_blocker_trigger_resource_type.g.dart';

///Class that represents the possible resource type defined for a [CygnusContentBlockerTrigger].
@ExchangeableEnum()
class CygnusContentBlockerTriggerResourceType_ {
  // ignore: unused_field
  final String _value;
  const CygnusContentBlockerTriggerResourceType_._internal(this._value);

  static const DOCUMENT = const CygnusContentBlockerTriggerResourceType_._internal(
    'document',
  );
  static const IMAGE = const CygnusContentBlockerTriggerResourceType_._internal(
    'image',
  );
  static const STYLE_SHEET = const CygnusContentBlockerTriggerResourceType_._internal(
    'style-sheet',
  );
  static const SCRIPT = const CygnusContentBlockerTriggerResourceType_._internal(
    'script',
  );
  static const FONT = const CygnusContentBlockerTriggerResourceType_._internal(
    'font',
  );
  static const MEDIA = const CygnusContentBlockerTriggerResourceType_._internal(
    'media',
  );
  static const SVG_DOCUMENT =
      const CygnusContentBlockerTriggerResourceType_._internal('svg-document');

  ///Any untyped load
  static const RAW = const CygnusContentBlockerTriggerResourceType_._internal('raw');
}
