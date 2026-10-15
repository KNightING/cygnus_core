import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cygnus_core_example/providers/event_log_provider.dart';
import 'package:cygnus_core_example/screens/advanced/service_controllers_screen.dart';

import '../test_helpers/mock_cygnus_platform.dart';
import '../test_helpers/test_provider_wrapper.dart';

void main() {
  setUpAll(() {
    MockCygnusPlatform.initialize();
  });

  group('ServiceControllersScreen', () {
    Widget createWidget() {
      return MaterialApp(
        home: TestProviderWrapper(
          eventLogProvider: EventLogProvider(),
          child: const ServiceControllersScreen(),
        ),
      );
    }

    testWidgets('does not overflow on small height', (tester) async {
      await tester.pumpWidget(createWidget());
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });
}
