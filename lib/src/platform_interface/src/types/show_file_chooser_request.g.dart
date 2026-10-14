// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_file_chooser_request.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class used in the [CygnusPlatformWebViewCreationParams.onShowFileChooser] method.
class CygnusShowFileChooserRequest {
  ///An array of acceptable MIME types.
  ///The returned MIME type could be partial such as audio/*.
  ///The array will be empty if no acceptable types are specified.
  final List<String> acceptTypes;

  ///The file name of a default selection if specified, or `null`.
  final String? filenameHint;

  ///Preference for a live media captured value (e. g. Camera, Microphone).
  ///True indicates capture is enabled, false disabled.
  ///Use [acceptTypes] to determine suitable capture devices.
  final bool isCaptureEnabled;

  ///The file chooser mode.
  final CygnusShowFileChooserRequestMode mode;

  ///The title to use for this file selector.
  ///If `null` a default title should be used.
  final String? title;
  CygnusShowFileChooserRequest({
    required this.acceptTypes,
    this.filenameHint,
    required this.isCaptureEnabled,
    required this.mode,
    this.title,
  });

  ///Gets a possible [CygnusShowFileChooserRequest] instance from a [Map] value.
  static CygnusShowFileChooserRequest? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusShowFileChooserRequest(
      acceptTypes: List<String>.from(map['acceptTypes']!.cast<String>()),
      filenameHint: map['filenameHint'],
      isCaptureEnabled: map['isCaptureEnabled'],
      mode: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusShowFileChooserRequestMode.fromNativeValue(map['mode']),
        CygnusEnumMethod.value => CygnusShowFileChooserRequestMode.fromValue(
          map['mode'],
        ),
        CygnusEnumMethod.name => CygnusShowFileChooserRequestMode.byName(
          map['mode'],
        ),
      }!,
      title: map['title'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "acceptTypes": acceptTypes,
      "filenameHint": filenameHint,
      "isCaptureEnabled": isCaptureEnabled,
      "mode": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => mode.toNativeValue(),
        CygnusEnumMethod.value => mode.toValue(),
        CygnusEnumMethod.name => mode.name(),
      },
      "title": title,
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusShowFileChooserRequest{acceptTypes: $acceptTypes, filenameHint: $filenameHint, isCaptureEnabled: $isCaptureEnabled, mode: $mode, title: $title}';
  }
}
