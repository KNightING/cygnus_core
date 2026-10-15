import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:cygnus_core_example/widgets/common/app_drawer.dart';
import 'package:cygnus_core_example/utils/support_checker.dart';
import 'package:cygnus_core_example/widgets/common/support_badge.dart';
import 'package:cygnus_core_example/widgets/common/method_result_history.dart';
import 'package:provider/provider.dart';
import 'package:cygnus_core_example/providers/event_log_provider.dart';
import 'package:cygnus_core_example/models/event_log_entry.dart';

/// Custom CygnusChromeSafariBrowser implementation for testing
class TestChromeSafariBrowser extends CygnusChromeSafariBrowser {
  final void Function(String event, Map<String, dynamic>? data)? onEvent;

  TestChromeSafariBrowser({this.onEvent});

  @override
  void onOpened() {
    onEvent?.call(CygnusPlatformChromeSafariBrowserEventsMethod.onOpened.name, {
      'id': id,
    });
  }

  @override
  void onCompletedInitialLoad(bool? didLoadSuccessfully) {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod.onCompletedInitialLoad.name,
      {'didLoadSuccessfully': didLoadSuccessfully},
    );
  }

  @override
  void onInitialLoadDidRedirect(CygnusWebUri? url) {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod.onInitialLoadDidRedirect.name,
      {'url': url?.toString()},
    );
  }

  @override
  void onNavigationEvent(CygnusCustomTabsNavigationEventType? navigationEvent) {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod.onNavigationEvent.name,
      {'navigationEvent': navigationEvent?.name()},
    );
  }

  @override
  void onServiceConnected() {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod.onServiceConnected.name,
      null,
    );
  }

  @override
  void onClosed() {
    onEvent?.call(CygnusPlatformChromeSafariBrowserEventsMethod.onClosed.name, null);
  }

  @override
  void onWillOpenInBrowser() {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod.onWillOpenInBrowser.name,
      null,
    );
  }

  @override
  void onRelationshipValidationResult(
    CygnusCustomTabsRelationType? relation,
    CygnusWebUri? requestedOrigin,
    bool result,
  ) {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod
          .onRelationshipValidationResult
          .name,
      {
        'relation': relation?.name(),
        'requestedOrigin': requestedOrigin?.toString(),
        'result': result,
      },
    );
  }

  @override
  void onMessageChannelReady() {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod.onMessageChannelReady.name,
      null,
    );
  }

  @override
  void onPostMessage(String message) {
    onEvent?.call(CygnusPlatformChromeSafariBrowserEventsMethod.onPostMessage.name, {
      'message': message,
    });
  }

  @override
  void onVerticalScrollEvent(bool isDirectionUp) {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod.onVerticalScrollEvent.name,
      {'isDirectionUp': isDirectionUp},
    );
  }

  @override
  void onGreatestScrollPercentageIncreased(int scrollPercentage) {
    onEvent?.call(
      CygnusPlatformChromeSafariBrowserEventsMethod
          .onGreatestScrollPercentageIncreased
          .name,
      {'scrollPercentage': scrollPercentage},
    );
  }

  @override
  void onSessionEnded(bool didUserInteract) {
    onEvent?.call(CygnusPlatformChromeSafariBrowserEventsMethod.onSessionEnded.name, {
      'didUserInteract': didUserInteract,
    });
  }
}

/// Screen for testing CygnusChromeSafariBrowser functionality
class ChromeSafariBrowserScreen extends StatefulWidget {
  const ChromeSafariBrowserScreen({super.key});

  @override
  State<ChromeSafariBrowserScreen> createState() =>
      _ChromeSafariBrowserScreenState();
}

class _ChromeSafariBrowserScreenState extends State<ChromeSafariBrowserScreen> {
  final TextEditingController _urlController = TextEditingController(
    text: 'https://flutter.dev',
  );
  final TextEditingController _messageController = TextEditingController();

  TestChromeSafariBrowser? _browser;
  bool _isLoading = false;
  bool _browserOpened = false;
  Color _toolbarColor = Colors.blue;
  final List<CygnusChromeSafariBrowserMenuItem> _menuItems = [];

