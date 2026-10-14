import 'package:cygnus_core/cygnus_core.dart';

CygnusWebViewSettings defaultWebViewSettings() {
  return CygnusWebViewSettings();
}

CygnusWebViewEnvironmentSettings defaultWebViewEnvironmentSettings() {
  return CygnusWebViewEnvironmentSettings();
}

Map<String, dynamic> defaultWebViewSettingsMap() {
  return defaultWebViewSettings().toMap(
    enumMethod: CygnusEnumMethod.nativeValue,
  );
}

Map<String, dynamic> defaultWebViewEnvironmentSettingsMap() {
  return defaultWebViewEnvironmentSettings().toMap(
    enumMethod: CygnusEnumMethod.nativeValue,
  );
}
