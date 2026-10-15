import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:cygnus_core_example/providers/event_log_provider.dart';
import 'package:cygnus_core_example/screens/advanced/controllers_screen.dart';
import '../test_helpers/mock_cygnus_platform.dart';

void main() {
  group('ControllersScreen', () {
    setUp(() {
      MockCygnusPlatform.initialize();
    });

    Widget createWidget() {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<EventLogProvider>(
            create: (_) => EventLogProvider(),
          ),
        ],
        child: const MaterialApp(home: ControllersScreen()),
      );
    }

    testWidgets('does not overflow on small height', (tester) async {
      await tester.pumpWidget(createWidget());
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });
}
