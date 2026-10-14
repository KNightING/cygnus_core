import 'package:flutter_test/flutter_test.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:flutter_inappwebview_example/utils/controller_methods_registry.dart';
import 'package:flutter_inappwebview_example/utils/support_checker.dart';

void main() {
  group('SupportChecker naming', () {
    test('helper class names use Type.toString()', () {
      expect(
        SupportChecker.classNameOf(CygnusWebViewController),
        (CygnusWebViewController).toString(),
      );
      expect(
        SupportChecker.classNameOf(CygnusHeadlessWebView),
        (CygnusHeadlessWebView).toString(),
      );
      expect(
        SupportChecker.classNameOf(CygnusBrowser),
        (CygnusBrowser).toString(),
      );
      expect(
        SupportChecker.eventClassNameOf(CygnusWebView),
        '${(CygnusWebView).toString()} Events',
      );
    });

    test('API definitions use (Type).toString() class names', () {
      final definitions = SupportChecker.getAllApiDefinitions();

      final controllerDefinition = definitions.firstWhere(
        (definition) =>
            definition.className == (CygnusWebViewController).toString(),
      );
      expect(
        controllerDefinition.className,
        (CygnusWebViewController).toString(),
      );
      expect(controllerDefinition.methods, isNotEmpty);
      expect(
        controllerDefinition.methods.every(
          (method) => method.className == controllerDefinition.className,
        ),
        isTrue,
      );

      final eventsDefinition = definitions.firstWhere(
        (definition) =>
            definition.className == '${(CygnusWebView).toString()} Events',
      );
      expect(eventsDefinition.className, '${(CygnusWebView).toString()} Events');
      expect(
        eventsDefinition.events.every(
          (event) => event.className == eventsDefinition.className,
        ),
        isTrue,
      );
    });
  });

  group('ControllerMethodsRegistry naming', () {
    test('method entries use enum .name for id and name', () {
      final registry = ControllerMethodsRegistry.instance;
      final methods = registry.allMethods;

      expect(methods, isNotEmpty);

      for (final entry in methods) {
        expect(entry.id, entry.methodEnum.name);
        expect(entry.name, entry.methodEnum.name);
        expect(entry.id.contains('.'), isFalse);
        expect(entry.name.contains('.'), isFalse);
      }
    });

    test('category ids use enum .name', () {
      final registry = ControllerMethodsRegistry.instance;
      for (final category in registry.categories) {
        expect(category.id, category.categoryType.name);
        expect(category.id.contains('.'), isFalse);
      }
    });
  });
}
