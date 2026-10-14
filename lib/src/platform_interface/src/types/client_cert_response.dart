import '../webview/platform_webview.dart';
import 'package:flutter_inappwebview_internal_annotations/flutter_inappwebview_internal_annotations.dart';

import '../util.dart';
import 'client_cert_response_action.dart';
import 'enum_method.dart';

part 'client_cert_response.g.dart';

///Class that represents the response used by the [CygnusPlatformWebViewCreationParams.onReceivedClientCertRequest] event.
@ExchangeableObject()
class CygnusClientCertResponse_ {
  ///The file path of the certificate to use.
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  String certificatePath;

  ///The certificate password.
  @SupportedPlatforms(
    platforms: [AndroidPlatform(), IOSPlatform(), MacOSPlatform()],
  )
  String? certificatePassword;

  ///Use [keyStoreType] instead.
  @Deprecated('Use keyStoreType instead')
  String? androidKeyStoreType;

  ///An Android-specific property used by Java [KeyStore](https://developer.android.com/reference/java/security/KeyStore) class to get the instance.
  @SupportedPlatforms(platforms: [AndroidPlatform()])
  String? keyStoreType;

  ///The index of the selected certificate.
  @SupportedPlatforms(platforms: [WindowsPlatform()])
  int selectedCertificate;

  ///Indicate the [CygnusClientCertResponseAction] to take in response of the client certificate challenge.
  CygnusClientCertResponseAction_? action;

  @ExchangeableObjectConstructor()
  CygnusClientCertResponse_({
    this.certificatePath = "",
    this.certificatePassword = "",
    @Deprecated('Use keyStoreType instead') this.androidKeyStoreType = "PKCS12",
    this.keyStoreType = "PKCS12",
    this.selectedCertificate = -1,
    this.action = CygnusClientCertResponseAction_.CANCEL,
  }) {
    if (this.action == CygnusClientCertResponseAction_.PROCEED && !Util.isWindows)
      assert(certificatePath.isNotEmpty);

    this.keyStoreType = this.keyStoreType ?? this.androidKeyStoreType;

    if (Util.isAndroid) assert(this.keyStoreType != null);
  }
}
