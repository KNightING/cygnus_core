import 'package:flutter/material.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:cygnus_core_example/widgets/common/app_drawer.dart';
import 'package:cygnus_core_example/widgets/common/appbar_loading_indicator.dart';
import 'package:cygnus_core_example/widgets/common/empty_state.dart';
import 'package:cygnus_core_example/widgets/common/method_card.dart';
import 'package:cygnus_core_example/widgets/common/resize_handle.dart';
import 'package:cygnus_core_example/utils/support_checker.dart';
import 'package:cygnus_core_example/widgets/common/parameter_dialog.dart';
import 'package:cygnus_core_example/widgets/common/method_result_history.dart';

/// Screen for testing CygnusWebStorage (localStorage and sessionStorage) functionality
class WebStorageScreen extends StatefulWidget {
  const WebStorageScreen({super.key});

  @override
  State<WebStorageScreen> createState() => _WebStorageScreenState();
}

class _WebStorageScreenState extends State<WebStorageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  CygnusWebViewController? _webViewController;
  bool _isLoading = false;
  bool _webViewReady = false;
  double _webViewHeight = 140;
  static const double _minWebViewHeight = 100;
  static const double _minContentHeight = 260;
  static const double _dividerHeight = 6;

  // CygnusLocalStorage state
  List<CygnusWebStorageItem> _localStorageItems = [];
  int? _localStorageLength;

  // CygnusSessionStorage state
  List<CygnusWebStorageItem> _sessionStorageItems = [];
  int? _sessionStorageLength;

  // CygnusWebStorageManager state
  final CygnusWebStorageManager _webStorageManager = CygnusWebStorageManager.instance();
  List<CygnusWebStorageOrigin> _webStorageOrigins = [];
  List<CygnusWebsiteDataRecord> _dataRecords = [];

  final TextEditingController _urlController = TextEditingController(
    text: 'https://example.com',
  );

  final Map<String, List<MethodResultEntry>> _methodHistory = {};
  final Map<String, int> _selectedHistoryIndex = {};
  static const int _maxHistoryEntries = 3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  CygnusWebStorage? get _webStorage => _webViewController?.webStorage;
  CygnusLocalStorage? get _localStorage => _webStorage?.localStorage;
  CygnusSessionStorage? get _sessionStorage => _webStorage?.sessionStorage;

  bool get _isLocalStorageTab => _tabController.index == 0;

  String get _activeStorageTypeName =>
      _isLocalStorageTab ? '$CygnusLocalStorage' : '$CygnusSessionStorage';

  String _storageMethodKey(String methodName) {
    return '$_activeStorageTypeName.$methodName';
  }

  String _managerMethodKey(CygnusPlatformWebStorageManagerMethod method) {
    return '$CygnusWebStorageManager.${method.name}';
  }

  Set<SupportedPlatform> _getStorageMethodPlatforms(
    String methodName, {
    required bool isLocal,
  }) {
    if (isLocal) {
      final method = CygnusPlatformLocalStorageMethod.values.firstWhere(
        (m) => m.name == methodName,
      );
      return SupportCheckHelper.supportedPlatformsForMethod(
        method: method,
        checker: CygnusLocalStorage.isMethodSupported,
      );
    }

    final method = CygnusPlatformSessionStorageMethod.values.firstWhere(
      (m) => m.name == methodName,
    );
    return SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusSessionStorage.isMethodSupported,
    );
  }

  Future<void> _loadUrl() async {
    final url = _urlController.text.trim();
    if (url.isEmpty) {
      _recordMethodResult(
        CygnusPlatformWebViewControllerMethod.loadUrl.name,
        'Please enter a URL',
        isError: true,
      );
      return;
    }

    try {
      await _webViewController?.loadUrl(
        urlRequest: CygnusURLRequest(url: CygnusWebUri(url)),
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformWebViewControllerMethod.loadUrl.name,
        'Error loading URL: $e',
        isError: true,
      );
    }
  }

  Future<void> _getLength() async {
    if (!_webViewReady) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.length.name),
        'WebView not ready. Load a page first.',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final storage = _isLocalStorageTab ? _localStorage : _sessionStorage;
      final length = await storage?.length();

      setState(() {
        if (_isLocalStorageTab) {
          _localStorageLength = length;
        } else {
          _sessionStorageLength = length;
        }
      });
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.length.name),
        'CygnusStorage length: $length',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.length.name),
        'Error getting length: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getItems() async {
    if (!_webViewReady) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.getItems.name),
        'WebView not ready. Load a page first.',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final storage = _isLocalStorageTab ? _localStorage : _sessionStorage;
      final items = await storage?.getItems() ?? [];

      setState(() {
        if (_isLocalStorageTab) {
          _localStorageItems = items;
          _localStorageLength = items.length;
        } else {
          _sessionStorageItems = items;
          _sessionStorageLength = items.length;
        }
      });
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.getItems.name),
        'Found ${items.length} items',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.getItems.name),
        'Error getting items: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getItem(String key) async {
    if (!_webViewReady) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.getItem.name),
        'WebView not ready. Load a page first.',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final storage = _isLocalStorageTab ? _localStorage : _sessionStorage;
      final value = await storage?.getItem(key: key);
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.getItem.name),
        'Value for "$key": ${value ?? "null"}',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.getItem.name),
        'Error getting item: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _setItem() async {
    if (!_webViewReady) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.setItem.name),
        'WebView not ready. Load a page first.',
        isError: true,
      );
      return;
    }

    await _promptSetItem();
  }

  Future<void> _removeItem(String key) async {
    if (!_webViewReady) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.removeItem.name),
        'WebView not ready. Load a page first.',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final storage = _isLocalStorageTab ? _localStorage : _sessionStorage;
      await storage?.removeItem(key: key);
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.removeItem.name),
        'Item "$key" removed',
        isError: false,
      );
      await _getItems();
    } catch (e) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.removeItem.name),
        'Error removing item: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _promptRemoveItem() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Remove Item',
      parameters: {'key': ''},
      requiredPaths: ['key'],
    );

    if (params == null) return;
    final key = params['key']?.toString() ?? '';
    if (key.isEmpty) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.removeItem.name),
        'Please enter a key',
        isError: true,
      );
      return;
    }
    _removeItem(key);
  }

  Future<void> _clear() async {
    if (!_webViewReady) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.clear.name),
        'WebView not ready. Load a page first.',
        isError: true,
      );
      return;
    }

    final confirmed = await _showConfirmDialog(
      'Clear CygnusStorage',
      'Are you sure you want to clear all $_activeStorageTypeName items?',
    );
    if (!confirmed) return;

    setState(() => _isLoading = true);
    try {
      final storage = _isLocalStorageTab ? _localStorage : _sessionStorage;
      await storage?.clear();
      setState(() {
        if (_isLocalStorageTab) {
          _localStorageItems = [];
          _localStorageLength = 0;
        } else {
          _sessionStorageItems = [];
          _sessionStorageLength = 0;
        }
      });
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.clear.name),
        'CygnusStorage cleared',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.clear.name),
        'Error clearing storage: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _key(int index) async {
    if (!_webViewReady) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.key.name),
        'WebView not ready. Load a page first.',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final storage = _isLocalStorageTab ? _localStorage : _sessionStorage;
      final keyName = await storage?.key(index: index);
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.key.name),
        'Key at index $index: ${keyName ?? "null"}',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.key.name),
        'Error getting key: $e',
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

  Future<bool> _showConfirmDialog(String title, String content) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('Clear'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<void> _promptSetItem() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Set Item ($_activeStorageTypeName)',
      parameters: {'key': '', 'value': ''},
      requiredPaths: ['key', 'value'],
    );

    if (params == null) return;
    final key = params['key']?.toString() ?? '';
    final value = params['value']?.toString() ?? '';
    if (key.isEmpty || value.isEmpty) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.setItem.name),
        'Key and Value are required',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final storage = _isLocalStorageTab ? _localStorage : _sessionStorage;
      await storage?.setItem(key: key, value: value);
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.setItem.name),
        'Item set successfully',
        isError: false,
      );
      await _getItems();
    } catch (e) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.setItem.name),
        'Error setting item: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _promptKeyIndex() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Get Key at Index',
      parameters: {'index': 0},
      requiredPaths: ['index'],
    );

    if (params == null) return;
    final index = (params['index'] as num?)?.toInt();
    if (index == null || index < 0) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.key.name),
        'Please enter a valid index',
        isError: true,
      );
      return;
    }
    _key(index);
  }

  Future<void> _promptGetItem() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Get Item by Key',
      parameters: {'key': ''},
      requiredPaths: ['key'],
    );

    if (params == null) return;
    final key = params['key']?.toString() ?? '';
    if (key.isEmpty) {
      _recordMethodResult(
        _storageMethodKey(CygnusPlatformLocalStorageMethod.getItem.name),
        'Please enter a key',
        isError: true,
      );
      return;
    }
    _getItem(key);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web CygnusStorage'),
        actions: [AppBarLoadingIndicator(isLoading: _isLoading)],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(text: 'Manager'),
            Tab(text: '$CygnusLocalStorage'),
            Tab(text: '$CygnusSessionStorage'),
          ],
          indicatorColor: Colors.white,
        ),
      ),
      drawer: AppDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWebViewHeight =
              constraints.maxHeight - _minContentHeight - _dividerHeight;
          final effectiveMax = maxWebViewHeight < _minWebViewHeight
              ? _minWebViewHeight
              : maxWebViewHeight;
          final webViewHeight = _webViewHeight
              .clamp(_minWebViewHeight, effectiveMax)
              .toDouble();

          return Column(
            children: [
              SizedBox(height: webViewHeight, child: _buildWebViewSection()),
              ResizeHandle(
                height: _dividerHeight,
                onDrag: (delta) {
                  setState(() {
                    _webViewHeight = (_webViewHeight + delta)
                        .clamp(_minWebViewHeight, effectiveMax)
                        .toDouble();
                  });
                },
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildWebStorageManagerView(),
                    _buildStorageView(
                      items: _localStorageItems,
                      length: _localStorageLength,
                      isLocal: true,
                    ),
                    _buildStorageView(
                      items: _sessionStorageItems,
                      length: _sessionStorageLength,
                      isLocal: false,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWebViewSection() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _urlController,
                  decoration: const InputDecoration(
                    labelText: 'URL',
                    hintText: 'https://example.com',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(onPressed: _loadUrl, child: const Text('Load')),
            ],
          ),
          const SizedBox(height: 8),
          _buildMethodHistory(
            CygnusPlatformWebViewControllerMethod.loadUrl.name,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Stack(
              children: [
                CygnusWebView(
                  initialUrlRequest: CygnusURLRequest(
                    url: CygnusWebUri(_urlController.text),
                  ),
                  initialSettings: CygnusWebViewSettings(
                    javaScriptEnabled: true,
                  ),
                  onWebViewCreated: (controller) {
                    _webViewController = controller;
                  },
                  onLoadStop: (controller, url) {
                    setState(() => _webViewReady = true);
                  },
                  onLoadError: (controller, url, code, message) {
                    _recordMethodResult(
                      CygnusPlatformWebViewControllerMethod.loadUrl.name,
                      'Load error: $message',
                      isError: true,
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  margin: const EdgeInsets.all(4),
                  child: Text(
                    _webViewReady ? 'WebView Ready ✓' : 'Loading WebView...',
                    style: TextStyle(
                      color: _webViewReady ? Colors.green : Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (!_webViewReady)
            Container(
              margin: const EdgeInsets.only(top: 8),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline,
                    size: 16,
                    color: Colors.orange,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '$CygnusWebStorage requires a loaded WebView. Load a page to enable storage methods.',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildStorageView({
    required List<CygnusWebStorageItem> items,
    required int? length,
    required bool isLocal,
  }) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildMethodSection(
          CygnusPlatformLocalStorageMethod.length.name,
          'Get number of items in storage',
          _getStorageMethodPlatforms(
            CygnusPlatformLocalStorageMethod.length.name,
            isLocal: isLocal,
          ),
          _getLength,
        ),
        _buildMethodSection(
          CygnusPlatformLocalStorageMethod.setItem.name,
          'Set a key-value pair',
          _getStorageMethodPlatforms(
            CygnusPlatformLocalStorageMethod.setItem.name,
            isLocal: isLocal,
          ),
          _setItem,
        ),
        _buildMethodSection(
          CygnusPlatformLocalStorageMethod.getItem.name,
          'Get value by key',
          _getStorageMethodPlatforms(
            CygnusPlatformLocalStorageMethod.getItem.name,
            isLocal: isLocal,
          ),
          _promptGetItem,
        ),
        _buildMethodSection(
          CygnusPlatformLocalStorageMethod.removeItem.name,
          'Remove item by key (select from list)',
          _getStorageMethodPlatforms(
            CygnusPlatformLocalStorageMethod.removeItem.name,
            isLocal: isLocal,
          ),
          _promptRemoveItem,
        ),
        _buildMethodSection(
          CygnusPlatformLocalStorageMethod.getItems.name,
          'Get all items',
          _getStorageMethodPlatforms(
            CygnusPlatformLocalStorageMethod.getItems.name,
            isLocal: isLocal,
          ),
          _getItems,
        ),
        _buildMethodSection(
          CygnusPlatformLocalStorageMethod.clear.name,
          'Clear all items',
          _getStorageMethodPlatforms(
            CygnusPlatformLocalStorageMethod.clear.name,
            isLocal: isLocal,
          ),
          _clear,
        ),
        _buildMethodSection(
          CygnusPlatformLocalStorageMethod.key.name,
          'Get key at index',
          _getStorageMethodPlatforms(
            CygnusPlatformLocalStorageMethod.key.name,
            isLocal: isLocal,
          ),
          _promptKeyIndex,
        ),
        const SizedBox(height: 16),
        _buildItemsList(items, length),
      ],
    );
  }

  Widget _buildMethodSection(
    String methodName,
    String description,
    Set<SupportedPlatform> supportedPlatforms,
    VoidCallback? onPressed,
  ) {
    final historyKey = _storageMethodKey(methodName);
    return MethodTile(
      methodName: methodName,
      description: description,
      supportedPlatforms: supportedPlatforms,
      onRun: !_isLoading && _webViewReady ? onPressed : null,
      historyEntries: _methodHistory[historyKey],
      selectedHistoryIndex: _selectedHistoryIndex[historyKey],
      onHistorySelected: (index) {
        setState(() => _selectedHistoryIndex[historyKey] = index);
      },
    );
  }

  Widget _buildItemsList(List<CygnusWebStorageItem> items, int? length) {
    final storageName = _activeStorageTypeName;

    if (items.isEmpty) {
      return EmptyStateCard(
        icon: Icons.storage_outlined,
        title: 'No $storageName items found',
        description: _webViewReady
            ? 'Click "${_isLocalStorageTab ? CygnusPlatformLocalStorageMethod.getItems.name : CygnusPlatformSessionStorageMethod.getItems.name}" to fetch storage contents'
            : 'Load a page first, then fetch items',
      );
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  '$storageName (${length ?? items.length} items)',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _isLoading || !_webViewReady ? null : _getItems,
                  tooltip: 'Refresh',
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(
                  item.key ?? 'null',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  item.value?.toString() ?? 'null',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.content_copy, size: 20),
                      onPressed: () {
                        _getItem(item.key ?? '');
                      },
                      tooltip: 'Get Item Value',
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, size: 20),
                      onPressed: () {
                        _removeItem(item.key ?? '');
                      },
                      tooltip: 'Remove Item',
                      color: Colors.red,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  // ============ CygnusWebStorageManager Methods ============

  Set<SupportedPlatform> _getManagerMethodPlatforms(String methodName) {
    final method = CygnusPlatformWebStorageManagerMethod.values.firstWhere(
      (m) => m.name == methodName,
      orElse: () => CygnusPlatformWebStorageManagerMethod.deleteAllData,
    );
    return SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusWebStorageManager.isMethodSupported,
    );
  }

  Future<void> _getOrigins() async {
    setState(() => _isLoading = true);
    try {
      final origins = await _webStorageManager.getOrigins();
      setState(() => _webStorageOrigins = origins);
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.getOrigins),
        'Found ${origins.length} origins',
        isError: false,
        value: origins.map((o) => o.toMap()).toList(),
      );
    } catch (e) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.getOrigins),
        'Error getting origins: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _deleteAllData() async {
    final confirmed = await _showConfirmDialog(
      'Delete All Data',
      'Are you sure you want to delete all web storage data?',
    );
    if (!confirmed) return;

    setState(() => _isLoading = true);
    try {
      await _webStorageManager.deleteAllData();
      setState(() => _webStorageOrigins = []);
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.deleteAllData),
        'All web storage data deleted',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.deleteAllData),
        'Error deleting all data: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _deleteOrigin(String origin) async {
    setState(() => _isLoading = true);
    try {
      await _webStorageManager.deleteOrigin(origin: origin);
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.deleteOrigin),
        'Deleted origin: $origin',
        isError: false,
      );
      await _getOrigins();
    } catch (e) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.deleteOrigin),
        'Error deleting origin: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _promptDeleteOrigin() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Delete Origin',
      parameters: {'origin': ''},
      requiredPaths: ['origin'],
    );

    if (params == null) return;
    final origin = params['origin']?.toString() ?? '';
    if (origin.isEmpty) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.deleteOrigin),
        'Please enter an origin',
        isError: true,
      );
      return;
    }
    await _deleteOrigin(origin);
  }

  Future<void> _getQuotaForOrigin() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Get Quota for Origin',
      parameters: {'origin': ''},
      requiredPaths: ['origin'],
    );

    if (params == null) return;
    final origin = params['origin']?.toString() ?? '';
    if (origin.isEmpty) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.getQuotaForOrigin),
        'Please enter an origin',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final quota = await _webStorageManager.getQuotaForOrigin(origin: origin);
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.getQuotaForOrigin),
        'Quota for "$origin": $quota bytes',
        isError: false,
        value: quota,
      );
    } catch (e) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.getQuotaForOrigin),
        'Error getting quota: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getUsageForOrigin() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Get Usage for Origin',
      parameters: {'origin': ''},
      requiredPaths: ['origin'],
    );

    if (params == null) return;
    final origin = params['origin']?.toString() ?? '';
    if (origin.isEmpty) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.getUsageForOrigin),
        'Please enter an origin',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final usage = await _webStorageManager.getUsageForOrigin(origin: origin);
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.getUsageForOrigin),
        'Usage for "$origin": $usage bytes',
        isError: false,
        value: usage,
      );
    } catch (e) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.getUsageForOrigin),
        'Error getting usage: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _fetchDataRecords() async {
    setState(() => _isLoading = true);
    try {
      final records = await _webStorageManager.fetchDataRecords(
        dataTypes: CygnusWebsiteDataType.ALL,
      );
      setState(() => _dataRecords = records);
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.fetchDataRecords),
        'Found ${records.length} data records',
        isError: false,
        value: records.map((r) => r.toMap()).toList(),
      );
    } catch (e) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.fetchDataRecords),
        'Error fetching data records: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _removeDataModifiedSince() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Remove Data Modified Since',
      description: 'Enter how many days ago to start removal (0 = all data)',
      parameters: {'daysAgo': 0},
    );

    if (params == null) return;
    final daysAgo = (params['daysAgo'] as num?)?.toInt() ?? 0;
    final date = DateTime.now().subtract(Duration(days: daysAgo));

    final confirmed = await _showConfirmDialog(
      'Remove Data',
      'Are you sure you want to remove all data modified since ${date.toIso8601String()}?',
    );
    if (!confirmed) return;

    setState(() => _isLoading = true);
    try {
      await _webStorageManager.removeDataModifiedSince(
        dataTypes: CygnusWebsiteDataType.ALL,
        date: date,
      );
      setState(() => _dataRecords = []);
      _recordMethodResult(
        _managerMethodKey(
          CygnusPlatformWebStorageManagerMethod.removeDataModifiedSince,
        ),
        'Data removed since ${date.toIso8601String()}',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        _managerMethodKey(
          CygnusPlatformWebStorageManagerMethod.removeDataModifiedSince,
        ),
        'Error removing data: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _removeDataForRecord(CygnusWebsiteDataRecord record) async {
    setState(() => _isLoading = true);
    try {
      await _webStorageManager.removeDataFor(
        dataTypes: record.dataTypes ?? CygnusWebsiteDataType.ALL,
        dataRecords: [record],
      );
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.removeDataFor),
        'Removed data for ${record.displayName}',
        isError: false,
      );
      await _fetchDataRecords();
    } catch (e) {
      _recordMethodResult(
        _managerMethodKey(CygnusPlatformWebStorageManagerMethod.removeDataFor),
        'Error removing data: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Widget _buildWebStorageManagerView() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        // Platform info card
        Card(
          color: Colors.blue.shade50,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '$CygnusWebStorageManager provides platform-level storage management. '
                    'Methods have different platform availability - check the support badges.',
                    style: TextStyle(fontSize: 12, color: Colors.blue.shade700),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildManagerMethodSection(
          CygnusPlatformWebStorageManagerMethod.getOrigins.name,
          'Get origins using Application Cache or Web SQL Database',
          _getManagerMethodPlatforms(
            CygnusPlatformWebStorageManagerMethod.getOrigins.name,
          ),
          _getOrigins,
        ),
        _buildManagerMethodSection(
          CygnusPlatformWebStorageManagerMethod.deleteAllData.name,
          'Clear all storage (App Cache, Web SQL, HTML5 CygnusStorage)',
          _getManagerMethodPlatforms(
            CygnusPlatformWebStorageManagerMethod.deleteAllData.name,
          ),
          _deleteAllData,
        ),
        _buildManagerMethodSection(
          CygnusPlatformWebStorageManagerMethod.deleteOrigin.name,
          'Clear storage for a specific origin',
          _getManagerMethodPlatforms(
            CygnusPlatformWebStorageManagerMethod.deleteOrigin.name,
          ),
          _promptDeleteOrigin,
        ),
        _buildManagerMethodSection(
          CygnusPlatformWebStorageManagerMethod.getQuotaForOrigin.name,
          'Get storage quota for an origin (bytes)',
          _getManagerMethodPlatforms(
            CygnusPlatformWebStorageManagerMethod.getQuotaForOrigin.name,
          ),
          _getQuotaForOrigin,
        ),
        _buildManagerMethodSection(
          CygnusPlatformWebStorageManagerMethod.getUsageForOrigin.name,
          'Get storage usage for an origin (bytes)',
          _getManagerMethodPlatforms(
            CygnusPlatformWebStorageManagerMethod.getUsageForOrigin.name,
          ),
          _getUsageForOrigin,
        ),
        _buildManagerMethodSection(
          CygnusPlatformWebStorageManagerMethod.fetchDataRecords.name,
          'Fetch website data records',
          _getManagerMethodPlatforms(
            CygnusPlatformWebStorageManagerMethod.fetchDataRecords.name,
          ),
          _fetchDataRecords,
        ),
        _buildManagerMethodSection(
          CygnusPlatformWebStorageManagerMethod.removeDataModifiedSince.name,
          'Remove data modified since a date',
          _getManagerMethodPlatforms(
            CygnusPlatformWebStorageManagerMethod.removeDataModifiedSince.name,
          ),
          _removeDataModifiedSince,
        ),
        const SizedBox(height: 16),
        _buildOriginsList(),
        const SizedBox(height: 16),
        _buildDataRecordsList(),
      ],
    );
  }

  Widget _buildManagerMethodSection(
    String methodName,
    String description,
    Set<SupportedPlatform> supportedPlatforms,
    VoidCallback? onPressed,
  ) {
    final historyKey = '$CygnusWebStorageManager.$methodName';
    return MethodTile(
      methodName: methodName,
      description: description,
      supportedPlatforms: supportedPlatforms,
      onRun: !_isLoading ? onPressed : null,
      historyEntries: _methodHistory[historyKey],
      selectedHistoryIndex: _selectedHistoryIndex[historyKey],
      onHistorySelected: (index) {
        setState(() => _selectedHistoryIndex[historyKey] = index);
      },
    );
  }

  Widget _buildOriginsList() {
    if (_webStorageOrigins.isEmpty) {
      return EmptyStateCard(
        icon: Icons.public_outlined,
        title: 'No origins fetched',
        description:
            'Click "${CygnusPlatformWebStorageManagerMethod.getOrigins.name}" to fetch storage origins',
        iconSize: 48,
      );
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Origins (${_webStorageOrigins.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _isLoading ? null : _getOrigins,
                  tooltip: 'Refresh',
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _webStorageOrigins.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final origin = _webStorageOrigins[index];
              return ListTile(
                title: Text(
                  origin.origin ?? 'Unknown',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Quota: ${origin.quota ?? 'N/A'} bytes, Usage: ${origin.usage ?? 'N/A'} bytes',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  onPressed: () => _deleteOrigin(origin.origin ?? ''),
                  tooltip: 'Delete Origin',
                  color: Colors.red,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDataRecordsList() {
    if (_dataRecords.isEmpty) {
      return EmptyStateCard(
        icon: Icons.folder_outlined,
        title: 'No data records fetched',
        description:
            'Click "${CygnusPlatformWebStorageManagerMethod.fetchDataRecords.name}" to fetch website data records',
        iconSize: 48,
      );
    }

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  'Data Records (${_dataRecords.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _isLoading ? null : _fetchDataRecords,
                  tooltip: 'Refresh',
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _dataRecords.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final record = _dataRecords[index];
              final dataTypesStr =
                  record.dataTypes?.map((t) => t.toNativeValue()).join(', ') ??
                  'Unknown';
              return ListTile(
                title: Text(
                  record.displayName ?? 'Unknown',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Types: $dataTypesStr',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete_outline, size: 20),
                  onPressed: () => _removeDataForRecord(record),
                  tooltip: 'Remove Data',
                  color: Colors.red,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
