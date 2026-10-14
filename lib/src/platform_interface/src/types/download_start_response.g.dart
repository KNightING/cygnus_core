// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'download_start_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class representing a download response of the WebView used by the event [CygnusPlatformWebViewCreationParams.onDownloadStartRequest].
class CygnusDownloadStartResponse {
  ///Action to take for the download request.
  ///
  ///If canceled, the download save dialog is not displayed regardless of the [handled] property.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  CygnusDownloadStartResponseAction? action;

  ///Set this flag to `true` to hide the default download dialog for this download.
  ///
  ///The download will progress as normal if it is not canceled, there will just be no default UI shown.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  bool handled;

  ///The path to the file.
  ///
  ///If setting the path, the host should ensure that it is an absolute path,
  ///including the file name, and that the path does not point to an existing file.
  ///If the path points to an existing file, the file will be overwritten.
  ///If the directory does not exist, it is created.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  String? resultFilePath;
  CygnusDownloadStartResponse({
    this.action,
    required this.handled,
    this.resultFilePath,
  });

  ///Gets a possible [CygnusDownloadStartResponse] instance from a [Map] value.
  static CygnusDownloadStartResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusDownloadStartResponse(
      action: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusDownloadStartResponseAction.fromNativeValue(map['action']),
        CygnusEnumMethod.value => CygnusDownloadStartResponseAction.fromValue(
          map['action'],
        ),
        CygnusEnumMethod.name => CygnusDownloadStartResponseAction.byName(
          map['action'],
        ),
      },
      handled: map['handled'],
      resultFilePath: map['resultFilePath'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "action": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => action?.toNativeValue(),
        CygnusEnumMethod.value => action?.toValue(),
        CygnusEnumMethod.name => action?.name(),
      },
      "handled": handled,
      "resultFilePath": resultFilePath,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusDownloadStartResponse{action: $action, handled: $handled, resultFilePath: $resultFilePath}';
  }
}
