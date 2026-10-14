import 'package:flutter/material.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:flutter_inappwebview_example/widgets/common/app_drawer.dart';
import 'package:flutter_inappwebview_example/widgets/common/appbar_loading_indicator.dart';
import 'package:flutter_inappwebview_example/widgets/common/event_log_card.dart';
import 'package:flutter_inappwebview_example/widgets/common/method_card.dart';
import 'package:flutter_inappwebview_example/widgets/common/status_card.dart';
import 'package:flutter_inappwebview_example/utils/support_checker.dart';
import 'package:flutter_inappwebview_example/utils/responsive_utils.dart';
import 'package:flutter_inappwebview_example/widgets/common/parameter_dialog.dart';
import 'package:flutter_inappwebview_example/widgets/common/method_result_history.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inappwebview_example/providers/event_log_provider.dart';
import 'package:flutter_inappwebview_example/models/event_log_entry.dart';
import 'package:flutter_inappwebview_example/providers/settings_manager.dart';
import 'package:flutter_inappwebview_example/widgets/common/profile_selector_card.dart';

/// Custom CygnusBrowser implementation for testing
class TestInAppBrowser extends CygnusBrowser {
  final void Function(String event, Map<String, dynamic>? data)? onEvent;

  TestInAppBrowser({this.onEvent, CygnusWebViewEnvironment? webViewEnvironment})
    : super(webViewEnvironment: webViewEnvironment);

  @override
  void onBrowserCreated() {
    onEvent?.call(CygnusPlatformBrowserEventsMethod.onBrowserCreated.name, {
      'id': id,
    });
  }

  @override
  void onLoadStart(CygnusWebUri? url) {
    onEvent?.call(CygnusPlatformBrowserEventsMethod.onLoadStart.name, {
      'url': url?.toString(),
    });
  }

  @override
  void onLoadStop(CygnusWebUri? url) {
    onEvent?.call(CygnusPlatformBrowserEventsMethod.onLoadStop.name, {
      'url': url?.toString(),
    });
  }

  @override
  void onReceivedError(CygnusWebResourceRequest request, CygnusWebResourceError error) {
    onEvent?.call(CygnusPlatformBrowserEventsMethod.onReceivedError.name, {
      'url': request.url.toString(),
      'errorType': error.type.name(),
      'description': error.description,
    });
  }

  @override
  void onProgressChanged(int progress) {
    onEvent?.call(CygnusPlatformBrowserEventsMethod.onProgressChanged.name, {
      'progress': progress,
    });
  }

  @override
  void onExit() {
    onEvent?.call(CygnusPlatformBrowserEventsMethod.onExit.name, null);
  }

  @override
  void onMainWindowWillClose() {
    onEvent?.call(
      CygnusPlatformBrowserEventsMethod.onMainWindowWillClose.name,
      null,
    );
  }

  @override
  void onConsoleMessage(CygnusConsoleMessage consoleMessage) {
    onEvent?.call(CygnusPlatformBrowserEventsMethod.onConsoleMessage.name, {
      'message': consoleMessage.message,
      'level': consoleMessage.messageLevel.name,
    });
  }
}

/// Screen for testing CygnusBrowser functionality
class InAppBrowserScreen extends StatefulWidget {
  const InAppBrowserScreen({super.key});

  @override
  State<InAppBrowserScreen> createState() => _InAppBrowserScreenState();
}

class _InAppBrowserScreenState extends State<InAppBrowserScreen> {
  final TextEditingController _menuItemIdController = TextEditingController();
  final TextEditingController _menuItemTitleController = TextEditingController(
    text: 'Custom Menu Item',
  );

  TestInAppBrowser? _browser;
  bool _isLoading = false;
  bool _browserOpened = false;
  final List<CygnusBrowserMenuItem> _menuItems = [];
  bool _isInitialized = false;
  int _lastEnvironmentRevision = -1;

  final Map<String, List<MethodResultEntry>> _methodHistory = {};
  final Map<String, int> _selectedHistoryIndex = {};
  static const int _maxHistoryEntries = 3;

  String get _initStatusKey => CygnusPlatformBrowserMethod.openUrlRequest.name;

