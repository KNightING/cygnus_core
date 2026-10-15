import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:cygnus_core_example/providers/event_log_provider.dart';
import 'package:cygnus_core_example/providers/network_monitor.dart';
import 'package:cygnus_core_example/providers/settings_manager.dart';

import 'mock_cygnus_platform.dart';

/// Creates a mock SettingsManager for testing.
/// This bypasses the SharedPreferences and CygnusWebViewEnvironment dependencies.
class MockSettingsManager extends SettingsManager {
  MockSettingsManager()
    : super(
        environmentFactory: (_) async => null,
        environmentSupportChecker: () => false,
      );

  @override
  CygnusWebViewEnvironmentSettings buildEnvironmentSettings() =>
      CygnusWebViewEnvironmentSettings(
        releaseChannels: CygnusEnvironmentReleaseChannels.STABLE,
      );

  @override
  CygnusWebViewSettings buildSettings() => CygnusWebViewSettings();
}

/// A wrapper widget that provides all common providers needed for testing.
class TestProviderWrapper extends StatelessWidget {
  final Widget child;
  final SettingsManager? settingsManager;
  final EventLogProvider? eventLogProvider;
  final NetworkMonitor? networkMonitor;

  const TestProviderWrapper({
    super.key,
    required this.child,
    this.settingsManager,
    this.eventLogProvider,
    this.networkMonitor,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SettingsManager>.value(
          value: settingsManager ?? MockSettingsManager(),
        ),
        ChangeNotifierProvider<EventLogProvider>.value(
          value: eventLogProvider ?? EventLogProvider(),
        ),
        ChangeNotifierProvider<NetworkMonitor>.value(
          value: networkMonitor ?? NetworkMonitor(),
        ),
      ],
      child: child,
    );
  }
}

/// Helper to set up tests that require the CygnusWebViewPlatform mock.
void setUpMockPlatform() {
  MockCygnusPlatform.initialize();
}
