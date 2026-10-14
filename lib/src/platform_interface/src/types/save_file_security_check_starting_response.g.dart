// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_file_security_check_starting_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onSaveFileSecurityCheckStarting] event.
class CygnusSaveFileSecurityCheckStartingResponse {
  ///Whether to cancel the save operation.
  bool? cancelSave;

  ///Whether to suppress the default policy check.
  bool? suppressDefaultPolicy;
  CygnusSaveFileSecurityCheckStartingResponse({
    this.cancelSave,
    this.suppressDefaultPolicy,
  });

  ///Gets a possible [CygnusSaveFileSecurityCheckStartingResponse] instance from a [Map] value.
  static CygnusSaveFileSecurityCheckStartingResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusSaveFileSecurityCheckStartingResponse(
      cancelSave: map['cancelSave'],
      suppressDefaultPolicy: map['suppressDefaultPolicy'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "cancelSave": cancelSave,
      "suppressDefaultPolicy": suppressDefaultPolicy,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusSaveFileSecurityCheckStartingResponse{cancelSave: $cancelSave, suppressDefaultPolicy: $suppressDefaultPolicy}';
  }
}
