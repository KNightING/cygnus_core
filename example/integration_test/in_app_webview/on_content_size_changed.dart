part of 'main.dart';

void onContentSizeChanged() {
  final shouldSkip = !CygnusWebView.isPropertySupported(
    CygnusPlatformWebViewCreationParamsProperty.onContentSizeChanged,
  );

  skippableTestWidgets('onContentSizeChanged', (WidgetTester tester) async {
    final Completer<void> onContentSizeChangedCompleter = Completer<void>();
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: CygnusWebView(
          key: GlobalKey(),
          initialUrlRequest: CygnusURLRequest(url: TEST_CROSS_PLATFORM_URL_1),
          onContentSizeChanged: (controller, oldContentSize, newContentSize) {
            if (!onContentSizeChangedCompleter.isCompleted) {
              onContentSizeChangedCompleter.complete();
            }
          },
        ),
      ),
    );

    await expectLater(onContentSizeChangedCompleter.future, completes);
  }, skip: shouldSkip);
}
