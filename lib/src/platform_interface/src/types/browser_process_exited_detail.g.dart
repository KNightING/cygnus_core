// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'browser_process_exited_detail.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///An object that contains information for the [CygnusPlatformWebViewEnvironment.onBrowserProcessExited] event.
class CygnusBrowserProcessExitedDetail {
  ///The kind of browser process exit that has occurred.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  CygnusBrowserProcessExitKind kind;

  ///The process ID of the browser process that has exited.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  int? processId;
  CygnusBrowserProcessExitedDetail({required this.kind, this.processId});

  ///Gets a possible [CygnusBrowserProcessExitedDetail] instance from a [Map] value.
  static CygnusBrowserProcessExitedDetail? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusBrowserProcessExitedDetail(
      kind: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusBrowserProcessExitKind.fromNativeValue(map['kind']),
        CygnusEnumMethod.value => CygnusBrowserProcessExitKind.fromValue(
          map['kind'],
        ),
        CygnusEnumMethod.name => CygnusBrowserProcessExitKind.byName(
          map['kind'],
        ),
      }!,
      processId: map['processId'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
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
    return 'CygnusBrowserProcessExitedDetail{kind: $kind, processId: $processId}';
  }
}
