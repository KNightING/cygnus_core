// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_process_info.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///An object that contains information for a process in the [CygnusPlatformWebViewEnvironment].
class CygnusBrowserProcessInfo {
  ///A list of associated [CygnusFrameInfo]s which are actively running
  ///(showing or hiding UI elements) in the renderer process.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2 1.0.2210.55+
  List<CygnusFrameInfo>? frameInfos;

  ///The kind of the process.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  CygnusBrowserProcessKind kind;

  ///The process id of the process.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  int? processId;
  CygnusBrowserProcessInfo({
    this.frameInfos,
    required this.kind,
    this.processId,
  });

  ///Gets a possible [CygnusBrowserProcessInfo] instance from a [Map] value.
  static CygnusBrowserProcessInfo? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusBrowserProcessInfo(
      frameInfos: map['frameInfos'] != null
          ? List<CygnusFrameInfo>.from(
              map['frameInfos'].map(
                (e) => CygnusFrameInfo.fromMap(
                  e?.cast<String, dynamic>(),
                  enumMethod: enumMethod,
                )!,
              ),
            )
          : null,
      kind: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusBrowserProcessKind.fromNativeValue(map['kind']),
        CygnusEnumMethod.value => CygnusBrowserProcessKind.fromValue(
          map['kind'],
        ),
        CygnusEnumMethod.name => CygnusBrowserProcessKind.byName(map['kind']),
      }!,
      processId: map['processId'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "frameInfos": frameInfos
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "kind": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => kind.toNativeValue(),
        CygnusEnumMethod.value => kind.toValue(),
        CygnusEnumMethod.name => kind.name(),
      },
      "processId": processId,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusBrowserProcessInfo{frameInfos: $frameInfos, kind: $kind, processId: $processId}';
  }
}