  final Map<String, List<MethodResultEntry>> _methodHistory = {};
  final Map<String, int> _selectedHistoryIndex = {};
  static const int _maxHistoryEntries = 3;

  void _initBrowser() {
    try {
      _browser = TestChromeSafariBrowser(
        onEvent: (event, data) {
          _logEvent(EventType.ui, event, data: data);
          if (event == CygnusPlatformChromeSafariBrowserEventsMethod.onClosed.name) {
            setState(() => _browserOpened = false);
          } else if (event ==
              CygnusPlatformChromeSafariBrowserEventsMethod.onOpened.name) {
            setState(() => _browserOpened = true);
          }
        },
      );
    } catch (e) {
      _showInitError('Unable to create browser: $e');
    }
  }

  String _staticMethodName(CygnusPlatformChromeSafariBrowserMethod method) {
    return '${method.name} (static)';
  }

  @override
  void initState() {
    super.initState();
    _initBrowser();
  }

  @override
  void dispose() {
    _urlController.dispose();
    _messageController.dispose();
    _browser?.dispose();
    super.dispose();
  }

  void _logEvent(EventType type, String message, {Map<String, dynamic>? data}) {
    context.read<EventLogProvider>().addEvent(
      EventLogEntry(
        timestamp: DateTime.now(),
        eventType: type,
        message: message,
        data: data,
      ),
    );
  }

