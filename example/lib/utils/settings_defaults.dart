import 'package:cygnus_core/cygnus_core.dart';

CygnusWebViewSettings defaultInAppWebViewSettings() {
  return CygnusWebViewSettings();
}

CygnusWebViewEnvironmentSettings defaultWebViewEnvironmentSettings() {
  return CygnusWebViewEnvironmentSettings();
}

Map<String, dynamic> defaultInAppWebViewSettingsMap() {
  return defaultInAppWebViewSettings().toMap(
    enumMethod: CygnusEnumMethod.nativeValue,
  );
}

Map<String, dynamic> defaultWebViewEnvironmentSettingsMap() {
  return defaultWebViewEnvironmentSettings().toMap(
    enumMethod: CygnusEnumMethod.nativeValue,
  );
}
