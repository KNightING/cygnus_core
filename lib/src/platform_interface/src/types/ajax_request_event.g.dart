// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ajax_request_event.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class used by [CygnusAjaxRequest] class. It represents events measuring progress of an [CygnusAjaxRequest].
class CygnusAjaxRequestEvent {
  ///Is a Boolean flag indicating if the total work to be done, and the amount of work already done, by the underlying process is calculable.
  ///In other words, it tells if the progress is measurable or not.
  bool? lengthComputable;

  ///Is an integer representing the amount of work already performed by the underlying process.
  ///The ratio of work done can be calculated with the property and [CygnusAjaxRequestEvent.total].
  ///When downloading a resource using HTTP, this only represent the part of the content itself, not headers and other overhead.
  int? loaded;

  ///Is an integer representing the total amount of work that the underlying process is in the progress of performing.
  ///When downloading a resource using HTTP, this only represent the content itself, not headers and other overhead.
  int? total;

  ///Event type.
  CygnusAjaxRequestEventType? type;
  CygnusAjaxRequestEvent({
    this.lengthComputable,
    this.loaded,
    this.total,
    this.type,
  });

  ///Gets a possible [CygnusAjaxRequestEvent] instance from a [Map] value.
  static CygnusAjaxRequestEvent? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusAjaxRequestEvent(
      lengthComputable: map['lengthComputable'],
      loaded: map['loaded'],
      total: map['total'],
      type: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusAjaxRequestEventType.fromNativeValue(map['type']),
        CygnusEnumMethod.value => CygnusAjaxRequestEventType.fromValue(
          map['type'],
        ),
        CygnusEnumMethod.name => CygnusAjaxRequestEventType.byName(map['type']),
      },
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "lengthComputable": lengthComputable,
      "loaded": loaded,
      "total": total,
      "type": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => type?.toNativeValue(),
        CygnusEnumMethod.value => type?.toValue(),
        CygnusEnumMethod.name => type?.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusAjaxRequestEvent{lengthComputable: $lengthComputable, loaded: $loaded, total: $total, type: $type}';
  }
}
