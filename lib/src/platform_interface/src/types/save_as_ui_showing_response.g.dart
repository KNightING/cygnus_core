// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_as_ui_showing_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onSaveAsUIShowing] event.
class CygnusSaveAsUIShowingResponse {
  ///Whether the save operation may replace an existing file.
  bool? allowReplace;

  ///Whether to cancel the Save As action.
  bool? cancel;

  ///The save-as kind for the operation.
  CygnusSaveAsKind? kind;

  ///The save file path to use.
  String? saveAsFilePath;

  ///Whether to suppress the default dialog.
  bool? suppressDefaultDialog;
  CygnusSaveAsUIShowingResponse({
    this.allowReplace,
    this.cancel,
    this.kind,
    this.saveAsFilePath,
    this.suppressDefaultDialog,
  });

  ///Gets a possible [CygnusSaveAsUIShowingResponse] instance from a [Map] value.
  static CygnusSaveAsUIShowingResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusSaveAsUIShowingResponse(
      allowReplace: map['allowReplace'],
      cancel: map['cancel'],
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
    return 'CygnusSaveAsUIShowingResponse{allowReplace: $allowReplace, cancel: $cancel, kind: $kind, saveAsFilePath: $saveAsFilePath, suppressDefaultDialog: $suppressDefaultDialog}';
  }
}
