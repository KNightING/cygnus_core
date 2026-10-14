// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_file_chooser_response.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class used in the [CygnusPlatformWebViewCreationParams.onShowFileChooser] method.
class CygnusShowFileChooserResponse {
  ///The file paths of the selected files or `null` to cancel the request.
  ///Each file path must be a valid file URI using the "file:" scheme.
  final List<String>? filePaths;

  ///Whether the file chooser request was handled by the client.
  final bool handledByClient;
  CygnusShowFileChooserResponse({
    this.filePaths,
    required this.handledByClient,
  });

  ///Gets a possible [CygnusShowFileChooserResponse] instance from a [Map] value.
  static CygnusShowFileChooserResponse? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusShowFileChooserResponse(
      filePaths: map['filePaths'] != null
          ? List<String>.from(map['filePaths']!.cast<String>())
          : null,
      handledByClient: map['handledByClient'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"filePaths": filePaths, "handledByClient": handledByClient};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusShowFileChooserResponse{filePaths: $filePaths, handledByClient: $handledByClient}';
  }
}