  void _initBrowser(CygnusWebViewEnvironment? webViewEnvironment) {
    try {
      _browser = TestInAppBrowser(
        webViewEnvironment: webViewEnvironment,
        onEvent: (event, data) {
          _logEvent(EventType.ui, event, data: data);
          if (event == CygnusPlatformBrowserEventsMethod.onExit.name) {
            setState(() => _browserOpened = false);
          }
        },
      );
    } catch (e) {
      _showInitError('Unable to create browser: $e');
    }
  }

  String _staticMethodName(CygnusPlatformBrowserMethod method) {
    return '${method.name} (static)';
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settingsManager = context.watch<SettingsManager>();

    if (!_isInitialized) {
      _isInitialized = true;
      _lastEnvironmentRevision = settingsManager.environmentRevision;
      _initBrowser(settingsManager.webViewEnvironment);
      return;
    }

    if (_lastEnvironmentRevision != settingsManager.environmentRevision) {
      _lastEnvironmentRevision = settingsManager.environmentRevision;
      _handleEnvironmentChange(settingsManager.webViewEnvironment);
    }
  }

  @override
  void dispose() {
    _menuItemIdController.dispose();
    _menuItemTitleController.dispose();
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

  Future<void> _openUrlRequest() async {
    final settingsManager = context.read<SettingsManager>();
    final params = await showParameterDialog(
      context: context,
      title: CygnusPlatformBrowserMethod.openUrlRequest.name,
      parameters: {
        'url': 'https://flutter.dev',
        'toolbarTopBackgroundColor': Colors.blue,
        'presentationStyle': 'FULL_SCREEN',
        'javaScriptEnabled': true,
      },
      requiredPaths: ['url'],
    );

    if (params == null) return;
    final url = params['url']?.toString() ?? '';
    if (url.isEmpty) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openUrlRequest.name,
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final baseSettings = settingsManager.buildSettings();
      final webViewSettings =
          CygnusWebViewSettings.fromMap({
            ...baseSettings.toMap(),
            'javaScriptEnabled':
                params['javaScriptEnabled'] as bool? ??
                baseSettings.javaScriptEnabled ??
                true,
          }) ??
          CygnusWebViewSettings();
      await _browser?.openUrlRequest(
        urlRequest: CygnusURLRequest(url: CygnusWebUri(url)),
        settings: CygnusBrowserClassSettings(
          browserSettings: CygnusBrowserSettings(
            toolbarTopBackgroundColor:
                params['toolbarTopBackgroundColor'] as Color?,
            presentationStyle: _parseModalPresentationStyle(
              params['presentationStyle']?.toString(),
            ),
          ),
          webViewSettings: webViewSettings,
        ),
      );
      setState(() => _browserOpened = true);
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openUrlRequest.name,
        'Browser opened with URL',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openUrlRequest.name,
        'Error opening browser: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _openFile() async {
    final settingsManager = context.read<SettingsManager>();
    final params = await showParameterDialog(
      context: context,
      title: CygnusPlatformBrowserMethod.openFile.name,
      parameters: {
        'assetFilePath': 'assets/index.html',
        'toolbarTopBackgroundColor': Colors.green,
      },
      requiredPaths: ['assetFilePath'],
    );

    if (params == null) return;
    final assetFilePath = params['assetFilePath']?.toString() ?? '';
    if (assetFilePath.isEmpty) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openFile.name,
        'Please enter an asset file path',
        isError: true,
      );
      return;
    }
    setState(() => _isLoading = true);
    try {
      await _browser?.openFile(
        assetFilePath: assetFilePath,
        settings: CygnusBrowserClassSettings(
          browserSettings: CygnusBrowserSettings(
            toolbarTopBackgroundColor:
                params['toolbarTopBackgroundColor'] as Color?,
          ),
          webViewSettings: settingsManager.buildSettings(),
        ),
      );
      setState(() => _browserOpened = true);
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openFile.name,
        'Browser opened with file',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openFile.name,
        'Error opening file: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _openData() async {
    final settingsManager = context.read<SettingsManager>();
    final params = await showParameterDialog(
      context: context,
      title: CygnusPlatformBrowserMethod.openData.name,
      parameters: {
        'data':
            '<html><body><h1>Hello ${CygnusBrowser}!</h1><p>This is HTML data.</p></body></html>',
        'mimeType': 'text/html',
        'encoding': 'utf8',
        'toolbarTopBackgroundColor': Colors.purple,
      },
      requiredPaths: ['data'],
    );

    if (params == null) return;
    final data = params['data']?.toString() ?? '';
    if (data.isEmpty) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openData.name,
        'Please enter HTML data',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await _browser?.openData(
        data: data,
        mimeType: params['mimeType']?.toString() ?? 'text/html',
        encoding: params['encoding']?.toString() ?? 'utf8',
        settings: CygnusBrowserClassSettings(
          browserSettings: CygnusBrowserSettings(
            toolbarTopBackgroundColor:
                params['toolbarTopBackgroundColor'] as Color?,
          ),
          webViewSettings: settingsManager.buildSettings(),
        ),
      );
      setState(() => _browserOpened = true);
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openData.name,
        'Browser opened with data',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.openData.name,
        'Error opening data: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _openWithSystemBrowser() async {
    final params = await showParameterDialog(
      context: context,
      title: CygnusPlatformBrowserMethod.openWithSystemBrowser.name,
      parameters: {'url': 'https://flutter.dev'},
      requiredPaths: ['url'],
    );

    if (params == null) return;
    final url = params['url']?.toString() ?? '';
    if (url.isEmpty) {
      _recordMethodResult(
        _staticMethodName(CygnusPlatformBrowserMethod.openWithSystemBrowser),
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      await CygnusBrowser.openWithSystemBrowser(url: CygnusWebUri(url));
      _recordMethodResult(
        _staticMethodName(CygnusPlatformBrowserMethod.openWithSystemBrowser),
        'Opened in system browser',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _staticMethodName(CygnusPlatformBrowserMethod.openWithSystemBrowser),
        'Error opening system browser: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _addMenuItem() {
    final id = _menuItemIdController.text.trim();
    final title = _menuItemTitleController.text.trim();

    if (id.isEmpty || title.isEmpty) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.addMenuItem.name,
        'Please enter menu item ID and title',
        isError: true,
      );
      return;
    }

    final menuItem = CygnusBrowserMenuItem(
      id: id.hashCode,
      title: title,
      onClick: () {
        _logEvent(EventType.ui, 'Menu item clicked', data: {'id': id});
        _recordMethodResult(
          CygnusPlatformBrowserMethod.addMenuItem.name,
          'Menu item "$title" clicked',
          isError: false,
        );
      },
    );

    _browser?.addMenuItem(menuItem);
    setState(() {
      _menuItems.add(menuItem);
    });
    _menuItemIdController.clear();
    _recordMethodResult(
      CygnusPlatformBrowserMethod.addMenuItem.name,
      'Menu item added',
      isError: false,
    );
  }

  void _removeMenuItem(CygnusBrowserMenuItem menuItem) {
    final removed = _browser?.removeMenuItem(menuItem) ?? false;
    if (removed) {
      setState(() {
        _menuItems.remove(menuItem);
      });
      _recordMethodResult(
        CygnusPlatformBrowserMethod.removeMenuItem.name,
        'Menu item removed',
        isError: false,
      );
    } else {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.removeMenuItem.name,
        'Failed to remove menu item',
        isError: true,
      );
    }
  }

