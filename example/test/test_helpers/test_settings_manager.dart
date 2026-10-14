import 'package:cygnus_core/cygnus_core.dart';
import 'package:flutter_inappwebview_example/providers/settings_manager.dart';

/// Lightweight settings manager for widget tests.
class TestSettingsManager extends SettingsManager {
  TestSettingsManager()
    : super(
        environmentFactory: (_) async => null,
        environmentSupportChecker: () => false,
      );

  @override
  Future<void> init() async {}

  @override
  CygnusWebViewSettings buildSettings() => CygnusWebViewSettings();

  @override
  CygnusWebViewEnvironmentSettings buildEnvironmentSettings() =>
      CygnusWebViewEnvironmentSettings(
        releaseChannels: CygnusEnvironmentReleaseChannels.STABLE,
      );

  @override
  CygnusWebViewEnvironment? get webViewEnvironment => null;

  @override
  int get environmentRevision => 0;

  @override
  int get settingsRevision => 0;
}
