// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'window_style_mask.dart';

// **************************************************************************
// ExchangeableEnumGenerator
// **************************************************************************

///Class that represents the flags that describe the browser window’s current style, such as if it’s resizable or in full-screen mode.
class CygnusWindowStyleMask {
  final int _value;
  final int? _nativeValue;
  const CygnusWindowStyleMask._internal(this._value, this._nativeValue);
  // ignore: unused_element
  factory CygnusWindowStyleMask._internalMultiPlatform(
    int value,
    Function nativeValue,
  ) => CygnusWindowStyleMask._internal(value, nativeValue());

  ///The window displays none of the usual peripheral elements. Useful only for display or caching purposes.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.borderless](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644698-borderless))
  static final BORDERLESS = CygnusWindowStyleMask._internalMultiPlatform(0, () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        return 0;
      default:
        break;
    }
    return null;
  });

  ///The window displays a close button.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.closable](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644610-closable))
  static final CLOSABLE = CygnusWindowStyleMask._internalMultiPlatform(2, () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        return 2;
      default:
        break;
    }
    return null;
  });

  ///The window is a document-modal panel.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.docModalWindow](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644253-docmodalwindow))
  static final DOC_MODAL_WINDOW = CygnusWindowStyleMask._internalMultiPlatform(
    64,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 64;
        default:
          break;
      }
      return null;
    },
  );

  ///The window can appear full screen. A fullscreen window does not draw its title bar, and may have special handling for its toolbar.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.fullScreen](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644530-fullscreen))
  static final FULLSCREEN = CygnusWindowStyleMask._internalMultiPlatform(
    16384,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 16384;
        default:
          break;
      }
      return null;
    },
  );

  ///When set, the window’s contentView consumes the full size of the window.
  ///Although you can combine this constant with other window style masks, it is respected only for windows with a title bar.
  ///Note that using this mask opts in to layer-backing.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.fullSizeContentView](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644646-fullsizecontentview))
  static final FULL_SIZE_CONTENT_VIEW =
      CygnusWindowStyleMask._internalMultiPlatform(32768, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.macOS:
            return 32768;
          default:
            break;
        }
        return null;
      });

  ///The window is a HUD panel.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.hudWindow](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644653-hudwindow))
  static final HUD_WINDOW = CygnusWindowStyleMask._internalMultiPlatform(
    8192,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 8192;
        default:
          break;
      }
      return null;
    },
  );

  ///The window displays a minimize button.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.miniaturizable](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644650-miniaturizable))
  static final MINIATURIZABLE = CygnusWindowStyleMask._internalMultiPlatform(
    4,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 4;
        default:
          break;
      }
      return null;
    },
  );

  ///The window is a panel that does not activate the owning app.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.nonactivatingPanel](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644696-nonactivatingpanel))
  static final NONACTIVATING_PANEL =
      CygnusWindowStyleMask._internalMultiPlatform(128, () {
        switch (defaultTargetPlatform) {
          case TargetPlatform.macOS:
            return 128;
          default:
            break;
        }
        return null;
      });

  ///The window can be resized by the user.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.miniaturizable](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644717-resizable))
  static final RESIZABLE = CygnusWindowStyleMask._internalMultiPlatform(8, () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        return 8;
      default:
        break;
    }
    return null;
  });

  ///The window displays a title bar.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.titled](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644724-titled))
  static final TITLED = CygnusWindowStyleMask._internalMultiPlatform(1, () {
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
        return 1;
      default:
        break;
    }
    return null;
  });

  ///The window is a panel.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView ([Official API - NSWindow.StyleMask.utilityWindow](https://developer.apple.com/documentation/appkit/nswindow/stylemask/1644672-utilitywindow))
  static final UTILITY_WINDOW = CygnusWindowStyleMask._internalMultiPlatform(
    16,
    () {
      switch (defaultTargetPlatform) {
        case TargetPlatform.macOS:
          return 16;
        default:
          break;
      }
      return null;
    },
  );

  ///Set of all values of [CygnusWindowStyleMask].
  static final Set<CygnusWindowStyleMask> values = [
    CygnusWindowStyleMask.BORDERLESS,
    CygnusWindowStyleMask.CLOSABLE,
    CygnusWindowStyleMask.DOC_MODAL_WINDOW,
    CygnusWindowStyleMask.FULLSCREEN,
    CygnusWindowStyleMask.FULL_SIZE_CONTENT_VIEW,
    CygnusWindowStyleMask.HUD_WINDOW,
    CygnusWindowStyleMask.MINIATURIZABLE,
    CygnusWindowStyleMask.NONACTIVATING_PANEL,
    CygnusWindowStyleMask.RESIZABLE,
    CygnusWindowStyleMask.TITLED,
    CygnusWindowStyleMask.UTILITY_WINDOW,
  ].toSet();

  ///Gets a possible [CygnusWindowStyleMask] instance from [int] value.
  static CygnusWindowStyleMask? fromValue(int? value) {
    if (value != null) {
      try {
        return CygnusWindowStyleMask.values.firstWhere(
          (element) => element.toValue() == value,
        );
      } catch (e) {
        return CygnusWindowStyleMask._internal(value, value);
      }
    }
    return null;
  }

  ///Gets a possible [CygnusWindowStyleMask] instance from a native value.
  static CygnusWindowStyleMask? fromNativeValue(int? value) {
    if (value != null) {
      try {
        return CygnusWindowStyleMask.values.firstWhere(
          (element) => element.toNativeValue() == value,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Gets a possible [CygnusWindowStyleMask] instance value with name [name].
  ///
  /// Goes through [CygnusWindowStyleMask.values] looking for a value with
  /// name [name], as reported by [CygnusWindowStyleMask.name].
  /// Returns the first value with the given name, otherwise `null`.
  static CygnusWindowStyleMask? byName(String? name) {
    if (name != null) {
      try {
        return CygnusWindowStyleMask.values.firstWhere(
          (element) => element.name() == name,
        );
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  /// Creates a map from the names of [CygnusWindowStyleMask] values to the values.
  ///
  /// The collection that this method is called on is expected to have
  /// values with distinct names, like the `values` list of an enum class.
  /// Only one value for each name can occur in the created map,
  /// so if two or more values have the same name (either being the
  /// same value, or being values of different enum type), at most one of
  /// them will be represented in the returned map.
  static Map<String, CygnusWindowStyleMask> asNameMap() =>
      <String, CygnusWindowStyleMask>{
        for (final value in CygnusWindowStyleMask.values) value.name(): value,
      };

  ///Gets [int] value.
  int toValue() => _value;

  ///Gets [int] native value if supported by the current platform, otherwise `null`.
  int? toNativeValue() => _nativeValue;

  ///Gets the name of the value.
  String name() {
    switch (_value) {
      case 0:
        return 'BORDERLESS';
      case 2:
        return 'CLOSABLE';
      case 64:
        return 'DOC_MODAL_WINDOW';
      case 16384:
        return 'FULLSCREEN';
      case 32768:
        return 'FULL_SIZE_CONTENT_VIEW';
      case 8192:
        return 'HUD_WINDOW';
      case 4:
        return 'MINIATURIZABLE';
      case 128:
        return 'NONACTIVATING_PANEL';
      case 8:
        return 'RESIZABLE';
      case 1:
        return 'TITLED';
      case 16:
        return 'UTILITY_WINDOW';
    }
    return _value.toString();
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  bool operator ==(value) => value == _value;

  CygnusWindowStyleMask operator |(CygnusWindowStyleMask value) =>
      CygnusWindowStyleMask._internal(
        value.toValue() | _value,
        value.toNativeValue() != null && _nativeValue != null
            ? value.toNativeValue()! | _nativeValue!
            : null,
      );

  ///Checks if the value is supported by the [defaultTargetPlatform].
  bool isSupported() {
    return _nativeValue != null;
  }

  @override
  String toString() {
    return name();
  }
}
