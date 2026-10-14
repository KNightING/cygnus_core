import 'types/main.dart';

///Class that represents a set of rules to use block content in the browser window.
///
///On iOS and MacOS, it uses [WKContentRuleListStore](https://developer.apple.com/documentation/webkit/wkcontentruleliststore).
///On Android, it uses a custom implementation because such functionality doesn't exist.
///
///In general, this [article](https://developer.apple.com/documentation/safariservices/creating_a_content_blocker) can be used to get an overview about this functionality
///but on Android there are two types of [action] that are unavailable: `block-cookies` and `ignore-previous-rules`.
class CygnusContentBlocker {
  ///Trigger of the content blocker. The trigger tells to the WebView when to perform the corresponding action.
  CygnusContentBlockerTrigger trigger;

  ///Action associated to the trigger. The action tells to the WebView what to do when the trigger is matched.
  CygnusContentBlockerAction action;

  CygnusContentBlocker({required this.trigger, required this.action});

  Map<String, Map<String, dynamic>> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "trigger": trigger.toMap(enumMethod: enumMethod),
      "action": action.toMap(enumMethod: enumMethod),
    };
  }

  static CygnusContentBlocker fromMap(
    Map<dynamic, Map<dynamic, dynamic>> map, {
    CygnusEnumMethod? enumMethod,
  }) {
    return CygnusContentBlocker(
      trigger: CygnusContentBlockerTrigger.fromMap(
        Map<String, dynamic>.from(map["trigger"]!),
        enumMethod: enumMethod,
      ),
      action: CygnusContentBlockerAction.fromMap(
        Map<String, dynamic>.from(map["action"]!),
        enumMethod: enumMethod,
      ),
    );
  }

  @override
  String toString() {
    return 'CygnusContentBlocker{trigger: $trigger, action: $action}';
  }
}

///Trigger of the content blocker. The trigger tells to the WebView when to perform the corresponding action.
///A trigger dictionary must include an [CygnusContentBlockerTrigger.urlFilter], which specifies a pattern to match the URL against.
///The remaining properties are optional and modify the behavior of the trigger.
///For example, you can limit the trigger to specific domains or have it not apply when a match is found on a specific domain.
class CygnusContentBlockerTrigger {
  ///A regular expression pattern to match the URL against.
  String urlFilter;

  ///A list of regular expressions to match iframes URL against.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  List<String> ifFrameUrl;

  ///A Boolean value indicating if the URL matching should be case-sensitive.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  bool urlFilterIsCaseSensitive;

  ///A list of [CygnusContentBlockerTriggerResourceType] representing the resource types
  ///(how the browser intends to use the resource) that the rule should match.
  ///If not specified, the rule matches all resource types.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  List<CygnusContentBlockerTriggerResourceType> resourceType;

  ///A list of strings matched to a URL's domain; limits action to a list of specific domains.
  ///Values must be lowercase ASCII, or punycode for non-ASCII.
  ///Add * in front to match domain and subdomains. Can't be used with [CygnusContentBlockerTrigger.unlessDomain].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  List<String> ifDomain;

  ///A list of strings matched to a URL's domain; acts on any site except domains in a provided list.
  ///Values must be lowercase ASCII, or punycode for non-ASCII.
  ///Add * in front to match domain and subdomains. Can't be used with [CygnusContentBlockerTrigger.ifDomain].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  List<String> unlessDomain;

  ///A list of [CygnusContentBlockerTriggerLoadType] that can include one of two mutually exclusive values.
  ///If not specified, the rule matches all load types.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  List<CygnusContentBlockerTriggerLoadType> loadType;

  ///A list of strings matched to the entire main document URL; limits the action to a specific list of URL patterns.
  ///Values must be lowercase ASCII, or punycode for non-ASCII. Can't be used with [CygnusContentBlockerTrigger.unlessTopUrl].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  List<String> ifTopUrl;

  ///An array of strings matched to the entire main document URL; acts on any site except URL patterns in provided list.
  ///Values must be lowercase ASCII, or punycode for non-ASCII. Can't be used with [CygnusContentBlockerTrigger.ifTopUrl].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android native WebView
  ///- iOS
  ///- MacOS
  List<String> unlessTopUrl;