  Future<void> _open() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.open.name,
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await _browser?.open(
        url: CygnusWebUri(url),
        settings: CygnusChromeSafariBrowserSettings(
          shareState: CygnusCustomTabsShareState.SHARE_STATE_ON,
          toolbarBackgroundColor: _toolbarColor,
          isSingleInstance: false,
          isTrustedWebActivity: false,
          keepAliveEnabled: true,
          barCollapsingEnabled: true,
          presentationStyle: CygnusModalPresentationStyle.FULL_SCREEN,
          dismissButtonStyle: CygnusDismissButtonStyle.CLOSE,
        ),
      );
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.open.name,
        'Browser opened',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.open.name,
        'Error opening browser: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _launchUrl() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.launchUrl.name,
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await _browser?.launchUrl(url: CygnusWebUri(url));
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.launchUrl.name,
        'URL launched',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.launchUrl.name,
        'Error launching URL: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _mayLaunchUrl() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.mayLaunchUrl.name,
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final result = await _browser?.mayLaunchUrl(url: CygnusWebUri(url));
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.mayLaunchUrl.name,
        'mayLaunchUrl result: $result',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.mayLaunchUrl.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _validateRelationship() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.validateRelationship.name,
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final result = await _browser?.validateRelationship(
        relation: CygnusCustomTabsRelationType.USE_AS_ORIGIN,
        origin: CygnusWebUri(url),
      );
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.validateRelationship.name,
        'validateRelationship result: $result',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.validateRelationship.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _close() async {
    setState(() => _isLoading = true);
    try {
      await _browser?.close();
      setState(() => _browserOpened = false);
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.close.name,
        'Browser closed',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.close.name,
        'Error closing browser: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _setActionButton() async {
    setState(() => _isLoading = true);
    try {
      // Create a simple colored icon
      final iconData = await _createActionButtonIcon();
      _browser?.setActionButton(
        CygnusChromeSafariBrowserActionButton(
          id: 1,
          description: 'Test Action',
          icon: iconData,
          onClick: (url, title) {
            _logEvent(
              EventType.ui,
              'Action button clicked',
              data: {'url': url?.toString(), 'title': title},
            );
            _recordMethodResult(
              CygnusPlatformChromeSafariBrowserMethod.setActionButton.name,
              'Action button clicked',
              isError: false,
            );
          },
        ),
      );
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.setActionButton.name,
        'Action button set',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.setActionButton.name,
        'Error setting action button: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<Uint8List> _createActionButtonIcon() async {
    // Return a simple icon bytes - in real app you'd load from assets
    try {
      final byteData = await rootBundle.load('assets/images/flutter-logo.png');
      return byteData.buffer.asUint8List();
    } catch (e) {
      // Return empty bytes if asset not found
      return Uint8List(0);
    }
  }

  Future<void> _updateActionButton() async {
    setState(() => _isLoading = true);
    try {
      final iconData = await _createActionButtonIcon();
      await _browser?.updateActionButton(
        icon: iconData,
        description: 'Updated Action',
      );
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.updateActionButton.name,
        'Action button updated',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.updateActionButton.name,
        'Error updating action button: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _addMenuItem() {
    final menuItem = CygnusChromeSafariBrowserMenuItem(
      id: _menuItems.length + 1,
      label: 'Menu Item ${_menuItems.length + 1}',
      onClick: (url, title) {
        _logEvent(
          EventType.ui,
          'Menu item clicked',
          data: {'url': url, 'title': title},
        );
        _recordMethodResult(
          CygnusPlatformChromeSafariBrowserMethod.addMenuItem.name,
          'Menu item clicked',
          isError: false,
        );
      },
    );

    _browser?.addMenuItem(menuItem);
    setState(() {
      _menuItems.add(menuItem);
    });
    _recordMethodResult(
      CygnusPlatformChromeSafariBrowserMethod.addMenuItem.name,
      'Menu item added',
      isError: false,
    );
  }

  Future<void> _requestPostMessageChannel() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.requestPostMessageChannel.name,
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final result = await _browser?.requestPostMessageChannel(
        sourceOrigin: CygnusWebUri(url),
      );
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.requestPostMessageChannel.name,
        'requestPostMessageChannel result: $result',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.requestPostMessageChannel.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _postMessage() async {
    final message = _messageController.text.trim();
    if (message.isEmpty) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.postMessage.name,
        'Please enter a message',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final result = await _browser?.postMessage(message);
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.postMessage.name,
        'postMessage result: ${result?.name}',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.postMessage.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _isEngagementSignalsApiAvailable() async {
    setState(() => _isLoading = true);
    try {
      final result = await _browser?.isEngagementSignalsApiAvailable();
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.isEngagementSignalsApiAvailable.name,
        'isEngagementSignalsApiAvailable: $result',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformChromeSafariBrowserMethod.isEngagementSignalsApiAvailable.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _checkIsOpened() {
    final opened = _browser?.isOpened() ?? false;
    _recordMethodResult(
      CygnusPlatformChromeSafariBrowserMethod.isOpened.name,
      'Browser is opened: $opened',
      isError: false,
    );
  }

  Future<void> _isAvailable() async {
    setState(() => _isLoading = true);
    try {
      final available = await CygnusChromeSafariBrowser.isAvailable();
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.isAvailable),
        '$CygnusChromeSafariBrowser is available: $available',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.isAvailable),
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getMaxToolbarItems() async {
    setState(() => _isLoading = true);
    try {
      final maxItems = await CygnusChromeSafariBrowser.getMaxToolbarItems();
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.getMaxToolbarItems),
        'Max toolbar items: $maxItems',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.getMaxToolbarItems),
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getPackageName() async {
    setState(() => _isLoading = true);
    try {
      final packageName = await CygnusChromeSafariBrowser.getPackageName();
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.getPackageName),
        'Package name: $packageName',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.getPackageName),
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _clearWebsiteData() async {
    setState(() => _isLoading = true);
    try {
      await CygnusChromeSafariBrowser.clearWebsiteData();
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.clearWebsiteData),
        'Website data cleared',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.clearWebsiteData),
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _prewarmConnections() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.prewarmConnections),
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final token = await CygnusChromeSafariBrowser.prewarmConnections([CygnusWebUri(url)]);
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.prewarmConnections),
        'Prewarm token: ${token?.id}',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.prewarmConnections),
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _recordMethodResult(
    String methodName,
    String message, {
    required bool isError,
    dynamic value,
  }) {
    setState(() {
      final entries = List<MethodResultEntry>.from(
        _methodHistory[methodName] ?? const [],
      );
      entries.insert(
        0,
        MethodResultEntry(
          message: message,
          isError: isError,
          timestamp: DateTime.now(),
          value: value,
        ),
      );
      if (entries.length > _maxHistoryEntries) {
        entries.removeRange(_maxHistoryEntries, entries.length);
      }
      _methodHistory[methodName] = entries;
      _selectedHistoryIndex[methodName] = 0;
    });
  }

  Widget _buildMethodHistory(String methodName, {String? title}) {
    final entries = _methodHistory[methodName] ?? const [];
    if (entries.isEmpty) {
      return const SizedBox.shrink();
    }
    return MethodResultHistory(
      entries: entries,
      selectedIndex: _selectedHistoryIndex[methodName],
      title: title ?? methodName,
      onSelected: (index) {
        setState(() => _selectedHistoryIndex[methodName] = index);
      },
    );
  }

  void _showInitError(String message) {
    _recordMethodResult('initBrowser', message, isError: true);
  }

  Widget _buildInitStatusSection() {
    final entries = _methodHistory['initBrowser'] ?? const [];
    if (entries.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        _buildMethodHistory('initBrowser', title: 'Initialization'),
        const SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chrome/Safari Browser'),
        actions: [
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              ),
            ),
          IconButton(
            icon: const Icon(Icons.clear_all),
            tooltip: 'Clear Events',
            onPressed: () {
              context.read<EventLogProvider>().clear();
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildStatusCard(),
          const SizedBox(height: 16),
          _buildInitStatusSection(),
          _buildInputSection(),
          const SizedBox(height: 16),
          _buildOpenMethods(),
          const SizedBox(height: 16),
          _buildToolbarMethods(),
          const SizedBox(height: 16),
          _buildMessagingMethods(),
          const SizedBox(height: 16),
          _buildStaticMethods(),
          const SizedBox(height: 16),
          _buildEventLog(),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    return Card(
      color: _browserOpened ? Colors.green.shade50 : Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              _browserOpened ? Icons.web : Icons.web_asset_off,
              color: _browserOpened ? Colors.green : Colors.grey,
              size: 32,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _browserOpened ? 'Browser Open' : 'Browser Closed',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: _browserOpened ? Colors.green : Colors.grey,
                    ),
                  ),
                  Text(
                    'ID: ${_browser?.id ?? "N/A"}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Input',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'URL',
                hintText: 'https://flutter.dev',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: 'Message (for postMessage)',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Text('Toolbar Color:'),
                const SizedBox(width: 16),
                ...[
                  Colors.blue,
                  Colors.green,
                  Colors.red,
                  Colors.purple,
                  Colors.orange,
                ].map(
                  (color) => GestureDetector(
                    onTap: () => setState(() => _toolbarColor = color),
                    child: Container(
                      width: 32,
                      height: 32,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: _toolbarColor == color
                              ? Colors.black
                              : Colors.transparent,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpenMethods() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Open Methods',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.open.name,
              'Open Chrome Custom Tab / Safari View Controller',
              CygnusPlatformChromeSafariBrowserMethod.open,
              _open,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.launchUrl.name,
              'Launch URL in already opened browser',
              CygnusPlatformChromeSafariBrowserMethod.launchUrl,
              _browserOpened ? _launchUrl : null,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.mayLaunchUrl.name,
              'Hint browser to preload URL',
              CygnusPlatformChromeSafariBrowserMethod.mayLaunchUrl,
              _mayLaunchUrl,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.validateRelationship.name,
              'Validate Digital Asset Links',
              CygnusPlatformChromeSafariBrowserMethod.validateRelationship,
              _validateRelationship,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.close.name,
              'Close the browser',
              CygnusPlatformChromeSafariBrowserMethod.close,
              _browserOpened ? _close : null,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.isOpened.name,
              'Check if browser is opened',
              CygnusPlatformChromeSafariBrowserMethod.isOpened,
              _checkIsOpened,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolbarMethods() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Toolbar & Menu',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.setActionButton.name,
              'Set action button (before open)',
              CygnusPlatformChromeSafariBrowserMethod.setActionButton,
              _setActionButton,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.updateActionButton.name,
              'Update action button icon',
              CygnusPlatformChromeSafariBrowserMethod.updateActionButton,
              _browserOpened ? _updateActionButton : null,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.addMenuItem.name,
              'Add menu item (before open)',
              CygnusPlatformChromeSafariBrowserMethod.addMenuItem,
              _addMenuItem,
            ),
            if (_menuItems.isNotEmpty) ...[
              const Divider(),
              Text(
                'Menu Items: ${_menuItems.length}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildMessagingMethods() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Messaging',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.requestPostMessageChannel.name,
              'Request post message channel',
              CygnusPlatformChromeSafariBrowserMethod.requestPostMessageChannel,
              _browserOpened ? _requestPostMessageChannel : null,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod.postMessage.name,
              'Send a message to the browser',
              CygnusPlatformChromeSafariBrowserMethod.postMessage,
              _browserOpened ? _postMessage : null,
            ),
            _buildMethodTile(
              CygnusPlatformChromeSafariBrowserMethod
                  .isEngagementSignalsApiAvailable
                  .name,
              'Check if engagement signals API is available',
              CygnusPlatformChromeSafariBrowserMethod.isEngagementSignalsApiAvailable,
              _isEngagementSignalsApiAvailable,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStaticMethods() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Static Methods',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildMethodTile(
              _staticMethodName(CygnusPlatformChromeSafariBrowserMethod.isAvailable),
              'Check if Chrome Custom Tabs / Safari VC is available',
              CygnusPlatformChromeSafariBrowserMethod.isAvailable,
              _isAvailable,
            ),
            _buildMethodTile(
              _staticMethodName(
                CygnusPlatformChromeSafariBrowserMethod.getMaxToolbarItems,
              ),
              'Get max toolbar items',
              CygnusPlatformChromeSafariBrowserMethod.getMaxToolbarItems,
              _getMaxToolbarItems,
            ),
            _buildMethodTile(
              _staticMethodName(
                CygnusPlatformChromeSafariBrowserMethod.getPackageName,
              ),
              'Get Custom Tabs package name',
              CygnusPlatformChromeSafariBrowserMethod.getPackageName,
              _getPackageName,
            ),
            _buildMethodTile(
              _staticMethodName(
                CygnusPlatformChromeSafariBrowserMethod.clearWebsiteData,
              ),
              'Clear website data',
              CygnusPlatformChromeSafariBrowserMethod.clearWebsiteData,
              _clearWebsiteData,
            ),
            _buildMethodTile(
              _staticMethodName(
                CygnusPlatformChromeSafariBrowserMethod.prewarmConnections,
              ),
              'Prewarm connections',
              CygnusPlatformChromeSafariBrowserMethod.prewarmConnections,
              _prewarmConnections,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodTile(
    String methodName,
    String description,
    CygnusPlatformChromeSafariBrowserMethod method,
    VoidCallback? onPressed,
  ) {
    final supportedPlatforms = SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusChromeSafariBrowser.isMethodSupported,
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        dense: true,
        title: Text(
          methodName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 6),
            SupportBadgesRow(
              supportedPlatforms: supportedPlatforms,
              compact: true,
            ),
            const SizedBox(height: 6),
            _buildMethodHistory(methodName),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: !_isLoading ? onPressed : null,
          child: const Text('Run'),
        ),
      ),
    );
  }

  Widget _buildEventLog() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Event Log',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () => context.read<EventLogProvider>().clear(),
                  child: const Text('Clear'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Consumer<EventLogProvider>(
              builder: (context, provider, _) {
                final events = provider.events.reversed.take(20).toList();
                if (events.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    child: const Center(
                      child: Text(
                        'No events yet',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }
                return Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      final event = events[index];
                      return ListTile(
                        dense: true,
                        title: Text(
                          event.message,
                          style: const TextStyle(fontSize: 12),
                        ),
                        subtitle: Text(
                          event.data?.toString() ?? '',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: Text(
                          '${event.timestamp.hour}:${event.timestamp.minute.toString().padLeft(2, '0')}:${event.timestamp.second.toString().padLeft(2, '0')}',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
