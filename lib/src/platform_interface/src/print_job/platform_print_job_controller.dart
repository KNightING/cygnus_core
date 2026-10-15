import 'package:flutter/foundation.dart';
import 'package:cygnus_core_internal_annotations/cygnus_core_internal_annotations.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../webview/platform_webview_controller.dart';
import '../webview_platform.dart';
import '../types/disposable.dart';
import '../types/print_job_info.dart';

// ignore: uri_has_not_been_generated
part 'platform_print_job_controller.g.dart';

///{@template cygnus_core.CygnusPlatformPrintJobControllerCreationParams}
/// Object specifying creation parameters for creating a [CygnusPlatformPrintJobController].
///
/// Platform specific implementations can add additional fields by extending
/// this class.
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformPrintJobControllerCreationParams.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WindowsPlatform(),
  ],
)
@immutable
class CygnusPlatformPrintJobControllerCreationParams {
  /// Used by the platform implementation to create a new [CygnusPlatformPrintJobController].
  const CygnusPlatformPrintJobControllerCreationParams({required this.id});

  ///{@template cygnus_core.CygnusPlatformPrintJobControllerCreationParams.id}
  ///Print job ID.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobControllerCreationParams.id.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
    ],
  )
  final String id;

  ///{@template cygnus_core.CygnusPlatformPrintJobControllerCreationParams.isClassSupported}
  ///Check if the current class is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isClassSupported({TargetPlatform? platform}) =>
      _CygnusPlatformPrintJobControllerCreationParamsClassSupported.isClassSupported(
        platform: platform,
      );

  ///{@template cygnus_core.CygnusPlatformPrintJobControllerCreationParams.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isPropertySupported(
    CygnusPlatformPrintJobControllerCreationParamsProperty property, {
    TargetPlatform? platform,
  }) =>
      _CygnusPlatformPrintJobControllerCreationParamsPropertySupported.isPropertySupported(
        property,
        platform: platform,
      );
}

///A completion handler for the [CygnusPlatformPrintJobController].
typedef CygnusPrintJobCompletionHandler =
    Future<void> Function(bool completed, String? error)?;

