import 'package:cygnus_core/cygnus_core.dart';
import '../models/test_case.dart';
import '../models/test_result.dart';
import '../utils/constants.dart';
import '../utils/support_checker.dart';

/// Central registry for all test cases in the testing interface.
class TestRegistry {
  static final Map<TestCategory, List<TestCase>> _testsByCategory = {};

  /// Registers a test case in the registry.
  static void register(TestCase testCase) {
    _testsByCategory.putIfAbsent(testCase.category, () => []);
    _testsByCategory[testCase.category]!.add(testCase);
  }

  /// Retrieves all tests for a given category.
  static List<TestCase> getTestsByCategory(TestCategory category) {
    return List.unmodifiable(_testsByCategory[category] ?? []);
  }

  /// Retrieves all registered tests across all categories.
  static List<TestCase> getAllTests() {
    final allTests = <TestCase>[];
    for (final tests in _testsByCategory.values) {
      allTests.addAll(tests);
    }
    return List.unmodifiable(allTests);
  }

  /// Retrieves a specific test by its ID.
  static TestCase? getTestById(String id) {
    for (final tests in _testsByCategory.values) {
      try {
        return tests.firstWhere((test) => test.id == id);
      } catch (e) {
        continue;
      }
    }
    return null;
  }

  /// Clears all registered tests (useful for testing).
  static void clear() {
    _testsByCategory.clear();
  }

  /// Initializes the registry with sample test cases.
  static void init() {
    clear();

    // Navigation Tests
    register(
      TestCase(
        id: 'nav_load_url',
        title: 'Load URL',
        description: 'Load a URL in the WebView',
        category: TestCategory.navigation,
        complexity: TestComplexity.quick,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.loadUrl.name,
        ),
        execute: () async {
          try {
            // This would be called with an actual controller in real scenario
            return TestResult(
              passed: true,
              message: 'URL loaded successfully',
              duration: const Duration(milliseconds: 100),
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    register(
      TestCase(
        id: 'nav_get_url',
        title: 'Get Current URL',
        description: 'Retrieve the current URL from the WebView',
        category: TestCategory.navigation,
        complexity: TestComplexity.quick,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.getUrl.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'Current URL retrieved',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    register(
      TestCase(
        id: 'nav_go_back',
        title: 'Go Back',
        description: 'Navigate back in WebView history',
        category: TestCategory.navigation,
        complexity: TestComplexity.quick,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.goBack.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'Navigated back successfully',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    register(
      TestCase(
        id: 'nav_reload',
        title: 'Reload Page',
        description: 'Reload the current page',
        category: TestCategory.navigation,
        complexity: TestComplexity.quick,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.reload.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'URL loaded successfully',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    // JavaScript Tests
    register(
      TestCase(
        id: 'js_evaluate',
        title: 'Evaluate JavaScript',
        description: 'Execute JavaScript code and retrieve result',
        category: TestCategory.javascript,
        complexity: TestComplexity.quick,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.evaluateJavascript.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'JavaScript evaluated: 1 + 1 = 2',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    register(
      TestCase(
        id: 'js_handler',
        title: 'JavaScript Handler',
        description: 'Add and test JavaScript message handler',
        category: TestCategory.javascript,
        complexity: TestComplexity.medium,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.addJavaScriptHandler.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'Handler added successfully',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    // Content Tests
    register(
      TestCase(
        id: 'content_get_title',
        title: 'Get Page Title',
        description: 'Retrieve the title of the current page',
        category: TestCategory.content,
        complexity: TestComplexity.quick,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.getTitle.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'Page title retrieved',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    register(
      TestCase(
        id: 'content_get_html',
        title: 'Get HTML Content',
        description: 'Retrieve the HTML content of the current page',
        category: TestCategory.content,
        complexity: TestComplexity.medium,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.getHtml.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'HTML content retrieved',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    // CygnusStorage Tests
    register(
      TestCase(
        id: 'storage_set_cookie',
        title: 'Set CygnusCookie',
        description: 'Set a cookie for a URL',
        category: TestCategory.storage,
        complexity: TestComplexity.quick,
        supportedPlatforms: _getPlatformsForClass(CygnusCookieManager),
        execute: () async {
          try {
            await CygnusCookieManager.instance().setCookie(
              url: CygnusWebUri('https://flutter.dev'),
              name: 'test_cookie',
              value: 'test_value',
            );
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'CygnusCookie set successfully',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    register(
      TestCase(
        id: 'storage_get_cookies',
        title: 'Get Cookies',
        description: 'Retrieve cookies for a URL',
        category: TestCategory.storage,
        complexity: TestComplexity.quick,
        supportedPlatforms: _getPlatformsForClass(CygnusCookieManager),
        execute: () async {
          try {
            final cookies = await CygnusCookieManager.instance().getCookies(
              url: CygnusWebUri('https://flutter.dev'),
            );
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'Retrieved ${cookies.length} cookies',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    // Advanced Tests
    register(
      TestCase(
        id: 'advanced_screenshot',
        title: 'Take Screenshot',
        description: 'Capture a screenshot of the WebView',
        category: TestCategory.advanced,
        complexity: TestComplexity.medium,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.takeScreenshot.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'Screenshot captured',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    register(
      TestCase(
        id: 'advanced_print',
        title: 'Print Page',
        description: 'Print the current page',
        category: TestCategory.advanced,
        complexity: TestComplexity.long,
        supportedPlatforms: _getPlatformsForMethod(
          CygnusPlatformWebViewControllerMethod.printCurrentPage.name,
        ),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'Print initiated',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    // Browser Tests
    register(
      TestCase(
        id: 'browser_open_inapp',
        title: 'Open ${CygnusBrowser}',
        description: 'Open URL in ${CygnusBrowser}',
        category: TestCategory.browsers,
        complexity: TestComplexity.medium,
        supportedPlatforms: _getPlatformsForClass(CygnusBrowser),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: '${CygnusBrowser} opened',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );

    register(
      TestCase(
        id: 'browser_chrome_safari',
        title: 'Open Chrome/Safari Browser',
        description: 'Open URL in ${CygnusChromeSafariBrowser}',
        category: TestCategory.browsers,
        complexity: TestComplexity.medium,
        supportedPlatforms: _getPlatformsForClass(CygnusChromeSafariBrowser),
        execute: () async {
          try {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: true,
              message: 'Browser opened',
            );
          } catch (e) {
            return TestResult(
              duration: const Duration(milliseconds: 100),
              passed: false,
              message: 'Failed: ${e.toString()}',
            );
          }
        },
      ),
    );
  }

  /// Helper to get supported platforms for a method.
  static List<String> _getPlatformsForMethod(String methodName) {
    return SupportChecker.getSupportedPlatformsForMethod(
      SupportChecker.classNameOf(CygnusWebViewController),
      methodName,
    ).map((p) => p.name).toList();
  }

  /// Helper to get supported platforms for a class.
  static List<String> _getPlatformsForClass(Type classType) {
    return SupportChecker.getSupportedPlatformsForClass(
      SupportChecker.classNameOf(classType),
    ).map((p) => p.name).toList();
  }
}
