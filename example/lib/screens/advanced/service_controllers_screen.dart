import 'package:flutter/material.dart';
import 'package:cygnus_core/cygnus_core.dart';
import 'package:cygnus_core_example/widgets/common/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:cygnus_core_example/providers/event_log_provider.dart';
import 'package:cygnus_core_example/models/event_log_entry.dart';
import 'package:cygnus_core_example/utils/support_checker.dart';
import 'package:cygnus_core_example/widgets/common/support_badge.dart';
import 'package:cygnus_core_example/widgets/common/parameter_dialog.dart';
import 'package:cygnus_core_example/widgets/common/method_result_history.dart';
import 'package:cygnus_core_example/providers/settings_manager.dart';
import 'package:cygnus_core_example/widgets/common/profile_selector_card.dart';
import 'package:cygnus_core_example/utils/responsive_utils.dart';
import 'package:cygnus_core_example/widgets/common/responsive_row.dart';

/// Screen for testing service-level controllers
class ServiceControllersScreen extends StatefulWidget {
  const ServiceControllersScreen({super.key});

  @override
  State<ServiceControllersScreen> createState() =>
      _ServiceControllersScreenState();
}

class _ServiceControllersScreenState extends State<ServiceControllersScreen> {
  bool _isLoading = false;

  // CygnusServiceWorkerController state
  bool _allowContentAccess = true;
  bool _allowFileAccess = true;
  bool _blockNetworkLoads = false;
  CygnusCacheMode? _cacheMode = CygnusCacheMode.LOAD_DEFAULT;

  // CygnusProxyController state
  final TextEditingController _proxyHostController = TextEditingController(
    text: '127.0.0.1',
  );
  final TextEditingController _proxyPortController = TextEditingController(
    text: '8080',
  );
  final TextEditingController _bypassListController = TextEditingController();

  // CygnusTracingController state
  bool _isTracing = false;

  // CygnusWebViewEnvironment state
  String? _availableVersion;
  List<CygnusBrowserProcessInfo> _processInfos = [];
  int _lastEnvironmentRevision = -1;

  // CygnusProcessGlobalConfig state
  final TextEditingController _dataDirSuffixController = TextEditingController(
    text: 'test_suffix',
  );

  final Map<String, List<MethodResultEntry>> _methodHistory = {};
  final Map<String, int> _selectedHistoryIndex = {};
  static const int _maxHistoryEntries = 3;

  Set<SupportedPlatform> _mergePlatforms(
    Set<SupportedPlatform> first,
    Set<SupportedPlatform> second,
  ) {
    return {...first, ...second};
  }