///{@template cygnus_core.CygnusPlatformPrintJobController}
///Class representing a print job eventually returned by [CygnusPlatformWebViewController.printCurrentPage].
///{@endtemplate}
///
///{@macro cygnus_core.CygnusPlatformPrintJobController.supported_platforms}
@SupportedPlatforms(
  platforms: [
    AndroidPlatform(),
    IOSPlatform(),
    MacOSPlatform(),
    WindowsPlatform(),
  ],
)
abstract class CygnusPlatformPrintJobController extends PlatformInterface
    implements CygnusDisposable {
  /// Creates a new [CygnusPlatformPrintJobController]
  factory CygnusPlatformPrintJobController(
    CygnusPlatformPrintJobControllerCreationParams params,
  ) {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`CygnusWebViewPlatform.instance` before use. For unit testing, '
      '`CygnusWebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformPrintJobController printJobController = CygnusWebViewPlatform
        .instance!
        .createPlatformPrintJobController(params);
    PlatformInterface.verify(printJobController, _token);
    return printJobController;
  }

  /// Creates a new empty [CygnusPlatformPrintJobController] to access static methods.
  factory CygnusPlatformPrintJobController.static() {
    assert(
      CygnusWebViewPlatform.instance != null,
      'A platform implementation for `cygnus` has not been set. Please '
      'ensure that an implementation of `CygnusWebViewPlatform` has been set to '
      '`WebViewPlatform.instance` before use. For unit testing, '
      '`WebViewPlatform.instance` can be set with your own test implementation.',
    );
    final CygnusPlatformPrintJobController printJobControllerStatic =
        CygnusWebViewPlatform.instance!.createPlatformPrintJobControllerStatic();
    PlatformInterface.verify(printJobControllerStatic, _token);
    return printJobControllerStatic;
  }

  /// Used by the platform implementation to create a new [CygnusPlatformPrintJobController].
  ///
  /// Should only be used by platform implementations because they can't extend
  /// a class that only contains a factory constructor.
  @protected
  CygnusPlatformPrintJobController.implementation(this.params) : super(token: _token);

  static final Object _token = Object();

  /// The parameters used to initialize the [CygnusPlatformPrintJobController].
  final CygnusPlatformPrintJobControllerCreationParams params;

  ///{@macro cygnus_core.CygnusPlatformPrintJobControllerCreationParams.id}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobControllerCreationParams.id.supported_platforms}
  String get id => params.id;

  ///{@template cygnus_core.CygnusPlatformPrintJobController.onComplete}
  ///A completion handler used to handle the conclusion of the print job (for instance, to reset state) and to handle any errors encountered in printing.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.onComplete.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'PrintDocumentAdapter.onFinish',
        apiUrl:
            'https://developer.android.com/reference/android/print/PrintDocumentAdapter#onFinish()',
        note: '`completed` is always `true` and `error` is always `null`.',
      ),
      IOSPlatform(
        apiName: 'UIPrintInteractionController.CompletionHandler',
        apiUrl:
            'https://developer.apple.com/documentation/uikit/uiprintinteractioncontroller/completionhandler',
      ),
      MacOSPlatform(
        apiName: 'NSPrintOperation.runModal',
        apiUrl:
            'https://developer.apple.com/documentation/appkit/nsprintoperation/1532065-runmodal',
      ),
      WindowsPlatform(),
    ],
  )
  CygnusPrintJobCompletionHandler? onComplete;

  ///{@template cygnus_core.CygnusPlatformPrintJobController.cancel}
  ///Cancels this print job.
  ///You can request cancellation of a queued, started, blocked, or failed print job.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.cancel.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'PrintJob.cancel',
        apiUrl:
            'https://developer.android.com/reference/android/print/PrintJob#cancel()',
      ),
    ],
  )
  Future<void> cancel() {
    throw UnimplementedError(
      'cancel is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPrintJobController.restart}
  ///Restarts this print job.
  ///You can request restart of a failed print job.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.restart.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'PrintJob.restart',
        apiUrl:
            'https://developer.android.com/reference/android/print/PrintJob#restart()',
      ),
    ],
  )
  Future<void> restart() {
    throw UnimplementedError(
      'restart is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPrintJobController.dismiss}
  ///Dismisses the printing-options sheet or popover.
  ///
  ///You should dismiss the printing options when they are presented in a sheet or
  ///animated from a rectangle and the user changes the orientation of the device.
  ///(This, of course, assumes your application responds to orientation changes.)
  ///You should then present the printing options again once the new orientation takes effect.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.dismiss.supported_platforms}
  @SupportedPlatforms(platforms: [IOSPlatform()])
  Future<void> dismiss({bool animated = true}) {
    throw UnimplementedError(
      'dismiss is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPrintJobController.getInfo}
  ///Gets the [CygnusPrintJobInfo] that describes this job.
  ///
  ///**NOTE**: The returned info object is a snapshot of the
  ///current print job state. Every call to this method returns a fresh
  ///info object that reflects the current print job state.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.getInfo.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(
        apiName: 'PrintJob.getInfo',
        apiUrl:
            'https://developer.android.com/reference/android/print/PrintJob#getInfo()',
      ),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
    ],
  )
  Future<CygnusPrintJobInfo?> getInfo() {
    throw UnimplementedError(
      'getInfo is not implemented on the current platform',
    );
  }

  ///{@template cygnus_core.CygnusPlatformPrintJobController.dispose}
  ///Disposes the print job.
  ///{@endtemplate}
  ///
  ///{@macro cygnus_core.CygnusPlatformPrintJobController.dispose.supported_platforms}
  @SupportedPlatforms(
    platforms: [
      AndroidPlatform(),
      IOSPlatform(),
      MacOSPlatform(),
      WindowsPlatform(),
    ],
  )
  @override
  void dispose() {
    throw UnimplementedError(
      'dispose is not implemented on the current platform',
    );
  }

  ///{@macro cygnus_core.CygnusPlatformPrintJobControllerCreationParams.isClassSupported}
  bool isClassSupported({TargetPlatform? platform}) =>
      params.isClassSupported(platform: platform);

  ///{@template cygnus_core.CygnusPlatformPrintJobController.isPropertySupported}
  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///The property should be one of the [CygnusPlatformPrintJobControllerProperty] or [CygnusPlatformPrintJobControllerCreationParamsProperty] values.
  ///{@endtemplate}
  bool isPropertySupported(dynamic property, {TargetPlatform? platform}) =>
      property is CygnusPlatformPrintJobControllerCreationParamsProperty
      ? params.isPropertySupported(property, platform: platform)
      : _CygnusPlatformPrintJobControllerPropertySupported.isPropertySupported(
          property,
          platform: platform,
        );

  ///{@template cygnus_core.CygnusPlatformPrintJobController.isMethodSupported}
  ///Check if the given [method] is supported by the [defaultTargetPlatform] or a specific [platform].
  ///{@endtemplate}
  bool isMethodSupported(
    CygnusPlatformPrintJobControllerMethod method, {
    TargetPlatform? platform,
  }) => _CygnusPlatformPrintJobControllerMethodSupported.isMethodSupported(
    method,
    platform: platform,
  );
}
