// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_process_infos_changed_detail.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///An object that contains information for the [CygnusPlatformWebViewEnvironment.onProcessInfosChanged] event.
class CygnusBrowserProcessInfosChangedDetail {
  ///The kind of the process.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  List<CygnusBrowserProcessInfo> infos;
  CygnusBrowserProcessInfosChangedDetail({this.infos = const []});

  ///Gets a possible [CygnusBrowserProcessInfosChangedDetail] instance from a [Map] value.
  static CygnusBrowserProcessInfosChangedDetail? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusBrowserProcessInfosChangedDetail();
    if (map['infos'] != null) {
      instance.infos = List<CygnusBrowserProcessInfo>.from(
        map['infos'].map(
          (e) => CygnusBrowserProcessInfo.fromMap(
            e?.cast<String, dynamic>(),
            enumMethod: enumMethod,
          )!,
        ),
      );
    }
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "infos": infos.map((e) => e.toMap(enumMethod: enumMethod)).toList(),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusBrowserProcessInfosChangedDetail{infos: $infos}';
  }
}
