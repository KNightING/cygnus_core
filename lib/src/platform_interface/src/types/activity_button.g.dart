// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_button.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a custom button to show in `SFSafariViewController`'s toolbar.
///When tapped, it will invoke a Share or Action Extension bundled with your app.
///The default VoiceOver description of this button is the `CFBundleDisplayName` set in the extension's `Info.plist`.
///
///Check [Official Apple App Extensions](https://developer.apple.com/app-extensions/) for more details.
///
///**Officially Supported Platforms/Implementations**:
///- iOS
class CygnusActivityButton {
  ///The name of the App or Share Extension to be called.
  String extensionIdentifier;

  ///The name of the image asset or file.
  CygnusUIImage templateImage;
  CygnusActivityButton({
    required this.templateImage,
    required this.extensionIdentifier,
  });

  ///Gets a possible [CygnusActivityButton] instance from a [Map] value.
  static CygnusActivityButton? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusActivityButton(
      extensionIdentifier: map['extensionIdentifier'],
      templateImage: CygnusUIImage.fromMap(
        map['templateImage']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      )!,
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "extensionIdentifier": extensionIdentifier,
      "templateImage": templateImage.toMap(enumMethod: enumMethod),
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusActivityButton{extensionIdentifier: $extensionIdentifier, templateImage: $templateImage}';
  }
}