  Future<void> _show() async {
    setState(() => _isLoading = true);
    try {
      await _browser?.show();
      _recordMethodResult(
        CygnusPlatformBrowserMethod.show.name,
        'Browser shown',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.show.name,
        'Error showing browser: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _hide() async {
    setState(() => _isLoading = true);
    try {
      await _browser?.hide();
      _recordMethodResult(
        CygnusPlatformBrowserMethod.hide.name,
        'Browser hidden',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.hide.name,
        'Error hiding browser: $e',
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
        CygnusPlatformBrowserMethod.close.name,
        'Browser closed',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.close.name,
        'Error closing browser: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _isHidden() async {
    setState(() => _isLoading = true);
    try {
      final hidden = await _browser?.isHidden();
      _recordMethodResult(
        CygnusPlatformBrowserMethod.isHidden.name,
        'Browser is hidden: $hidden',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.isHidden.name,
        'Error checking hidden state: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getSettings() async {
    setState(() => _isLoading = true);
    try {
      final settings = await _browser?.getSettings();
      _showSettingsDialog(settings);
      _recordMethodResult(
        CygnusPlatformBrowserMethod.getSettings.name,
        'Settings dialog opened',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.getSettings.name,
        'Error getting settings: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _setSettings() async {
    final params = await showParameterDialog(
      context: context,
      title: CygnusPlatformBrowserMethod.setSettings.name,
      parameters: {
        'toolbarTopBackgroundColor': Colors.orange,
        'hideToolbarTop': false,
      },
    );

    if (params == null) return;
    setState(() => _isLoading = true);
    try {
      await _browser?.setSettings(
        settings: CygnusBrowserClassSettings(
          browserSettings: CygnusBrowserSettings(
            toolbarTopBackgroundColor:
                params['toolbarTopBackgroundColor'] as Color?,
            hideToolbarTop: params['hideToolbarTop'] as bool?,
          ),
        ),
      );
      _recordMethodResult(
        CygnusPlatformBrowserMethod.setSettings.name,
        'Settings updated',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformBrowserMethod.setSettings.name,
        'Error setting settings: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _checkIsOpened() {
    final opened = _browser?.isOpened() ?? false;
    _recordMethodResult(
      CygnusPlatformBrowserMethod.isOpened.name,
      'Browser is opened: $opened',
      isError: false,
    );
  }

  void _showSettingsDialog(CygnusBrowserClassSettings? settings) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Browser Settings'),
        content: SingleChildScrollView(
          child: Text(settings?.toMap().toString() ?? 'No settings'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
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
    _recordMethodResult(_initStatusKey, message, isError: true);
  }

  void _handleEnvironmentChange(CygnusWebViewEnvironment? environment) {
    if (_browserOpened) {
      _browser?.close();
    }
    _browser?.dispose();
    _initBrowser(environment);
    setState(() => _browserOpened = false);
  }

  Widget _buildInitStatusSection() {
    final entries = _methodHistory[_initStatusKey] ?? const [];
    if (entries.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      children: [
        _buildMethodHistory(_initStatusKey, title: 'Initialization'),
        const SizedBox(height: 16),
      ],
    );
  }

  CygnusModalPresentationStyle _parseModalPresentationStyle(String? value) {
    if (value == null || value.isEmpty) {
      return CygnusModalPresentationStyle.FULL_SCREEN;
    }
    return CygnusModalPresentationStyle.values.firstWhere(
      (style) => style.name().toLowerCase() == value.toLowerCase(),
      orElse: () => CygnusModalPresentationStyle.FULL_SCREEN,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$CygnusBrowser'),
        actions: [
          AppBarLoadingIndicator(isLoading: _isLoading),
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
        key: const Key('inapp_browser_main_list'),
        padding: const EdgeInsets.all(16),
        children: [
          ProfileSelectorCard(
            onEditSettingsProfile: () =>
                Navigator.pushNamed(context, '/settings'),
          ),
          const SizedBox(height: 16),
          _buildStatusCard(),
          const SizedBox(height: 16),
          _buildInitStatusSection(),
          _buildOpenMethods(),
          const SizedBox(height: 16),
          _buildMenuItemsSection(),
          const SizedBox(height: 16),
          _buildControlMethods(),
          const SizedBox(height: 16),
          _buildSettingsMethods(),
          const SizedBox(height: 16),
          const EventLogCard(maxEvents: 20, height: 200),
        ],
      ),
    );
  }

  Widget _buildStatusCard() {
    return StatusCard(
      isActive: _browserOpened,
      activeTitle: 'Browser Open',
      inactiveTitle: 'Browser Closed',
      activeIcon: Icons.web,
      inactiveIcon: Icons.web_asset_off,
      subtitle: 'ID: ${_browser?.id ?? "N/A"}',
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
              CygnusPlatformBrowserMethod.openUrlRequest.name,
              'Open browser with URL request',
              CygnusPlatformBrowserMethod.openUrlRequest,
              _openUrlRequest,
            ),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.openFile.name,
              'Open browser with local file',
              CygnusPlatformBrowserMethod.openFile,
              _openFile,
            ),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.openData.name,
              'Open browser with HTML data',
              CygnusPlatformBrowserMethod.openData,
              _openData,
            ),
            _buildMethodTile(
              _staticMethodName(
                CygnusPlatformBrowserMethod.openWithSystemBrowser,
              ),
              'Open URL in system browser',
              CygnusPlatformBrowserMethod.openWithSystemBrowser,
              _openWithSystemBrowser,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItemsSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Menu Items',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = ResponsiveBreakpoints.isMobileWidth(
                  constraints.maxWidth,
                );
                const spacing = 8.0;
                const buttonWidth = 96.0;
                final availableWidth = constraints.maxWidth;
                final remainingWidth = isMobile
                    ? availableWidth
                    : (availableWidth - buttonWidth - spacing * 2);
                final idWidth = isMobile
                    ? availableWidth
                    : remainingWidth * 0.35;
                final titleWidth = isMobile
                    ? availableWidth
                    : remainingWidth * 0.65;

                return Wrap(
                  key: const Key('inapp_browser_menu_items_layout'),
                  spacing: spacing,
                  runSpacing: spacing,
                  children: [
                    SizedBox(
                      width: idWidth,
                      child: TextField(
                        key: const Key('inapp_browser_menu_id_field'),
                        controller: _menuItemIdController,
                        decoration: const InputDecoration(
                          labelText: 'ID',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: titleWidth,
                      child: TextField(
                        key: const Key('inapp_browser_menu_title_field'),
                        controller: _menuItemTitleController,
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(),
                          isDense: true,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: isMobile ? availableWidth : buttonWidth,
                      child: ElevatedButton(
                        key: const Key('inapp_browser_menu_add_button'),
                        onPressed: _addMenuItem,
                        child: const Text('Add'),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 8),
            _buildMethodHistory(CygnusPlatformBrowserMethod.addMenuItem.name),
            _buildMethodHistory(CygnusPlatformBrowserMethod.removeMenuItem.name),
            const SizedBox(height: 12),
            if (_menuItems.isNotEmpty) ...[
              const Divider(),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  final item = _menuItems[index];
                  return ListTile(
                    dense: true,
                    title: Text(item.title),
                    subtitle: Text('ID: ${item.id}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, size: 20),
                      onPressed: () => _removeMenuItem(item),
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildControlMethods() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Control Methods',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.show.name,
              'Show the browser',
              CygnusPlatformBrowserMethod.show,
              _browserOpened ? _show : null,
            ),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.hide.name,
              'Hide the browser',
              CygnusPlatformBrowserMethod.hide,
              _browserOpened ? _hide : null,
            ),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.close.name,
              'Close the browser',
              CygnusPlatformBrowserMethod.close,
              _browserOpened ? _close : null,
            ),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.isHidden.name,
              'Check if browser is hidden',
              CygnusPlatformBrowserMethod.isHidden,
              _browserOpened ? _isHidden : null,
            ),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.isOpened.name,
              'Check if browser is opened',
              CygnusPlatformBrowserMethod.isOpened,
              _checkIsOpened,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsMethods() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings Methods',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.getSettings.name,
              'Get current browser settings',
              CygnusPlatformBrowserMethod.getSettings,
              _browserOpened ? _getSettings : null,
            ),
            _buildMethodTile(
              CygnusPlatformBrowserMethod.setSettings.name,
              'Update browser settings',
              CygnusPlatformBrowserMethod.setSettings,
              _browserOpened ? _setSettings : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMethodTile(
    String methodName,
    String description,
    CygnusPlatformBrowserMethod method,
    VoidCallback? onPressed,
  ) {
    final supportedPlatforms = SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusBrowser.isMethodSupported,
    );

    return MethodTile(
      methodName: methodName,
      description: description,
      supportedPlatforms: supportedPlatforms,
      onRun: !_isLoading ? onPressed : null,
      historyEntries: _methodHistory[methodName],
      selectedHistoryIndex: _selectedHistoryIndex[methodName],
      onHistorySelected: (index) {
        setState(() => _selectedHistoryIndex[methodName] = index);
      },
    );
  }
}
