// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trusted_web_activity_immersive_display_mode.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the default display mode of a Trusted Web Activity.
///The system UI (status bar, navigation bar) is shown, and the browser toolbar is hidden while the user is on a verified origin.
class CygnusTrustedWebActivityImmersiveDisplayMode
    implements CygnusTrustedWebActivityDisplayMode {
  static final String _type = "IMMERSIVE_MODE";

  ///The constant defining how to deal with display cutouts.
  CygnusLayoutInDisplayCutoutMode displayCutoutMode;

  ///Whether the Trusted Web Activity should be in sticky immersive mode.
  bool isSticky;

  ///Use [displayCutoutMode] instead.
  @Deprecated('Use displayCutoutMode instead')
  CygnusAndroidLayoutInDisplayCutoutMode? layoutInDisplayCutoutMode;
  CygnusTrustedWebActivityImmersiveDisplayMode({
    required this.isSticky,
    this.displayCutoutMode = CygnusLayoutInDisplayCutoutMode.DEFAULT,
    this.layoutInDisplayCutoutMode,
  }) {
    this.displayCutoutMode = this.layoutInDisplayCutoutMode != null
        ? CygnusLayoutInDisplayCutoutMode.fromNativeValue(
            layoutInDisplayCutoutMode?.toNativeValue(),
          )!
        : this.displayCutoutMode;
  }

  ///Gets a possible [CygnusTrustedWebActivityImmersiveDisplayMode] instance from a [Map] value.
  static CygnusTrustedWebActivityImmersiveDisplayMode? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusTrustedWebActivityImmersiveDisplayMode(
      isSticky: map['isSticky'],
      layoutInDisplayCutoutMode: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusAndroidLayoutInDisplayCutoutMode.fromNativeValue(
            map['displayCutoutMode'],
          ),
        CygnusEnumMethod.value =>
          CygnusAndroidLayoutInDisplayCutoutMode.fromValue(
            map['displayCutoutMode'],
          ),
        CygnusEnumMethod.name => CygnusAndroidLayoutInDisplayCutoutMode.byName(
          map['displayCutoutMode'],
        ),
      },
    );
    if (map['displayCutoutMode'] != null) {
      instance.displayCutoutMode = switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusLayoutInDisplayCutoutMode.fromNativeValue(
            map['displayCutoutMode'],
          ),
        CygnusEnumMethod.value => CygnusLayoutInDisplayCutoutMode.fromValue(
          map['displayCutoutMode'],
        ),
        CygnusEnumMethod.name => CygnusLayoutInDisplayCutoutMode.byName(
          map['displayCutoutMode'],
        ),
      }!;
    }
    return instance;
  }

  @ExchangeableObjectMethod(toMapMergeWith: true)
  Map<String, dynamic> _toMapMergeWith({CygnusEnumMethod? enumMethod}) {
    return {"type": _type};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "displayCutoutMode": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => displayCutoutMode.toNativeValue(),
        CygnusEnumMethod.value => displayCutoutMode.toValue(),
        CygnusEnumMethod.name => displayCutoutMode.name(),
      },
      "isSticky": isSticky,
      ..._toMapMergeWith(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusTrustedWebActivityImmersiveDisplayMode{displayCutoutMode: $displayCutoutMode, isSticky: $isSticky}';
  }
}
