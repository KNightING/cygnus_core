// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_package_info.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents a `WebView` package info.
class CygnusWebViewPackageInfo {
  ///The name of this WebView package.
  String? packageName;

  ///The version name of this WebView package.
  String? versionName;
  CygnusWebViewPackageInfo({this.packageName, this.versionName});

  ///Gets a possible [CygnusWebViewPackageInfo] instance from a [Map] value.
  static CygnusWebViewPackageInfo? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusWebViewPackageInfo(
      packageName: map['packageName'],
      versionName: map['versionName'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"packageName": packageName, "versionName": versionName};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusWebViewPackageInfo{packageName: $packageName, versionName: $versionName}';
  }
}

///Class that represents an Android `WebView` package info.
///Use [CygnusWebViewPackageInfo] instead.
@Deprecated('Use CygnusWebViewPackageInfo instead')
class CygnusAndroidWebViewPackageInfo {
  ///The name of this WebView package.
  String? packageName;

  ///The version name of this WebView package.
  String? versionName;
  CygnusAndroidWebViewPackageInfo({this.packageName, this.versionName});

  ///Gets a possible [CygnusAndroidWebViewPackageInfo] instance from a [Map] value.
  static CygnusAndroidWebViewPackageInfo? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusAndroidWebViewPackageInfo(
      packageName: map['packageName'],
      versionName: map['versionName'],
    );
    return instance;
  }

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {"packageName": packageName, "versionName": versionName};
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  @override
  String toString() {
    return 'CygnusAndroidWebViewPackageInfo{packageName: $packageName, versionName: $versionName}';
  }
}