  ///An array of strings that specify loading contexts.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS
  ///- MacOS
  List<CygnusContentBlockerTriggerLoadContext> loadContext;

  CygnusContentBlockerTrigger({
    required this.urlFilter,
    this.ifFrameUrl = const <String>[],
    this.urlFilterIsCaseSensitive = false,
    this.resourceType = const <CygnusContentBlockerTriggerResourceType>[],
    this.ifDomain = const <String>[],
    this.unlessDomain = const <String>[],
    this.loadType = const <CygnusContentBlockerTriggerLoadType>[],
    this.ifTopUrl = const <String>[],
    this.unlessTopUrl = const <String>[],
    this.loadContext = const <CygnusContentBlockerTriggerLoadContext>[],
  }) {
    assert(!(this.ifDomain.isEmpty || this.unlessDomain.isEmpty) == false);
    assert(this.loadType.length <= 2);
    assert(!(this.ifTopUrl.isEmpty || this.unlessTopUrl.isEmpty) == false);
  }

  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    List<String> resourceTypeStringList = [];
    resourceType.forEach((type) {
      switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        case CygnusEnumMethod.nativeValue:
          if (type.isSupported()) {
            resourceTypeStringList.add(type.toNativeValue()!);
          }
          break;
        case CygnusEnumMethod.value:
          resourceTypeStringList.add(type.toValue());
          break;
        case CygnusEnumMethod.name:
          resourceTypeStringList.add(type.name());
          break;
      }
    });
    List<String> loadTypeStringList = [];
    loadType.forEach((type) {
      switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        case CygnusEnumMethod.nativeValue:
          if (type.isSupported()) {
            loadTypeStringList.add(type.toNativeValue()!);
          }
          break;
        case CygnusEnumMethod.value:
          loadTypeStringList.add(type.toValue());
          break;
        case CygnusEnumMethod.name:
          loadTypeStringList.add(type.name());
          break;
      }
    });
    List<String> loadContextStringList = [];
    loadContext.forEach((type) {
      switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        case CygnusEnumMethod.nativeValue:
          if (type.isSupported()) {
            loadContextStringList.add(type.toNativeValue()!);
          }
          break;
        case CygnusEnumMethod.value:
          loadContextStringList.add(type.toValue());
          break;
        case CygnusEnumMethod.name:
          loadContextStringList.add(type.name());
          break;
      }
    });

    Map<String, dynamic> map = {
      "url-filter": urlFilter,
      "if-frame-url": ifFrameUrl,
      "url-filter-is-case-sensitive": urlFilterIsCaseSensitive,
      "if-domain": ifDomain,
      "unless-domain": unlessDomain,
      "resource-type": resourceTypeStringList,
      "load-type": loadTypeStringList,
      "if-top-url": ifTopUrl,
      "unless-top-url": unlessTopUrl,
      "load-context": loadContextStringList,
    };

    map.keys
        .where(
          (key) =>
              map[key] == null ||
              (map[key] is List && (map[key] as List).length == 0),
        ) // filter keys
        .toList() // create a copy to avoid concurrent modifications
        .forEach(map.remove);

    return map;
  }

  static CygnusContentBlockerTrigger fromMap(
    Map<String, dynamic> map, {
    CygnusEnumMethod? enumMethod,
  }) {
    List<CygnusContentBlockerTriggerResourceType> resourceType = [];
    List<CygnusContentBlockerTriggerLoadType> loadType = [];
    List<CygnusContentBlockerTriggerLoadContext> loadContext = [];

    List<String> resourceTypeStringList = List<String>.from(
      map["resource-type"] ?? [],
    );
    resourceTypeStringList.forEach((typeValue) {
      var type = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusContentBlockerTriggerResourceType.fromNativeValue(typeValue),
        CygnusEnumMethod.value => CygnusContentBlockerTriggerResourceType.fromValue(
          typeValue,
        ),
        CygnusEnumMethod.name => CygnusContentBlockerTriggerResourceType.byName(typeValue),
      };
      if (type != null) {
        resourceType.add(type);
      }
    });

    List<String> loadTypeStringList = List<String>.from(map["load-type"] ?? []);
    loadTypeStringList.forEach((typeValue) {
      var type = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusContentBlockerTriggerLoadType.fromNativeValue(
          typeValue,
        ),
        CygnusEnumMethod.value => CygnusContentBlockerTriggerLoadType.fromValue(typeValue),
        CygnusEnumMethod.name => CygnusContentBlockerTriggerLoadType.byName(typeValue),
      };
      if (type != null) {
        loadType.add(type);
      }
    });

    List<String> loadContextStringList = List<String>.from(
      map["load-context"] ?? [],
    );
    loadContextStringList.forEach((typeValue) {
      var context = switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusContentBlockerTriggerLoadContext.fromNativeValue(typeValue),
        CygnusEnumMethod.value => CygnusContentBlockerTriggerLoadContext.fromValue(
          typeValue,
        ),
        CygnusEnumMethod.name => CygnusContentBlockerTriggerLoadContext.byName(typeValue),
      };
      if (context != null) {
        loadContext.add(context);
      }
    });

    return CygnusContentBlockerTrigger(
      urlFilter: map["url-filter"],
      ifFrameUrl: List<String>.from(map["if-frame-url"] ?? []),
      urlFilterIsCaseSensitive: map["url-filter-is-case-sensitive"],
      ifDomain: List<String>.from(map["if-domain"] ?? []),
      unlessDomain: List<String>.from(map["unless-domain"] ?? []),
      resourceType: resourceType,
      loadType: loadType,
      ifTopUrl: List<String>.from(map["if-top-url"] ?? []),
      unlessTopUrl: List<String>.from(map["unless-top-url"] ?? []),
      loadContext: loadContext,
    );
  }

  @override
  String toString() {
    return 'CygnusContentBlockerTrigger{urlFilter: $urlFilter, ifFrameUrl: $ifFrameUrl, urlFilterIsCaseSensitive: $urlFilterIsCaseSensitive, resourceType: $resourceType, ifDomain: $ifDomain, unlessDomain: $unlessDomain, loadType: $loadType, ifTopUrl: $ifTopUrl, unlessTopUrl: $unlessTopUrl, loadContext: $loadContext}';
  }
}

