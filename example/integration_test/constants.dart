import 'package:cygnus_core/cygnus_core.dart';

final TEST_URL_ABOUT_BLANK = CygnusWebUri('about:blank');
final TEST_CROSS_PLATFORM_URL_1 = CygnusWebUri('https://flutter.dev/');
final TEST_CROSS_PLATFORM_URL_2 = CygnusWebUri('https://www.bing.com/');
final TEST_URL_1 = CygnusWebUri('https://github.com/flutter');
final TEST_URL_2 = CygnusWebUri('https://www.google.com/');
final TEST_URL_3 = CygnusWebUri(
  'https://github.com/pichillilorenzo/flutter_inappwebview',
);
final TEST_URL_4 = CygnusWebUri('https://www.youtube.com/');
final TEST_URL_EXAMPLE = CygnusWebUri('https://www.example.com/');
final TEST_URL_HTTP_EXAMPLE = CygnusWebUri('http://www.example.com/');
final TEST_URL_404 = CygnusWebUri('https://google.com/404');
final TEST_WEB_PLATFORM_BASE_URL = CygnusWebUri(
  Uri.base.toString().replaceFirst("/#/", "/"),
);
final TEST_WEB_PLATFORM_URL_1 = CygnusWebUri(
  TEST_WEB_PLATFORM_BASE_URL.toString() + 'page.html',
);
final TEST_WEB_PLATFORM_URL_2 = CygnusWebUri(
  TEST_WEB_PLATFORM_BASE_URL.toString() + 'page-2.html',
);
final TEST_WEB_PLATFORM_URL_3 = CygnusWebUri(
  TEST_WEB_PLATFORM_BASE_URL.toString() + 'heavy-page.html',
);
final TEST_NOT_A_WEBSITE_URL = CygnusWebUri('https://www.notawebsite..com/');
final TEST_CHROME_SAFE_BROWSING_MALWARE = CygnusWebUri(
  'chrome://safe-browsing/match?type=malware',
);
final TEST_PERMISSION_SITE = CygnusWebUri('https://permission.site/');
final TEST_SERVICE_WORKER_URL = CygnusWebUri(
  'https://mdn.github.io/dom-examples/service-worker/simple-service-worker/',
);
final TEST_WEBVIEW_ASSET_LOADER_DOMAIN = 'my.custom.domain.com';
final TEST_WEBVIEW_ASSET_LOADER_URL = CygnusWebUri(
  'https://$TEST_WEBVIEW_ASSET_LOADER_DOMAIN/assets/flutter_assets/test_assets/website/index.html',
);
final TEST_TWA_URL = CygnusWebUri(
  'https://inappwebview.dev/test-twa-postmessage.html',
);
final TEST_CUSTOM_TABS_POST_MESSAGE_URL = CygnusWebUri(
  'https://inappwebview.dev/test-twa-postmessage.html',
);
