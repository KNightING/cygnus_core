import 'dart:core';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart';

import '../in_app_webview_controller.dart';

///Use [CygnusWebViewController] instead.
@Deprecated("Use CygnusWebViewController instead")
class CygnusIOSWebViewController {
  CygnusPlatformWebViewController? _controller;

  CygnusIOSWebViewController({
    required CygnusPlatformWebViewController controller,
  }) {
    this._controller = controller;
  }

  ///Use [CygnusWebViewController.reloadFromOrigin] instead.
  @Deprecated("Use CygnusWebViewController.reloadFromOrigin instead")
  Future<void> reloadFromOrigin() async {
    await _controller?.reloadFromOrigin();
  }

  ///Use [CygnusWebViewController.createPdf] instead.
  @Deprecated("Use CygnusWebViewController.createPdf instead")
  Future<Uint8List?> createPdf({
    @Deprecated("Use pdfConfiguration instead")
    // ignore: deprecated_member_use_from_same_package
    CygnusIOSWKPDFConfiguration? iosWKPdfConfiguration,
    CygnusPDFConfiguration? pdfConfiguration,
  }) async {
    return await _controller?.createPdf(
      iosWKPdfConfiguration: iosWKPdfConfiguration,
      pdfConfiguration: pdfConfiguration,
    );
  }

  ///Use [CygnusWebViewController.createWebArchiveData] instead.
  @Deprecated("Use CygnusWebViewController.createWebArchiveData instead")
  Future<Uint8List?> createWebArchiveData() async {
    return await _controller?.createWebArchiveData();
  }

  ///Use [CygnusWebViewController.hasOnlySecureContent] instead.
  @Deprecated("Use CygnusWebViewController.hasOnlySecureContent instead")
  Future<bool> hasOnlySecureContent() async {
    return await _controller?.hasOnlySecureContent() ?? false;
  }

  ///Use [CygnusWebViewController.handlesURLScheme] instead.
  @Deprecated("Use CygnusWebViewController.handlesURLScheme instead")
  static Future<bool> handlesURLScheme(String urlScheme) async {
    return await CygnusWebViewController.handlesURLScheme(urlScheme);
  }

  void dispose() {
    _controller = null;
  }
}
