// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renderer_priority_policy.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the priority policy will be used to determine whether an out of process renderer should be considered to be a target for OOM killing.
///When a WebView is destroyed it will cease to be considerered when calculating the renderer priority.
///Once no WebViews remain associated with the renderer, the priority of the renderer will be reduced to [CygnusRendererPriority.RENDERER_PRIORITY_WAIVED].
///The default policy is to set the priority to [CygnusRendererPriority.RENDERER_PRIORITY_IMPORTANT] regardless of visibility,
///and this should not be changed unless the caller also handles renderer crashes with [CygnusPlatformWebViewCreationParams.onRenderProcessGone].
///Any other setting will result in WebView renderers being killed by the system more aggressively than the application.
class CygnusRendererPriorityPolicy {
  ///The minimum priority at which this WebView desires the renderer process to be bound.
  CygnusRendererPriority? rendererRequestedPriority;

  ///If `true`, this flag specifies that when this WebView is not visible, it will be treated as if it had requested a priority of [CygnusRendererPriority.RENDERER_PRIORITY_WAIVED].
  bool waivedWhenNotVisible;
  CygnusRendererPriorityPolicy({
    this.rendererRequestedPriority,
    required this.waivedWhenNotVisible,
  });

  ///Gets a possible [CygnusRendererPriorityPolicy] instance from a [Map] value.
  static CygnusRendererPriorityPolicy? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusRendererPriorityPolicy(
      rendererRequestedPriority: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusRendererPriority.fromNativeValue(
          map['rendererRequestedPriority'],
        ),
        CygnusEnumMethod.value => CygnusRendererPriority.fromValue(
          map['rendererRequestedPriority'],
        ),
        CygnusEnumMethod.name => CygnusRendererPriority.byName(
          map['rendererRequestedPriority'],
        ),
      },
      waivedWhenNotVisible: map['waivedWhenNotVisible'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "rendererRequestedPriority": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          rendererRequestedPriority?.toNativeValue(),
        CygnusEnumMethod.value => rendererRequestedPriority?.toValue(),
        CygnusEnumMethod.name => rendererRequestedPriority?.name(),
      },
      "waivedWhenNotVisible": waivedWhenNotVisible,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusRendererPriorityPolicy{rendererRequestedPriority: $rendererRequestedPriority, waivedWhenNotVisible: $waivedWhenNotVisible}';
  }
}