  Set<SupportedPlatform> _serviceWorkerPlatforms(
    CygnusPlatformServiceWorkerControllerMethod method,
  ) {
    return SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusServiceWorkerController.isMethodSupported,
    );
  }

  Set<SupportedPlatform> _proxyControllerPlatforms(
    CygnusPlatformProxyControllerMethod method,
  ) {
    return SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusProxyController.isMethodSupported,
    );
  }

  Set<SupportedPlatform> _tracingControllerPlatforms(
    CygnusPlatformTracingControllerMethod method,
  ) {
    return SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusTracingController.isMethodSupported,
    );
  }

  Set<SupportedPlatform> _webViewEnvironmentPlatforms(
    CygnusPlatformWebViewEnvironmentMethod method,
  ) {
    return SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusWebViewEnvironment.isMethodSupported,
    );
  }

  Set<SupportedPlatform> _processGlobalConfigPlatforms(
    CygnusPlatformProcessGlobalConfigMethod method,
  ) {
    return SupportCheckHelper.supportedPlatformsForMethod(
      method: method,
      checker: CygnusProcessGlobalConfig.isMethodSupported,
    );
  }

  @override
  void dispose() {
    _proxyHostController.dispose();
    _proxyPortController.dispose();
    _bypassListController.dispose();
    _dataDirSuffixController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final settingsManager = context.watch<SettingsManager>();
    if (_lastEnvironmentRevision != settingsManager.environmentRevision) {
      _lastEnvironmentRevision = settingsManager.environmentRevision;
      setState(() {
        _processInfos = [];
        _availableVersion = null;
      });
    }
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

  CygnusTracingMode _parseTracingMode(String? value) {
    if (value == null || value.isEmpty) {
      return CygnusTracingMode.RECORD_CONTINUOUSLY;
    }
    return CygnusTracingMode.values.firstWhere(
      (mode) => mode.name().toLowerCase() == value.toLowerCase(),
      orElse: () => CygnusTracingMode.RECORD_CONTINUOUSLY,
    );
  }

  List<CygnusTracingCategory> _parseTracingCategories(dynamic raw) {
    if (raw is! List) {
      return [CygnusTracingCategory.CATEGORIES_WEB_DEVELOPER];
    }
    final categories = <CygnusTracingCategory>[];
    for (final entry in raw) {
      final name = entry.toString().toLowerCase();
      final matched = CygnusTracingCategory.values.firstWhere(
        (category) => category.name().toLowerCase() == name,
        orElse: () => CygnusTracingCategory.CATEGORIES_WEB_DEVELOPER,
      );
      categories.add(matched);
    }
    return categories.isEmpty
        ? [CygnusTracingCategory.CATEGORIES_WEB_DEVELOPER]
        : categories;
  }

  // CygnusServiceWorkerController methods
  Future<void> _getAllowContentAccess() async {
    setState(() => _isLoading = true);
    try {
      final value = await CygnusServiceWorkerController.getAllowContentAccess();
      setState(() => _allowContentAccess = value);
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.getAllowContentAccess.name,
        'Allow content access: $value',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.getAllowContentAccess.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _setAllowContentAccess(bool value) async {
    setState(() => _isLoading = true);
    try {
      await CygnusServiceWorkerController.setAllowContentAccess(value);
      setState(() => _allowContentAccess = value);
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.setAllowContentAccess.name,
        'Allow content access set to: $value',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.setAllowContentAccess.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getAllowFileAccess() async {
    setState(() => _isLoading = true);
    try {
      final value = await CygnusServiceWorkerController.getAllowFileAccess();
      setState(() => _allowFileAccess = value);
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.getAllowFileAccess.name,
        'Allow file access: $value',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.getAllowFileAccess.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _setAllowFileAccess(bool value) async {
    setState(() => _isLoading = true);
    try {
      await CygnusServiceWorkerController.setAllowFileAccess(value);
      setState(() => _allowFileAccess = value);
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.setAllowFileAccess.name,
        'Allow file access set to: $value',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.setAllowFileAccess.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getBlockNetworkLoads() async {
    setState(() => _isLoading = true);
    try {
      final value = await CygnusServiceWorkerController.getBlockNetworkLoads();
      setState(() => _blockNetworkLoads = value);
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.getBlockNetworkLoads.name,
        'Block network loads: $value',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.getBlockNetworkLoads.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _setBlockNetworkLoads(bool value) async {
    setState(() => _isLoading = true);
    try {
      await CygnusServiceWorkerController.setBlockNetworkLoads(value);
      setState(() => _blockNetworkLoads = value);
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.setBlockNetworkLoads.name,
        'Block network loads set to: $value',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.setBlockNetworkLoads.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getCacheMode() async {
    setState(() => _isLoading = true);
    try {
      final value = await CygnusServiceWorkerController.getCacheMode();
      setState(() => _cacheMode = value);
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.getCacheMode.name,
        'Cache mode: ${value?.name}',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.getCacheMode.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _setCacheMode(CygnusCacheMode mode) async {
    setState(() => _isLoading = true);
    try {
      await CygnusServiceWorkerController.setCacheMode(mode);
      setState(() => _cacheMode = mode);
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.setCacheMode.name,
        'Cache mode set to: ${mode.name}',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformServiceWorkerControllerMethod.setCacheMode.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // CygnusProxyController methods
  Future<void> _setProxyOverride() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Set Proxy Override',
      parameters: {
        'host': _proxyHostController.text.trim(),
        'port': int.tryParse(_proxyPortController.text.trim()) ?? 8080,
        'bypassList': _bypassListController.text
            .split(',')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList(),
      },
      requiredPaths: ['host', 'port'],
    );

    if (params == null) return;
    final host = params['host']?.toString() ?? '';
    final port = (params['port'] as num?)?.toInt() ?? 8080;
    final bypassList =
        (params['bypassList'] as List?)
            ?.map((e) => e.toString().trim())
            .where((e) => e.isNotEmpty)
            .toList() ??
        [];

    _proxyHostController.text = host;
    _proxyPortController.text = port.toString();
    _bypassListController.text = bypassList.join(', ');

    setState(() => _isLoading = true);
    try {
      await CygnusProxyController.instance().setProxyOverride(
        settings: CygnusProxySettings(
          proxyRules: [CygnusProxyRule(url: '$host:$port')],
          bypassRules: bypassList,
        ),
      );
      _recordMethodResult(
        CygnusPlatformProxyControllerMethod.setProxyOverride.name,
        'Proxy override set',
        isError: false,
      );
      _logEvent(
        EventType.network,
        'Proxy set',
        data: {'host': host, 'port': port, 'bypassList': bypassList},
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformProxyControllerMethod.setProxyOverride.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _clearProxyOverride() async {
    setState(() => _isLoading = true);
    try {
      await CygnusProxyController.instance().clearProxyOverride();
      _recordMethodResult(
        CygnusPlatformProxyControllerMethod.clearProxyOverride.name,
        'Proxy override cleared',
        isError: false,
      );
      _logEvent(EventType.network, 'Proxy cleared');
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformProxyControllerMethod.clearProxyOverride.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // CygnusTracingController methods
  Future<void> _startTracing() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Start Tracing',
      parameters: {
        'tracingMode': 'RECORD_CONTINUOUSLY',
        'categories': ['CATEGORIES_WEB_DEVELOPER'],
      },
      requiredPaths: ['tracingMode'],
    );

    if (params == null) return;
    final tracingMode = _parseTracingMode(params['tracingMode']?.toString());
    final categories = _parseTracingCategories(params['categories']);

    setState(() => _isLoading = true);
    try {
      await CygnusTracingController.instance().start(
        settings: CygnusTracingSettings(
          tracingMode: tracingMode,
          categories: categories,
        ),
      );
      setState(() => _isTracing = true);
      _recordMethodResult(
        CygnusPlatformTracingControllerMethod.start.name,
        'Tracing started',
        isError: false,
      );
      _logEvent(EventType.performance, 'Tracing started');
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformTracingControllerMethod.start.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _stopTracing() async {
    setState(() => _isLoading = true);
    try {
      final result = await CygnusTracingController.instance().stop();
      setState(() => _isTracing = false);
      _recordMethodResult(
        CygnusPlatformTracingControllerMethod.stop.name,
        'Tracing stopped: $result',
        isError: false,
      );
      _logEvent(
        EventType.performance,
        'Tracing stopped',
        data: {'result': result},
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformTracingControllerMethod.stop.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _checkIsTracing() async {
    setState(() => _isLoading = true);
    try {
      final tracing = await CygnusTracingController.instance().isTracing();
      setState(() => _isTracing = tracing);
      _recordMethodResult(
        CygnusPlatformTracingControllerMethod.isTracing.name,
        'Is tracing: $tracing',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformTracingControllerMethod.isTracing.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // CygnusWebViewEnvironment methods
  Future<void> _createWebViewEnvironment() async {
    setState(() => _isLoading = true);
    try {
      await context.read<SettingsManager>().recreateEnvironment();
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.create.name,
        '$CygnusWebViewEnvironment created',
        isError: false,
      );
      _logEvent(EventType.ui, '$CygnusWebViewEnvironment created');
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.create.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getAvailableVersion() async {
    setState(() => _isLoading = true);
    try {
      final version = await CygnusWebViewEnvironment.getAvailableVersion();
      setState(() => _availableVersion = version);
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.getAvailableVersion.name,
        'Available version: $version',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.getAvailableVersion.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _compareBrowserVersions() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Compare Browser Versions',
      parameters: {'version1': '100.0.0.0', 'version2': '99.0.0.0'},
      requiredPaths: ['version1', 'version2'],
    );

    if (params == null) return;
    final version1 = params['version1']?.toString() ?? '';
    final version2 = params['version2']?.toString() ?? '';
    if (version1.isEmpty || version2.isEmpty) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.compareBrowserVersions.name,
        'Both versions are required',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final result = await CygnusWebViewEnvironment.compareBrowserVersions(
        version1: version1,
        version2: version2,
      );
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.compareBrowserVersions.name,
        'Compare versions: $result (positive = v1 > v2, negative = v1 < v2)',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.compareBrowserVersions.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getProcessInfos() async {
    final environment = context.read<SettingsManager>().webViewEnvironment;
    if (environment == null) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.getProcessInfos.name,
        'Create or select $CygnusWebViewEnvironment first',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final infos = await environment.getProcessInfos();
      setState(() => _processInfos = infos);
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.getProcessInfos.name,
        'Found ${infos.length} processes',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.getProcessInfos.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _getFailureReportFolderPath() async {
    final environment = context.read<SettingsManager>().webViewEnvironment;
    if (environment == null) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.getFailureReportFolderPath.name,
        'Create or select $CygnusWebViewEnvironment first',
        isError: true,
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final path = await environment.getFailureReportFolderPath();
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.getFailureReportFolderPath.name,
        'Failure report folder: $path',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.getFailureReportFolderPath.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _disposeWebViewEnvironment() async {
    setState(() => _isLoading = true);
    try {
      await context.read<SettingsManager>().disposeEnvironment();
      setState(() => _processInfos = []);
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.dispose.name,
        '$CygnusWebViewEnvironment disposed',
        isError: false,
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformWebViewEnvironmentMethod.dispose.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  // CygnusProcessGlobalConfig methods
  Future<void> _applyProcessGlobalConfig() async {
    final params = await showParameterDialog(
      context: context,
      title: 'Apply Process Global Config',
      parameters: {'dataDirectorySuffix': _dataDirSuffixController.text.trim()},
      requiredPaths: ['dataDirectorySuffix'],
    );

    if (params == null) return;
    final suffix = params['dataDirectorySuffix']?.toString() ?? '';
    if (suffix.isEmpty) {
      _recordMethodResult(
        CygnusPlatformProcessGlobalConfigMethod.apply.name,
        'Please enter a data directory suffix',
        isError: true,
      );
      return;
    }
    _dataDirSuffixController.text = suffix;

    setState(() => _isLoading = true);
    try {
      await CygnusProcessGlobalConfig.instance().apply(
        settings: CygnusProcessGlobalConfigSettings(dataDirectorySuffix: suffix),
      );
      _recordMethodResult(
        CygnusPlatformProcessGlobalConfigMethod.apply.name,
        '$CygnusProcessGlobalConfig applied',
        isError: false,
      );
      _logEvent(
        EventType.ui,
        '$CygnusProcessGlobalConfig applied',
        data: {'dataDirectorySuffix': suffix},
      );
    } catch (e) {
      _recordMethodResult(
        CygnusPlatformProcessGlobalConfigMethod.apply.name,
        'Error: $e',
        isError: true,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Controllers'),
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
          ProfileSelectorCard(
            onEditSettingsProfile: () =>
                Navigator.pushNamed(context, '/settings'),
          ),
          const SizedBox(height: 16),
          _buildServiceWorkerSection(),
          const SizedBox(height: 16),
          _buildProxyControllerSection(),
          const SizedBox(height: 16),
          _buildTracingControllerSection(),
          const SizedBox(height: 16),
          _buildWebViewEnvironmentSection(),
          const SizedBox(height: 16),
          _buildProcessGlobalConfigSection(),
          const SizedBox(height: 16),
          _buildEventLog(),
        ],
      ),
    );
  }

  Widget _buildServiceWorkerSection() {
    final supportedPlatforms = SupportChecker.getSupportedPlatformsForClass(
      '$CygnusServiceWorkerController',
    );

    return Card(
      child: ExpansionTile(
        title: Row(
          children: [
            Text(
              '$CygnusServiceWorkerController',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SupportBadgesRow(
                  supportedPlatforms: supportedPlatforms,
                  compact: true,
                ),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Boolean settings
                _buildSwitchRow(
                  'Allow Content Access',
                  _allowContentAccess,
                  (value) => _setAllowContentAccess(value),
                  _getAllowContentAccess,
                  _mergePlatforms(
                    _serviceWorkerPlatforms(
                      CygnusPlatformServiceWorkerControllerMethod
                          .getAllowContentAccess,
                    ),
                    _serviceWorkerPlatforms(
                      CygnusPlatformServiceWorkerControllerMethod
                          .setAllowContentAccess,
                    ),
                  ),
                  getMethodName: CygnusPlatformServiceWorkerControllerMethod
                      .getAllowContentAccess
                      .name,
                  setMethodName: CygnusPlatformServiceWorkerControllerMethod
                      .setAllowContentAccess
                      .name,
                ),
                _buildSwitchRow(
                  'Allow File Access',
                  _allowFileAccess,
                  (value) => _setAllowFileAccess(value),
                  _getAllowFileAccess,
                  _mergePlatforms(
                    _serviceWorkerPlatforms(
                      CygnusPlatformServiceWorkerControllerMethod.getAllowFileAccess,
                    ),
                    _serviceWorkerPlatforms(
                      CygnusPlatformServiceWorkerControllerMethod.setAllowFileAccess,
                    ),
                  ),
                  getMethodName: CygnusPlatformServiceWorkerControllerMethod
                      .getAllowFileAccess
                      .name,
                  setMethodName: CygnusPlatformServiceWorkerControllerMethod
                      .setAllowFileAccess
                      .name,
                ),
                _buildSwitchRow(
                  'Block Network Loads',
                  _blockNetworkLoads,
                  (value) => _setBlockNetworkLoads(value),
                  _getBlockNetworkLoads,
                  _mergePlatforms(
                    _serviceWorkerPlatforms(
                      CygnusPlatformServiceWorkerControllerMethod
                          .getBlockNetworkLoads,
                    ),
                    _serviceWorkerPlatforms(
                      CygnusPlatformServiceWorkerControllerMethod
                          .setBlockNetworkLoads,
                    ),
                  ),
                  getMethodName: CygnusPlatformServiceWorkerControllerMethod
                      .getBlockNetworkLoads
                      .name,
                  setMethodName: CygnusPlatformServiceWorkerControllerMethod
                      .setBlockNetworkLoads
                      .name,
                ),
                const Divider(),

                // Cache mode dropdown
                Row(
                  children: [
                    const Text('Cache Mode:'),
                    const SizedBox(width: 16),
                    Expanded(
                      child: DropdownButton<CygnusCacheMode>(
                        value: _cacheMode,
                        isExpanded: true,
                        items: CygnusCacheMode.values
                            .map(
                              (mode) => DropdownMenuItem(
                                value: mode,
                                child: Text(
                                  mode.name(),
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (mode) {
                          if (mode != null) {
                            _setCacheMode(mode);
                          }
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh, size: 20),
                      onPressed: _getCacheMode,
                      tooltip: 'Get current',
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                SupportBadgesRow(
                  supportedPlatforms: _mergePlatforms(
                    _serviceWorkerPlatforms(
                      CygnusPlatformServiceWorkerControllerMethod.getCacheMode,
                    ),
                    _serviceWorkerPlatforms(
                      CygnusPlatformServiceWorkerControllerMethod.setCacheMode,
                    ),
                  ),
                  compact: true,
                ),
                const SizedBox(height: 6),
                _buildMethodHistory(
                  CygnusPlatformServiceWorkerControllerMethod.getCacheMode.name,
                  title:
                      CygnusPlatformServiceWorkerControllerMethod.getCacheMode.name,
                ),
                _buildMethodHistory(
                  CygnusPlatformServiceWorkerControllerMethod.setCacheMode.name,
                  title:
                      CygnusPlatformServiceWorkerControllerMethod.setCacheMode.name,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchRow(
    String label,
    bool value,
    Function(bool) onChanged,
    VoidCallback onRefresh,
    Set<SupportedPlatform> supportedPlatforms, {
    required String getMethodName,
    required String setMethodName,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = ResponsiveBreakpoints.isMobileWidth(
              constraints.maxWidth,
            );
            final controls = Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Switch(value: value, onChanged: onChanged),
                IconButton(
                  icon: const Icon(Icons.refresh, size: 20),
                  onPressed: onRefresh,
                  tooltip: 'Get current',
                ),
              ],
            );

            return ResponsiveRow(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isMobile ? Text(label) : Expanded(child: Text(label)),
                controls,
              ],
            );
          },
        ),
        SupportBadgesRow(supportedPlatforms: supportedPlatforms, compact: true),
        const SizedBox(height: 6),
        _buildMethodHistory(setMethodName, title: setMethodName),
        _buildMethodHistory(getMethodName, title: getMethodName),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildProxyControllerSection() {
    final supportedPlatforms = SupportChecker.getSupportedPlatformsForClass(
      '$CygnusProxyController',
    );

    return Card(
      child: ExpansionTile(
        title: Row(
          children: [
            Text(
              '$CygnusProxyController',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SupportBadgesRow(
                  supportedPlatforms: supportedPlatforms,
                  compact: true,
                ),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = ResponsiveBreakpoints.isMobileWidth(
                      constraints.maxWidth,
                    );
                    final hostField = TextField(
                      controller: _proxyHostController,
                      decoration: const InputDecoration(
                        labelText: 'Host',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    );
                    final portField = TextField(
                      controller: _proxyPortController,
                      decoration: const InputDecoration(
                        labelText: 'Port',
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      keyboardType: TextInputType.number,
                    );

                    return ResponsiveRow(
                      rowKey: const Key('service_controllers_proxy_row'),
                      columnKey: const Key('service_controllers_proxy_column'),
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMobile
                            ? hostField
                            : Expanded(flex: 2, child: hostField),
                        isMobile ? portField : Expanded(child: portField),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _bypassListController,
                  decoration: const InputDecoration(
                    labelText: 'Bypass List (comma-separated)',
                    hintText: 'localhost, 127.0.0.1',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 12),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = ResponsiveBreakpoints.isMobileWidth(
                      constraints.maxWidth,
                    );
                    final setButton = _buildMethodButton(
                      'Set Proxy',
                      _setProxyOverride,
                      supportedPlatforms: _proxyControllerPlatforms(
                        CygnusPlatformProxyControllerMethod.setProxyOverride,
                      ),
                      methodName:
                          CygnusPlatformProxyControllerMethod.setProxyOverride.name,
                    );
                    final clearButton = _buildMethodButton(
                      'Clear Proxy',
                      _clearProxyOverride,
                      supportedPlatforms: _proxyControllerPlatforms(
                        CygnusPlatformProxyControllerMethod.clearProxyOverride,
                      ),
                      methodName:
                          CygnusPlatformProxyControllerMethod.clearProxyOverride.name,
                    );

                    return ResponsiveRow(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMobile ? setButton : Expanded(child: setButton),
                        isMobile ? clearButton : Expanded(child: clearButton),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTracingControllerSection() {
    final supportedPlatforms = SupportChecker.getSupportedPlatformsForClass(
      '$CygnusTracingController',
    );

    return Card(
      child: ExpansionTile(
        title: Row(
          children: [
            Text(
              '$CygnusTracingController',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SupportBadgesRow(
                  supportedPlatforms: supportedPlatforms,
                  compact: true,
                ),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Status indicator
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _isTracing
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _isTracing ? Icons.fiber_manual_record : Icons.stop,
                        color: _isTracing ? Colors.red : Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _isTracing ? 'Tracing Active' : 'Tracing Stopped',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _isTracing ? Colors.green : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Control buttons
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = ResponsiveBreakpoints.isMobileWidth(
                      constraints.maxWidth,
                    );
                    final startButton = _buildMethodButton(
                      'Start',
                      !_isTracing ? _startTracing : null,
                      supportedPlatforms: _tracingControllerPlatforms(
                        CygnusPlatformTracingControllerMethod.start,
                      ),
                      methodName: CygnusPlatformTracingControllerMethod.start.name,
                    );
                    final stopButton = _buildMethodButton(
                      'Stop',
                      _isTracing ? _stopTracing : null,
                      supportedPlatforms: _tracingControllerPlatforms(
                        CygnusPlatformTracingControllerMethod.stop,
                      ),
                      methodName: CygnusPlatformTracingControllerMethod.stop.name,
                    );
                    final statusButton = _buildMethodButton(
                      'Is Tracing',
                      _checkIsTracing,
                      supportedPlatforms: _tracingControllerPlatforms(
                        CygnusPlatformTracingControllerMethod.isTracing,
                      ),
                      methodName:
                          CygnusPlatformTracingControllerMethod.isTracing.name,
                    );

                    return ResponsiveRow(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMobile ? startButton : Expanded(child: startButton),
                        isMobile ? stopButton : Expanded(child: stopButton),
                        isMobile ? statusButton : Expanded(child: statusButton),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWebViewEnvironmentSection() {
    final settingsManager = context.watch<SettingsManager>();
    final environment = settingsManager.webViewEnvironment;
    final supportedPlatforms = SupportChecker.getSupportedPlatformsForClass(
      '$CygnusWebViewEnvironment',
    );

    return Card(
      child: ExpansionTile(
        title: Row(
          children: [
            Text(
              '$CygnusWebViewEnvironment',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SupportBadgesRow(
                  supportedPlatforms: supportedPlatforms,
                  compact: true,
                ),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Environment status
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: environment != null
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        environment != null ? Icons.check_circle : Icons.cancel,
                        color: environment != null ? Colors.green : Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              environment != null
                                  ? 'Environment Active'
                                  : 'No Environment',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (environment != null)
                              Text(
                                'ID: ${environment.id}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            if (_availableVersion != null)
                              Text(
                                'Version: $_availableVersion',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Create/Dispose buttons
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = ResponsiveBreakpoints.isMobileWidth(
                      constraints.maxWidth,
                    );
                    final createButton = _buildMethodButton(
                      'Create',
                      environment == null ? _createWebViewEnvironment : null,
                      supportedPlatforms: _webViewEnvironmentPlatforms(
                        CygnusPlatformWebViewEnvironmentMethod.create,
                      ),
                      methodName: CygnusPlatformWebViewEnvironmentMethod.create.name,
                    );
                    final disposeButton = _buildMethodButton(
                      'Dispose',
                      environment != null ? _disposeWebViewEnvironment : null,
                      supportedPlatforms: _webViewEnvironmentPlatforms(
                        CygnusPlatformWebViewEnvironmentMethod.dispose,
                      ),
                      methodName: CygnusPlatformWebViewEnvironmentMethod.dispose.name,
                    );

                    return ResponsiveRow(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMobile ? createButton : Expanded(child: createButton),
                        isMobile
                            ? disposeButton
                            : Expanded(child: disposeButton),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),

                // Static methods
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = ResponsiveBreakpoints.isMobileWidth(
                      constraints.maxWidth,
                    );
                    final versionButton = _buildMethodButton(
                      'Get Version',
                      _getAvailableVersion,
                      supportedPlatforms: _webViewEnvironmentPlatforms(
                        CygnusPlatformWebViewEnvironmentMethod.getAvailableVersion,
                      ),
                      methodName: CygnusPlatformWebViewEnvironmentMethod
                          .getAvailableVersion
                          .name,
                    );
                    final compareButton = _buildMethodButton(
                      'Compare Versions',
                      _compareBrowserVersions,
                      supportedPlatforms: _webViewEnvironmentPlatforms(
                        CygnusPlatformWebViewEnvironmentMethod.compareBrowserVersions,
                      ),
                      methodName: CygnusPlatformWebViewEnvironmentMethod
                          .compareBrowserVersions
                          .name,
                    );

                    return ResponsiveRow(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMobile
                            ? versionButton
                            : Expanded(child: versionButton),
                        isMobile
                            ? compareButton
                            : Expanded(child: compareButton),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),

                // Instance methods
                LayoutBuilder(
                  builder: (context, constraints) {
                    final isMobile = ResponsiveBreakpoints.isMobileWidth(
                      constraints.maxWidth,
                    );
                    final processesButton = _buildMethodButton(
                      'Get Processes',
                      environment != null ? _getProcessInfos : null,
                      supportedPlatforms: _webViewEnvironmentPlatforms(
                        CygnusPlatformWebViewEnvironmentMethod.getProcessInfos,
                      ),
                      methodName:
                          CygnusPlatformWebViewEnvironmentMethod.getProcessInfos.name,
                    );
                    final failureButton = _buildMethodButton(
                      'Failure Folder',
                      environment != null ? _getFailureReportFolderPath : null,
                      supportedPlatforms: _webViewEnvironmentPlatforms(
                        CygnusPlatformWebViewEnvironmentMethod
                            .getFailureReportFolderPath,
                      ),
                      methodName: CygnusPlatformWebViewEnvironmentMethod
                          .getFailureReportFolderPath
                          .name,
                    );

                    return ResponsiveRow(
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isMobile
                            ? processesButton
                            : Expanded(child: processesButton),
                        isMobile
                            ? failureButton
                            : Expanded(child: failureButton),
                      ],
                    );
                  },
                ),

                // Process list
                if (_processInfos.isNotEmpty) ...[
                  const SizedBox(height: 12),
                  const Text(
                    'Process Infos:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: ListView.builder(
                      itemCount: _processInfos.length,
                      itemBuilder: (context, index) {
                        final info = _processInfos[index];
                        return ListTile(
                          dense: true,
                          title: Text('Process ${index + 1}'),
                          subtitle: Text('Kind: ${info.kind.name()}'),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProcessGlobalConfigSection() {
    final supportedPlatforms = SupportChecker.getSupportedPlatformsForClass(
      '$CygnusProcessGlobalConfig',
    );

    return Card(
      child: ExpansionTile(
        title: Row(
          children: [
            Text(
              '$CygnusProcessGlobalConfig',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SupportBadgesRow(
                  supportedPlatforms: supportedPlatforms,
                  compact: true,
                ),
              ),
            ),
          ],
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isMobile = ResponsiveBreakpoints.isMobileWidth(
                        constraints.maxWidth,
                      );
                      final noteText = Text(
                        'Note: $CygnusProcessGlobalConfig can only be applied once, before any WebView is created.',
                        style: const TextStyle(fontSize: 12),
                      );

                      return ResponsiveRow(
                        spacing: 8,
                        runSpacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.warning,
                            color: Colors.orange,
                            size: 20,
                          ),
                          isMobile ? noteText : Expanded(child: noteText),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _dataDirSuffixController,
                  decoration: const InputDecoration(
                    labelText: 'Data Directory Suffix',
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: _buildMethodButton(
                    'Apply Config',
                    _applyProcessGlobalConfig,
                    supportedPlatforms: _processGlobalConfigPlatforms(
                      CygnusPlatformProcessGlobalConfigMethod.apply,
                    ),
                    methodName: CygnusPlatformProcessGlobalConfigMethod.apply.name,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMethodButton(
    String label,
    VoidCallback? onPressed, {
    Set<SupportedPlatform>? supportedPlatforms,
    String? methodName,
  }) {
    final canPress = onPressed != null && !_isLoading;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: canPress ? onPressed : null,
          child: Text(label, style: const TextStyle(fontSize: 12)),
        ),
        if (supportedPlatforms != null) ...[
          const SizedBox(height: 6),
          SupportBadgesRow(
            supportedPlatforms: supportedPlatforms,
            compact: true,
          ),
        ],
        if (methodName != null) ...[
          const SizedBox(height: 6),
          _buildMethodHistory(methodName, title: methodName),
        ],
      ],
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
                final events = provider.events.reversed.take(15).toList();
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
                  height: 150,
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
