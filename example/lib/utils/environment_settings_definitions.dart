import 'package:cygnus_core/cygnus_core.dart';
import 'package:cygnus_core_example/models/environment_setting_definition.dart';

List<T> _safeEnumValues<T>(Iterable<T> Function() getter) {
  try {
    return getter().toList();
  } catch (_) {
    return <T>[];
  }
}

/// Get all environment setting definitions organized by category.
Map<String, List<EnvironmentSettingDefinition>>
getEnvironmentSettingDefinitions() {
  return {
    'General': [
      EnvironmentSettingDefinition(
        name: 'Browser Executable Folder',
        description:
            'Path to the folder containing the WebView2 browser executable',
        type: EnvironmentSettingType.string,
        hint: 'C:\\Program Files (x86)\\Microsoft\\Edge WebView2\\...',
        property: CygnusWebViewEnvironmentSettingsProperty.browserExecutableFolder,
      ),
      EnvironmentSettingDefinition(
        name: 'User Data Folder',
        description: 'Path to the user data folder for WebView2 profile',
        type: EnvironmentSettingType.string,
        hint: 'C:\\Users\\...\\AppData\\Local\\...',
        property: CygnusWebViewEnvironmentSettingsProperty.userDataFolder,
      ),
      EnvironmentSettingDefinition(
        name: 'Additional Browser Arguments',
        description: 'Additional command line arguments for the browser',
        type: EnvironmentSettingType.string,
        hint: '--disable-gpu --enable-logging',
        property: CygnusWebViewEnvironmentSettingsProperty.additionalBrowserArguments,
      ),
      EnvironmentSettingDefinition(
        name: 'Target Compatible Browser Version',
        description: 'Minimum WebView2 version required',
        type: EnvironmentSettingType.string,
        hint: '100.0.0.0',
        property:
            CygnusWebViewEnvironmentSettingsProperty.targetCompatibleBrowserVersion,
      ),
    ],
    'Release Channel': [
      EnvironmentSettingDefinition(
        name: 'Channel Search Kind',
        description: 'How to search for WebView2 runtime',
        type: EnvironmentSettingType.enumeration,
        enumValues: _safeEnumValues(() => CygnusEnvironmentChannelSearchKind.values),
        property: CygnusWebViewEnvironmentSettingsProperty.channelSearchKind,
      ),
      EnvironmentSettingDefinition(
        name: 'Release Channels',
        description: 'Which release channels to consider',
        type: EnvironmentSettingType.enumeration,
        enumValues: _safeEnumValues(() => CygnusEnvironmentReleaseChannels.values),
        property: CygnusWebViewEnvironmentSettingsProperty.releaseChannels,
      ),
    ],
    'Localization': [
      EnvironmentSettingDefinition(
        name: 'Language',
        description: 'Default language for the WebView',
        type: EnvironmentSettingType.string,
        hint: 'en-US',
        property: CygnusWebViewEnvironmentSettingsProperty.language,
      ),
      EnvironmentSettingDefinition(
        name: 'Preferred Languages',
        description: 'List of preferred languages',
        type: EnvironmentSettingType.stringList,
        hint: 'en-US, fr-FR, de-DE',
        property: CygnusWebViewEnvironmentSettingsProperty.preferredLanguages,
      ),
      EnvironmentSettingDefinition(
        name: 'Time Zone Override',
        description: 'Override the default time zone',
        type: EnvironmentSettingType.string,
        hint: 'America/New_York',
        property: CygnusWebViewEnvironmentSettingsProperty.timeZoneOverride,
      ),
    ],
    'Spellcheck': [
      EnvironmentSettingDefinition(
        name: 'Spell Checking Enabled',
        description: 'Enable spell checking',
        type: EnvironmentSettingType.boolean,
        defaultValue: false,
        property: CygnusWebViewEnvironmentSettingsProperty.spellCheckingEnabled,
      ),
      EnvironmentSettingDefinition(
        name: 'Spell Checking Languages',
        description: 'Languages for spell checking',
        type: EnvironmentSettingType.stringList,
        hint: 'en_US, fr_FR',
        property: CygnusWebViewEnvironmentSettingsProperty.spellCheckingLanguages,
      ),
    ],
    'Extensions': [
      EnvironmentSettingDefinition(
        name: 'Browser Extensions Enabled',
        description: 'Enable browser extensions support',
        type: EnvironmentSettingType.boolean,
        defaultValue: false,
        property:
            CygnusWebViewEnvironmentSettingsProperty.areBrowserExtensionsEnabled,
      ),
      EnvironmentSettingDefinition(
        name: 'Web Process Extensions Directory',
        description: 'Path to web process extensions',
        type: EnvironmentSettingType.string,
        hint: '/path/to/extensions',
        property:
            CygnusWebViewEnvironmentSettingsProperty.webProcessExtensionsDirectory,
      ),
    ],
    'Security & Privacy': [
      EnvironmentSettingDefinition(
        name: 'Allow SSO with OS Account',
        description: 'Allow single sign-on using the OS primary account (AAD)',
        type: EnvironmentSettingType.boolean,
        defaultValue: false,
        property: CygnusWebViewEnvironmentSettingsProperty
            .allowSingleSignOnUsingOSPrimaryAccount,
      ),
      EnvironmentSettingDefinition(
        name: 'Enable Tracking Prevention',
        description: 'Enable tracking prevention features',
        type: EnvironmentSettingType.boolean,
        defaultValue: true,
        property: CygnusWebViewEnvironmentSettingsProperty.enableTrackingPrevention,
      ),
      EnvironmentSettingDefinition(
        name: 'Exclusive User Data Folder Access',
        description: 'Ensure exclusive access to the user data folder',
        type: EnvironmentSettingType.boolean,
        defaultValue: false,
        property:
            CygnusWebViewEnvironmentSettingsProperty.exclusiveUserDataFolderAccess,
      ),
      EnvironmentSettingDefinition(
        name: 'CygnusSandbox Paths',
        description: 'Paths for sandbox isolation',
        type: EnvironmentSettingType.stringList,
        hint: '/path/to/sandbox',
        property: CygnusWebViewEnvironmentSettingsProperty.sandboxPaths,
      ),
    ],
    'Automation & Debugging': [
      EnvironmentSettingDefinition(
        name: 'Automation Allowed',
        description: 'Allow WebDriver automation',
        type: EnvironmentSettingType.boolean,
        defaultValue: false,
        property: CygnusWebViewEnvironmentSettingsProperty.automationAllowed,
      ),
      EnvironmentSettingDefinition(
        name: 'Custom Crash Reporting',
        description: 'Enable custom crash reporting',
        type: EnvironmentSettingType.boolean,
        defaultValue: false,
        property:
            CygnusWebViewEnvironmentSettingsProperty.isCustomCrashReportingEnabled,
      ),
    ],
    'Appearance': [
      EnvironmentSettingDefinition(
        name: 'Scrollbar Style',
        description: 'Style of scrollbars in the WebView',
        type: EnvironmentSettingType.enumeration,
        enumValues: _safeEnumValues(() => CygnusEnvironmentScrollbarStyle.values),
        property: CygnusWebViewEnvironmentSettingsProperty.scrollbarStyle,
      ),
    ],
    'Cache': [
      EnvironmentSettingDefinition(
        name: 'Cache Model',
        description: 'Caching strategy for the WebView',
        type: EnvironmentSettingType.enumeration,
        enumValues: _safeEnumValues(() => CygnusCacheModel.values),
        property: CygnusWebViewEnvironmentSettingsProperty.cacheModel,
      ),
    ],
    'Custom Schemes': [
      EnvironmentSettingDefinition(
        name: 'Custom Scheme Registrations',
        description: 'Register custom URL schemes',
        type: EnvironmentSettingType.customSchemeRegistrations,
        property: CygnusWebViewEnvironmentSettingsProperty.customSchemeRegistrations,
      ),
    ],
  };
}
