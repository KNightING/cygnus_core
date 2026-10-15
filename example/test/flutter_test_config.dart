import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

import 'test_helpers/mock_cygnus_platform.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  MockCygnusPlatform.initialize();
  await testMain();
}
