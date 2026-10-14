// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_as_ui_showing_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the request used by the [CygnusPlatformWebViewCreationParams.onSaveAsUIShowing] event.
class CygnusSaveAsUIShowingRequest {
  ///Whether the save operation may replace an existing file.
  bool? allowReplace;

  ///Whether to cancel the Save As action.
  bool? cancel;

  ///The MIME type of content to be saved.
  String? contentMimeType;

  ///The save-as kind for the operation.
  CygnusSaveAsKind? kind;

  ///The suggested save file path.
  String? saveAsFilePath;

  ///Whether to suppress the default dialog.
  bool? suppressDefaultDialog;
  CygnusSaveAsUIShowingRequest({
    this.allowReplace,
    this.cancel,
    this.contentMimeType,
    this.kind,
    this.saveAsFilePath,
    this.suppressDefaultDialog,
  });

  ///Gets a possible [CygnusSaveAsUIShowingRequest] instance from a [Map] value.
  static CygnusSaveAsUIShowingRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusSaveAsUIShowingRequest(
      allowReplace: map['allowReplace'],
      cancel: map['cancel'],
      contentMimeType: map['contentMimeType'],
      kind: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusSaveAsKind.fromNativeValue(
          map['kind'],
        ),
        CygnusEnumMethod.value => CygnusSaveAsKind.fromValue(map['kind']),
        CygnusEnumMethod.name => CygnusSaveAsKind.byName(map['kind']),
      },
      saveAsFilePath: map['saveAsFilePath'],
      suppressDefaultDialog: map['suppressDefaultDialog'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "allowReplace": allowReplace,
      "cancel": cancel,
      "contentMimeType": contentMimeType,
      "kind": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => kind?.toNativeValue(),
        CygnusEnumMethod.value => kind?.toValue(),
        CygnusEnumMethod.name => kind?.name(),
      },
      "saveAsFilePath": saveAsFilePath,
      "suppressDefaultDialog": suppressDefaultDialog,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusSaveAsUIShowingRequest{allowReplace: $allowReplace, cancel: $cancel, contentMimeType: $contentMimeType, kind: $kind, saveAsFilePath: $saveAsFilePath, suppressDefaultDialog: $suppressDefaultDialog}';
  }
}
