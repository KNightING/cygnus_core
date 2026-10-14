import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import 'enum_method.dart';

part 'webview_package_info.g.dart';

///Class that represents a `WebView` package info.
@ExchangeableObject()
class CygnusWebViewPackageInfo_ {
  ///The version name of this WebView package.
  String? versionName;

  ///The name of this WebView package.
  String? packageName;

  CygnusWebViewPackageInfo_({this.versionName, this.packageName});
}

///Class that represents an Android `WebView` package info.
///Use [CygnusWebViewPackageInfo] instead.
@Deprecated("Use CygnusWebViewPackageInfo instead")
@ExchangeableObject()
class CygnusAndroidWebViewPackageInfo_ {
  ///The version name of this WebView package.
  String? versionName;

  ///The name of this WebView package.
  String? packageName;

  CygnusAndroidWebViewPackageInfo_({this.versionName, this.packageName});
}
