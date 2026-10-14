// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accelerator_key_pressed_detail.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents details of the [CygnusPlatformWebViewCreationParams.onAcceleratorKeyPressed] event.
class CygnusAcceleratorKeyPressedDetail {
  int? keyEventKind;
  CygnusPhysicalKeyStatus? physicalKeyStatus;
  int? virtualKey;
  CygnusAcceleratorKeyPressedDetail({
    this.keyEventKind,
    this.physicalKeyStatus,
    this.virtualKey,
  });

  ///Gets a possible [CygnusAcceleratorKeyPressedDetail] instance from a [Map] value.
  static CygnusAcceleratorKeyPressedDetail? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusAcceleratorKeyPressedDetail(
      keyEventKind: map['keyEventKind'],
      physicalKeyStatus: CygnusPhysicalKeyStatus.fromMap(
        map['physicalKeyStatus']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      virtualKey: map['virtualKey'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "keyEventKind": keyEventKind,
      "physicalKeyStatus": physicalKeyStatus?.toMap(enumMethod: enumMethod),
      "virtualKey": virtualKey,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusAcceleratorKeyPressedDetail{keyEventKind: $keyEventKind, physicalKeyStatus: $physicalKeyStatus, virtualKey: $virtualKey}';
  }
}
