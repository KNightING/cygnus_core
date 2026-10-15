import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:cygnus_core_example/utils/settings_defaults.dart';

void main() {
  setUp(() {
    debugDefaultTargetPlatformOverride = null;
  });

  tearDown(() {
    debugDefaultTargetPlatformOverride = null;
  });

  test('default settings map matches constructor defaults', () {
    final defaults = defaultWebViewSettings().toMap(
      enumMethod: CygnusEnumMethod.nativeValue,
    );
    final expected = CygnusWebViewSettings().toMap(
      enumMethod: CygnusEnumMethod.nativeValue,
    );

    expect(defaults, expected);
  });

  test('default environment settings map matches constructor defaults', () {
    final defaults = defaultWebViewEnvironmentSettings().toMap(
      enumMethod: CygnusEnumMethod.nativeValue,
    );
    final expected = CygnusWebViewEnvironmentSettings().toMap(
      enumMethod: CygnusEnumMethod.nativeValue,
    );

    expect(defaults, expected);
  });
}
