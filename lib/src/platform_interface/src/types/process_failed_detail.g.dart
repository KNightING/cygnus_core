// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_failed_detail.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///An object that contains information about a frame on a webpage.
class CygnusProcessFailedDetail {
  ///The exit code of the failing process, for telemetry purposes.
  ///
  ///The exit code is always STILL_ACTIVE (259) when [CygnusProcessFailedKind.RENDER_PROCESS_UNRESPONSIVE].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  int? exitCode;

  ///This property is the full path of the module that caused the crash in cases of Windows Code Integrity failures.
  ///
  ///Windows Code Integrity is a feature that verifies the integrity and authenticity of dynamic-link libraries (DLLs) on Windows systems.
  ///It ensures that only trusted code can run on the system and prevents unauthorized or malicious modifications.
  ///When ProcessFailed occurred due to a failed Code Integrity check, this property returns the full path of the file that was prevented from loading on the system.
  ///The webview2 process which tried to load the DLL will fail with exit code STATUS_INVALID_IMAGE_HASH(-1073740760).
  ///A file can fail integrity check for various reasons, such as:
  ///- It has an invalid or missing signature that does not match the publisher or signer of the file.
  ///- It has been tampered with or corrupted by malware or other software.
  ///- It has been blocked by an administrator or a security policy. This property always will be the empty string if failure is not caused by STATUS_INVALID_IMAGE_HASH.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  String? failureSourceModulePath;

  ///The collection of [CygnusFrameInfo]s for frames in the WebView that were being rendered by the failed process.
  ///
  ///The content in these frames is replaced with an error page.
  ///This is only available when [CygnusProcessFailedKind] is [CygnusProcessFailedKind.FRAME_RENDER_PROCESS_EXITED];
  ///frames is null for all other process failure kinds, including the case in which the failed process was the renderer
  ///for the main frame and subframes within it, for which the failure kind is [CygnusProcessFailedKind.RENDER_PROCESS_EXITED].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  List<CygnusFrameInfo>? frameInfos;

  ///The kind of process failure that has occurred.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  CygnusProcessFailedKind kind;

  ///Description of the process assigned by the WebView2 Runtime.
  ///
  ///This is a technical English term appropriate for logging or development purposes, and not localized for the end user.
  ///It applies to utility processes (for example, "Audio Service", "Video Capture") and plugin processes (for example, "Flash").
  ///The returned [processDescription] is empty if the WebView2 Runtime did not assign a description to the process.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  String? processDescription;

  ///The reason for the process failure.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  CygnusProcessFailedReason? reason;
  CygnusProcessFailedDetail({
    this.exitCode,
    this.failureSourceModulePath,
    this.frameInfos,
    required this.kind,
    this.processDescription,
    this.reason,
  });

  ///Gets a possible [CygnusProcessFailedDetail] instance from a [Map] value.
  static CygnusProcessFailedDetail? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusProcessFailedDetail(
      exitCode: map['exitCode'],
      failureSourceModulePath: map['failureSourceModulePath'],
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
        CygnusEnumMethod.nativeValue => CygnusProcessFailedKind.fromNativeValue(
          map['kind'],
        ),
        CygnusEnumMethod.value => CygnusProcessFailedKind.fromValue(
          map['kind'],
        ),
        CygnusEnumMethod.name => CygnusProcessFailedKind.byName(map['kind']),
      }!,
      processDescription: map['processDescription'],
      reason: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusProcessFailedReason.fromNativeValue(map['reason']),
        CygnusEnumMethod.value => CygnusProcessFailedReason.fromValue(
          map['reason'],
        ),
        CygnusEnumMethod.name => CygnusProcessFailedReason.byName(
          map['reason'],
        ),
      },
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "exitCode": exitCode,
      "failureSourceModulePath": failureSourceModulePath,
      "frameInfos": frameInfos
          ?.map((e) => e.toMap(enumMethod: enumMethod))
          .toList(),
      "kind": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => kind.toNativeValue(),
        CygnusEnumMethod.value => kind.toValue(),
        CygnusEnumMethod.name => kind.name(),
      },
      "processDescription": processDescription,
      "reason": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => reason?.toNativeValue(),
        CygnusEnumMethod.value => reason?.toValue(),
        CygnusEnumMethod.name => reason?.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusProcessFailedDetail{exitCode: $exitCode, failureSourceModulePath: $failureSourceModulePath, frameInfos: $frameInfos, kind: $kind, processDescription: $processDescription, reason: $reason}';
  }
}