///Action associated to the trigger. The action tells to the WebView what to do when the trigger is matched.
///When a trigger matches a resource, the browser queues the associated action for execution.
///The WebView evaluates all the triggers, it executes the actions in order.
///When a domain matches a trigger, all rules after the triggered rule that specify the same action are skipped.
///Group the rules with similar actions together to improve performance.
class CygnusContentBlockerAction {
  ///Type of the action.
  CygnusContentBlockerActionType type;

  ///If the action type is [CygnusContentBlockerActionType.CSS_DISPLAY_NONE], then also the [selector] property is required, otherwise it is ignored.
  ///It specify a string that defines a selector list. Use CSS identifiers as the individual selector values, separated by commas.
  String? selector;

  CygnusContentBlockerAction({required this.type, this.selector}) {
    if (this.type == CygnusContentBlockerActionType.CSS_DISPLAY_NONE) {
      assert(this.selector != null);
    }
  }

  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    Map<String, dynamic> map = {
      "type": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => type.toNativeValue(),
        CygnusEnumMethod.value => type.toValue(),
        CygnusEnumMethod.name => type.name(),
      },
      "selector": selector,
    };

    map.keys
        .where(
          (key) =>
              map[key] == null ||
              (map[key] is List && (map[key] as List).length == 0),
        ) // filter keys
        .toList() // create a copy to avoid concurrent modifications
        .forEach(map.remove);

    return map;
  }

  static CygnusContentBlockerAction fromMap(
    Map<String, dynamic> map, {
    CygnusEnumMethod? enumMethod,
  }) {
    return CygnusContentBlockerAction(
      type: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusContentBlockerActionType.fromNativeValue(
          map["type"],
        ),
        CygnusEnumMethod.value => CygnusContentBlockerActionType.fromValue(map["type"]),
        CygnusEnumMethod.name => CygnusContentBlockerActionType.byName(map["type"]),
      }!,
      selector: map["selector"],
    );
  }

  @override
  String toString() {
    return 'CygnusContentBlockerAction{type: $type, selector: $selector}';
  }
}
