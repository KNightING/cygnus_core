part of 'main.dart';

void onPermissionRequest() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onPermissionRequest,
  );

  skippableTestWidgets('onPermissionRequest', (WidgetTester tester) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();
    final Completer<List<CygnusPermissionResourceType>> onPermissionRequestCompleter =
        Completer<List<CygnusPermissionResourceType>>();
    final expectedValue = [CygnusPermissionResourceType.CAMERA];

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_PERMISSION_SITE),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            if (!pageLoaded.isCompleted) {
              pageLoaded.complete();
            }
          },
          onPermissionRequest: (controller, permissionRequest) async {
            onPermissionRequestCompleter.complete(permissionRequest.resources);
            return CygnusPermissionResponse(
              resources: permissionRequest.resources,
              action: CygnusPermissionResponseAction.GRANT,
            );
          },
        ),
      ),
    );

    final CygnusWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    await tester.pump();

    await controller.evaluateJavascript(
      source: "document.querySelector('#camera').click();",
    );
    final List<CygnusPermissionResourceType> resources =
        await onPermissionRequestCompleter.future;

    expect(listEquals(resources, expectedValue), true);
  }, skip: shouldSkip);

  final shouldSkip2 = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onPermissionRequestCanceled,
  );

  skippableTestWidgets('onPermissionRequestCanceled', (
    WidgetTester tester,
  ) async {
    final Completer<CygnusWebViewController> controllerCompleter =
        Completer<CygnusWebViewController>();
    final Completer<void> pageLoaded = Completer<void>();
    final Completer<List<CygnusPermissionResourceType>> onPermissionRequestCompleter =
        Completer<List<CygnusPermissionResourceType>>();
    final Completer<List<CygnusPermissionResourceType>>
    onPermissionRequestCancelCompleter =
        Completer<List<CygnusPermissionResourceType>>();
    final expectedValue = [CygnusPermissionResourceType.MICROPHONE];

    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_PERMISSION_SITE),
          onWebViewCreated: (controller) {
            controllerCompleter.complete(controller);
          },
          onLoadStop: (controller, url) {
            if (!pageLoaded.isCompleted) {
              pageLoaded.complete();
            }
          },
          onPermissionRequest: (controller, permissionRequest) async {
            onPermissionRequestCompleter.complete(permissionRequest.resources);
            await Future.delayed(Duration(seconds: 5));
            return CygnusPermissionResponse(
              resources: permissionRequest.resources,
              action: CygnusPermissionResponseAction.GRANT,
            );
          },
          onPermissionRequestCanceled: (controller, permissionRequest) {
            onPermissionRequestCancelCompleter.complete(
              permissionRequest.resources,
            );
          },
        ),
      ),
    );

    final CygnusWebViewController controller = await controllerCompleter.future;
    await pageLoaded.future;

    await tester.pump();

    await controller.evaluateJavascript(
      source: "document.querySelector('#microphone').click();",
    );

    final List<CygnusPermissionResourceType> resources =
        await onPermissionRequestCompleter.future;
    expect(listEquals(resources, expectedValue), true);

    // Reload the webview to cancel the permission request
    controller.reload();

    final List<CygnusPermissionResourceType> canceledResources =
        await onPermissionRequestCancelCompleter.future;
    expect(listEquals(canceledResources, expectedValue), true);
  }, skip: shouldSkip2);
}
