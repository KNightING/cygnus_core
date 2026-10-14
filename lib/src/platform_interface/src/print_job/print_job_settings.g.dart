// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'print_job_settings.dart';

// **************************************************************************
// ExchangeableObjectGenerator
// **************************************************************************

///Class that represents the settings of a [CygnusPlatformPrintJobController].
///
///**Officially Supported Platforms/Implementations**:
///- Android WebView
///- iOS WKWebView
///- macOS WKWebView
///- Windows WebView2
class CygnusPrintJobSettings {
  ///`true` to animate the display of the sheet, `false` to display the sheet immediately.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? animated;

  ///Whether the print operation should spawn a separate thread in which to run itself.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? canSpawnSeparateThread;

  ///Whether printed pages should be collated.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  bool? collate;

  ///The color mode.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- macOS WKWebView
  ///- Windows WebView2
  CygnusPrintJobColorMode? colorMode;

  ///How many copies to print.
  ///The default value is `1`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  int? copies;

  ///If `true`, produce detailed reports when an error occurs.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? detailedErrorReporting;

  ///The duplex mode to use for the print job.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 23+
  ///- iOS WKWebView
  ///- Windows WebView2
  CygnusPrintJobDuplexMode? duplexMode;

  ///A fax number.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  String? faxNumber;

  ///An integer value that specifies the first page in the print job.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  int? firstPage;

  ///The height of the page footer.
  ///
  ///The footer is measured in points from the bottom of [printableRect] and is below the content area.
  ///The default footer height is `0.0`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  double? footerHeight;

  ///The URI in the footer when [shouldPrintHeaderAndFooter] is `true`.
  ///The default value is the current URI.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  String? footerUri;

  ///Force rendering quality.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.5+
  CygnusPrintJobRenderingQuality? forceRenderingQuality;

  ///Set this to `true` to handle the [CygnusPlatformPrintJobController].
  ///Otherwise, it will be handled and disposed automatically by the system.
  ///The default value is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? handledByClient;

  ///If `true`, a standard header and footer are added outside the margins of each page.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  bool? headerAndFooter;

  ///The height of the page header.
  ///
  ///The header is measured in points from the top of [printableRect] and is above the content area.
  ///The default header height is `0.0`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  double? headerHeight;

  ///The title in the header when [shouldPrintHeaderAndFooter] is `true`.
  ///The default value is the title of the current document.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  String? headerTitle;

  ///The horizontal pagination mode.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  CygnusPrintJobPaginationMode? horizontalPagination;

  ///Indicates whether the image is centered horizontally.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? isHorizontallyCentered;

  ///Indicates whether the image is centered vertically.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? isVerticallyCentered;

  ///The action specified for the job.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  CygnusPrintJobDisposition? jobDisposition;

  ///The name of the print job.
  ///An application should set this property to a name appropriate to the content being printed.
  ///The default job name is the current webpage title concatenated with the "Document" word at the end.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  String? jobName;

  ///An URL containing the location to which the job file will be saved when the [jobDisposition] is [CygnusPrintJobDisposition.SAVE].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  CygnusWebUri? jobSavingURL;

  ///An integer value that specifies the last page in the print job.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  int? lastPage;

  ///The margins for each printed page.
  ///Margins define the white space around the content where the left margin defines
  ///the amount of white space on the left of the content and so on.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  EdgeInsets? margins;

  ///The maximum height of the content area.
  ///
  ///The Print Formatter uses this value to determine where the content rectangle begins on the first page.
  ///It compares the value of this property with the printing rectangle’s height minus the header and footer heights and
  ///the top inset value; it uses the lower of the two values.
  ///The default value of this property is the maximum float value.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  double? maximumContentHeight;

  ///The maximum width of the content area.
  ///
  ///The Print Formatter uses this value to determine the maximum width of the content rectangle.
  ///It compares the value of this property with the printing rectangle’s width minus the left and right inset values and uses the lower of the two.
  ///The default value of this property is the maximum float value.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  double? maximumContentWidth;

  ///The media size.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- Windows WebView2
  CygnusPrintJobMediaSize? mediaSize;

  ///If `true`, collates output.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? mustCollate;

  ///The number of pages to render.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  int? numberOfPages;

  ///The orientation of the printed content, portrait or landscape.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  CygnusPrintJobOrientation? orientation;

  ///The kind of printable content.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  CygnusPrintJobOutputType? outputType;

  ///The page height in inches.
  ///The default height is 11 inches.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  double? pageHeight;

  ///The print order for the pages of the operation.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  CygnusPrintJobPageOrder? pageOrder;

  ///The page ranges to print.
  ///Pages are specified as a comma-separated list of page ranges where each page range specifies
  ///a start and end inclusive page numbers. For example "1-5, 13, 17-19".
  ///Use an empty string to specify printing all the pages.
  ///The default value is empty string.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  String? pageRanges;

  ///The page width in inches.
  ///The default width is 8.5 inches.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  double? pageWidth;

  ///The number of logical pages to be tiled horizontally on a physical sheet of paper.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  int? pagesAcross;

  ///The number of logical pages to be tiled vertically on a physical sheet of paper.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  int? pagesDown;

  ///The number of pages to print on each sheet.
  ///The value must be 1, 2, 4, 6, 9, or 16.
  ///The default value is `1`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  int? pagesPerSide;

  ///The name of the currently selected paper size.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  String? paperName;

  ///The print dialog kind to show when [showUI] is `true`.
  ///The default value is [CygnusPrintJobDialogKind.BROWSER].
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  CygnusPrintJobDialogKind? printDialogKind;

  ///The name of the printer to use.
  ///Defaults to the user default printer.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  String? printerName;

  ///The supported resolution in DPI (dots per inch).
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  CygnusPrintJobResolution? resolution;

  ///The current scaling factor. From `0.0` to `1.0`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  double? scalingFactor;

  ///`true` if background colors and images should be printed.
  ///The default is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  bool? shouldPrintBackgrounds;

  ///`true` if header and footer should be printed.
  ///The default is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  bool? shouldPrintHeaderAndFooter;

  ///`true` if only the current selection of HTML in the document should be printed.
  ///The default is `false`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  bool? shouldPrintSelectionOnly;

  ///A Boolean value that determines whether the print UI should be shown.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  bool? showUI;

  ///A Boolean value that determines whether the printing options include the number of copies.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  bool? showsNumberOfCopies;

  ///A Boolean value that determines whether the Print panel includes a set of fields for manipulating the range of pages being printed.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? showsPageRange;

  ///A Boolean value that determines whether the Print panel includes a separate accessory view for manipulating the paper size, orientation, and scaling attributes.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? showsPageSetupAccessory;

  ///A Boolean value that determines whether the printing options include the paper orientation control when available.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+
  ///- macOS WKWebView
  bool? showsPaperOrientation;

  ///A Boolean value that determines whether the paper selection menu displays.
  ///The default value of this property is `false`.
  ///Setting the value to `true` enables a paper selection menu on printers that support different types of paper and have more than one paper type loaded.
  ///On printers where only one paper type is available, no paper selection menu is displayed, regardless of the value of this property.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  bool? showsPaperSelectionForLoadedPapers;

  ///A Boolean value that determines whether the print panel includes a control for manipulating the paper size of the printer.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? showsPaperSize;

  ///A Boolean value that determines whether the Print panel displays a built-in preview of the document contents.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? showsPreview;

  ///A Boolean value that determines whether the print operation displays a print panel.
  ///The default value is `true`.
  ///
  ///This property does not affect the display of a progress panel;
  ///that operation is controlled by the [showsProgressPanel] property.
  ///Operations that generate EPS or PDF data do no display a progress panel, regardless of the value in the flag parameter.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? showsPrintPanel;

  ///A Boolean value that determines whether the Print panel includes an additional selection option for paper range.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? showsPrintSelection;

  ///A Boolean value that determines whether the print operation displays a progress panel.
  ///The default value is `true`.
  ///
  ///This property does not affect the display of a print panel;
  ///that operation is controlled by the [showsPrintPanel] property.
  ///Operations that generate EPS or PDF data do no display a progress panel, regardless of the value in the flag parameter.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? showsProgressPanel;

  ///A Boolean value that determines whether the Print panel includes a control for scaling the printed output.
  ///The default value is `true`.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  bool? showsScaling;

  ///A timestamp that specifies the time at which printing should begin.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  int? time;

  ///The vertical pagination to the specified mode.
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  CygnusPrintJobPaginationMode? verticalPagination;

  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  CygnusPrintJobSettings({
    this.animated = true,
    this.canSpawnSeparateThread = true,
    this.collate,
    this.colorMode,
    this.copies = 1,
    this.detailedErrorReporting = false,
    this.duplexMode,
    this.faxNumber,
    this.firstPage,
    this.footerHeight,
    this.footerUri,
    this.forceRenderingQuality,
    this.handledByClient = false,
    this.headerAndFooter = true,
    this.headerHeight,
    this.headerTitle,
    this.horizontalPagination,
    this.isHorizontallyCentered = true,
    this.isVerticallyCentered = true,
    this.jobDisposition,
    this.jobName,
    this.jobSavingURL,
    this.lastPage,
    this.margins,
    this.maximumContentHeight,
    this.maximumContentWidth,
    this.mediaSize,
    this.mustCollate,
    this.numberOfPages,
    this.orientation,
    this.outputType,
    this.pageHeight,
    this.pageOrder,
    this.pageRanges,
    this.pageWidth,
    this.pagesAcross,
    this.pagesDown,
    this.pagesPerSide,
    this.paperName,
    CygnusPrintJobDialogKind? printDialogKind,
    this.printerName,
    this.resolution,
    this.scalingFactor,
    this.shouldPrintBackgrounds,
    this.shouldPrintHeaderAndFooter,
    this.shouldPrintSelectionOnly,
    this.showUI = true,
    this.showsNumberOfCopies = true,
    this.showsPageRange = true,
    this.showsPageSetupAccessory = true,
    this.showsPaperOrientation = true,
    this.showsPaperSelectionForLoadedPapers = false,
    this.showsPaperSize = true,
    this.showsPreview = true,
    this.showsPrintPanel = true,
    this.showsPrintSelection = true,
    this.showsProgressPanel = true,
    this.showsScaling = true,
    this.time,
    this.verticalPagination,
  }) : printDialogKind = printDialogKind ?? CygnusPrintJobDialogKind.BROWSER;

  ///Gets a possible [CygnusPrintJobSettings] instance from a [Map] value.
  static CygnusPrintJobSettings? fromMap(
    Map<String, dynamic>? map, {
    CygnusEnumMethod? enumMethod,
  }) {
    if (map == null) {
      return null;
    }
    final instance = CygnusPrintJobSettings(
      collate: map['collate'],
      colorMode: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusPrintJobColorMode.fromNativeValue(
          map['colorMode'],
        ),
        CygnusEnumMethod.value => CygnusPrintJobColorMode.fromValue(
          map['colorMode'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobColorMode.byName(
          map['colorMode'],
        ),
      },
      duplexMode: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusPrintJobDuplexMode.fromNativeValue(map['duplexMode']),
        CygnusEnumMethod.value => CygnusPrintJobDuplexMode.fromValue(
          map['duplexMode'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobDuplexMode.byName(
          map['duplexMode'],
        ),
      },
      faxNumber: map['faxNumber'],
      firstPage: map['firstPage'],
      footerHeight: map['footerHeight'],
      footerUri: map['footerUri'],
      forceRenderingQuality: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusPrintJobRenderingQuality.fromNativeValue(
            map['forceRenderingQuality'],
          ),
        CygnusEnumMethod.value => CygnusPrintJobRenderingQuality.fromValue(
          map['forceRenderingQuality'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobRenderingQuality.byName(
          map['forceRenderingQuality'],
        ),
      },
      headerHeight: map['headerHeight'],
      headerTitle: map['headerTitle'],
      horizontalPagination: switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusPrintJobPaginationMode.fromNativeValue(
            map['horizontalPagination'],
          ),
        CygnusEnumMethod.value => CygnusPrintJobPaginationMode.fromValue(
          map['horizontalPagination'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobPaginationMode.byName(
          map['horizontalPagination'],
        ),
      },
      jobDisposition: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusPrintJobDisposition.fromNativeValue(map['jobDisposition']),
        CygnusEnumMethod.value => CygnusPrintJobDisposition.fromValue(
          map['jobDisposition'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobDisposition.byName(
          map['jobDisposition'],
        ),
      },
      jobName: map['jobName'],
      jobSavingURL: map['jobSavingURL'] != null
          ? CygnusWebUri(map['jobSavingURL'])
          : null,
      lastPage: map['lastPage'],
      margins: MapEdgeInsets.fromMap(map['margins']?.cast<String, dynamic>()),
      maximumContentHeight: map['maximumContentHeight'],
      maximumContentWidth: map['maximumContentWidth'],
      mediaSize: CygnusPrintJobMediaSize.fromMap(
        map['mediaSize']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      mustCollate: map['mustCollate'],
      numberOfPages: map['numberOfPages'],
      orientation: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusPrintJobOrientation.fromNativeValue(map['orientation']),
        CygnusEnumMethod.value => CygnusPrintJobOrientation.fromValue(
          map['orientation'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobOrientation.byName(
          map['orientation'],
        ),
      },
      outputType: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusPrintJobOutputType.fromNativeValue(map['outputType']),
        CygnusEnumMethod.value => CygnusPrintJobOutputType.fromValue(
          map['outputType'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobOutputType.byName(
          map['outputType'],
        ),
      },
      pageHeight: map['pageHeight'],
      pageOrder: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => CygnusPrintJobPageOrder.fromNativeValue(
          map['pageOrder'],
        ),
        CygnusEnumMethod.value => CygnusPrintJobPageOrder.fromValue(
          map['pageOrder'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobPageOrder.byName(
          map['pageOrder'],
        ),
      },
      pageRanges: map['pageRanges'],
      pageWidth: map['pageWidth'],
      pagesAcross: map['pagesAcross'],
      pagesDown: map['pagesDown'],
      pagesPerSide: map['pagesPerSide'],
      paperName: map['paperName'],
      printerName: map['printerName'],
      resolution: CygnusPrintJobResolution.fromMap(
        map['resolution']?.cast<String, dynamic>(),
        enumMethod: enumMethod,
      ),
      scalingFactor: map['scalingFactor'],
      shouldPrintBackgrounds: map['shouldPrintBackgrounds'],
      shouldPrintHeaderAndFooter: map['shouldPrintHeaderAndFooter'],
      shouldPrintSelectionOnly: map['shouldPrintSelectionOnly'],
      time: map['time'],
      verticalPagination: switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue =>
          CygnusPrintJobPaginationMode.fromNativeValue(
            map['verticalPagination'],
          ),
        CygnusEnumMethod.value => CygnusPrintJobPaginationMode.fromValue(
          map['verticalPagination'],
        ),
        CygnusEnumMethod.name => CygnusPrintJobPaginationMode.byName(
          map['verticalPagination'],
        ),
      },
    );
    instance.animated = map['animated'];
    instance.canSpawnSeparateThread = map['canSpawnSeparateThread'];
    instance.copies = map['copies'];
    instance.detailedErrorReporting = map['detailedErrorReporting'];
    instance.handledByClient = map['handledByClient'];
    instance.headerAndFooter = map['headerAndFooter'];
    instance.isHorizontallyCentered = map['isHorizontallyCentered'];
    instance.isVerticallyCentered = map['isVerticallyCentered'];
    instance.printDialogKind = switch (enumMethod ??
        CygnusEnumMethod.nativeValue) {
      CygnusEnumMethod.nativeValue => CygnusPrintJobDialogKind.fromNativeValue(
        map['printDialogKind'],
      ),
      CygnusEnumMethod.value => CygnusPrintJobDialogKind.fromValue(
        map['printDialogKind'],
      ),
      CygnusEnumMethod.name => CygnusPrintJobDialogKind.byName(
        map['printDialogKind'],
      ),
    };
    instance.showUI = map['showUI'];
    instance.showsNumberOfCopies = map['showsNumberOfCopies'];
    instance.showsPageRange = map['showsPageRange'];
    instance.showsPageSetupAccessory = map['showsPageSetupAccessory'];
    instance.showsPaperOrientation = map['showsPaperOrientation'];
    instance.showsPaperSelectionForLoadedPapers =
        map['showsPaperSelectionForLoadedPapers'];
    instance.showsPaperSize = map['showsPaperSize'];
    instance.showsPreview = map['showsPreview'];
    instance.showsPrintPanel = map['showsPrintPanel'];
    instance.showsPrintSelection = map['showsPrintSelection'];
    instance.showsProgressPanel = map['showsProgressPanel'];
    instance.showsScaling = map['showsScaling'];
    return instance;
  }

  ///Check if the given [property] is supported by the [defaultTargetPlatform] or a specific [platform].
  static bool isPropertySupported(
    CygnusPrintJobSettingsProperty property, {
    TargetPlatform? platform,
  }) => _CygnusPrintJobSettingsPropertySupported.isPropertySupported(
    property,
    platform: platform,
  );

  ///Converts instance to a map.
  Map<String, dynamic> toMap({CygnusEnumMethod? enumMethod}) {
    return {
      "animated": animated,
      "canSpawnSeparateThread": canSpawnSeparateThread,
      "collate": collate,
      "colorMode": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => colorMode?.toNativeValue(),
        CygnusEnumMethod.value => colorMode?.toValue(),
        CygnusEnumMethod.name => colorMode?.name(),
      },
      "copies": copies,
      "detailedErrorReporting": detailedErrorReporting,
      "duplexMode": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => duplexMode?.toNativeValue(),
        CygnusEnumMethod.value => duplexMode?.toValue(),
        CygnusEnumMethod.name => duplexMode?.name(),
      },
      "faxNumber": faxNumber,
      "firstPage": firstPage,
      "footerHeight": footerHeight,
      "footerUri": footerUri,
      "forceRenderingQuality": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => forceRenderingQuality?.toNativeValue(),
        CygnusEnumMethod.value => forceRenderingQuality?.toValue(),
        CygnusEnumMethod.name => forceRenderingQuality?.name(),
      },
      "handledByClient": handledByClient,
      "headerAndFooter": headerAndFooter,
      "headerHeight": headerHeight,
      "headerTitle": headerTitle,
      "horizontalPagination": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => horizontalPagination?.toNativeValue(),
        CygnusEnumMethod.value => horizontalPagination?.toValue(),
        CygnusEnumMethod.name => horizontalPagination?.name(),
      },
      "isHorizontallyCentered": isHorizontallyCentered,
      "isVerticallyCentered": isVerticallyCentered,
      "jobDisposition": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => jobDisposition?.toNativeValue(),
        CygnusEnumMethod.value => jobDisposition?.toValue(),
        CygnusEnumMethod.name => jobDisposition?.name(),
      },
      "jobName": jobName,
      "jobSavingURL": jobSavingURL?.toString(),
      "lastPage": lastPage,
      "margins": margins?.toMap(),
      "maximumContentHeight": maximumContentHeight,
      "maximumContentWidth": maximumContentWidth,
      "mediaSize": mediaSize?.toMap(enumMethod: enumMethod),
      "mustCollate": mustCollate,
      "numberOfPages": numberOfPages,
      "orientation": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => orientation?.toNativeValue(),
        CygnusEnumMethod.value => orientation?.toValue(),
        CygnusEnumMethod.name => orientation?.name(),
      },
      "outputType": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => outputType?.toNativeValue(),
        CygnusEnumMethod.value => outputType?.toValue(),
        CygnusEnumMethod.name => outputType?.name(),
      },
      "pageHeight": pageHeight,
      "pageOrder": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => pageOrder?.toNativeValue(),
        CygnusEnumMethod.value => pageOrder?.toValue(),
        CygnusEnumMethod.name => pageOrder?.name(),
      },
      "pageRanges": pageRanges,
      "pageWidth": pageWidth,
      "pagesAcross": pagesAcross,
      "pagesDown": pagesDown,
      "pagesPerSide": pagesPerSide,
      "paperName": paperName,
      "printDialogKind": switch (enumMethod ?? CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => printDialogKind?.toNativeValue(),
        CygnusEnumMethod.value => printDialogKind?.toValue(),
        CygnusEnumMethod.name => printDialogKind?.name(),
      },
      "printerName": printerName,
      "resolution": resolution?.toMap(enumMethod: enumMethod),
      "scalingFactor": scalingFactor,
      "shouldPrintBackgrounds": shouldPrintBackgrounds,
      "shouldPrintHeaderAndFooter": shouldPrintHeaderAndFooter,
      "shouldPrintSelectionOnly": shouldPrintSelectionOnly,
      "showUI": showUI,
      "showsNumberOfCopies": showsNumberOfCopies,
      "showsPageRange": showsPageRange,
      "showsPageSetupAccessory": showsPageSetupAccessory,
      "showsPaperOrientation": showsPaperOrientation,
      "showsPaperSelectionForLoadedPapers": showsPaperSelectionForLoadedPapers,
      "showsPaperSize": showsPaperSize,
      "showsPreview": showsPreview,
      "showsPrintPanel": showsPrintPanel,
      "showsPrintSelection": showsPrintSelection,
      "showsProgressPanel": showsProgressPanel,
      "showsScaling": showsScaling,
      "time": time,
      "verticalPagination": switch (enumMethod ??
          CygnusEnumMethod.nativeValue) {
        CygnusEnumMethod.nativeValue => verticalPagination?.toNativeValue(),
        CygnusEnumMethod.value => verticalPagination?.toValue(),
        CygnusEnumMethod.name => verticalPagination?.name(),
      },
    };
  }

  ///Converts instance to a map.
  Map<String, dynamic> toJson() {
    return toMap();
  }

  ///Returns a copy of CygnusPrintJobSettings.
  CygnusPrintJobSettings copy() {
    return CygnusPrintJobSettings.fromMap(toMap()) ?? CygnusPrintJobSettings();
  }

  @override
  String toString() {
    return 'CygnusPrintJobSettings{animated: $animated, canSpawnSeparateThread: $canSpawnSeparateThread, collate: $collate, colorMode: $colorMode, copies: $copies, detailedErrorReporting: $detailedErrorReporting, duplexMode: $duplexMode, faxNumber: $faxNumber, firstPage: $firstPage, footerHeight: $footerHeight, footerUri: $footerUri, forceRenderingQuality: $forceRenderingQuality, handledByClient: $handledByClient, headerAndFooter: $headerAndFooter, headerHeight: $headerHeight, headerTitle: $headerTitle, horizontalPagination: $horizontalPagination, isHorizontallyCentered: $isHorizontallyCentered, isVerticallyCentered: $isVerticallyCentered, jobDisposition: $jobDisposition, jobName: $jobName, jobSavingURL: $jobSavingURL, lastPage: $lastPage, margins: $margins, maximumContentHeight: $maximumContentHeight, maximumContentWidth: $maximumContentWidth, mediaSize: $mediaSize, mustCollate: $mustCollate, numberOfPages: $numberOfPages, orientation: $orientation, outputType: $outputType, pageHeight: $pageHeight, pageOrder: $pageOrder, pageRanges: $pageRanges, pageWidth: $pageWidth, pagesAcross: $pagesAcross, pagesDown: $pagesDown, pagesPerSide: $pagesPerSide, paperName: $paperName, printDialogKind: $printDialogKind, printerName: $printerName, resolution: $resolution, scalingFactor: $scalingFactor, shouldPrintBackgrounds: $shouldPrintBackgrounds, shouldPrintHeaderAndFooter: $shouldPrintHeaderAndFooter, shouldPrintSelectionOnly: $shouldPrintSelectionOnly, showUI: $showUI, showsNumberOfCopies: $showsNumberOfCopies, showsPageRange: $showsPageRange, showsPageSetupAccessory: $showsPageSetupAccessory, showsPaperOrientation: $showsPaperOrientation, showsPaperSelectionForLoadedPapers: $showsPaperSelectionForLoadedPapers, showsPaperSize: $showsPaperSize, showsPreview: $showsPreview, showsPrintPanel: $showsPrintPanel, showsPrintSelection: $showsPrintSelection, showsProgressPanel: $showsProgressPanel, showsScaling: $showsScaling, time: $time, verticalPagination: $verticalPagination}';
  }
}

// **************************************************************************
// SupportedPlatformsGenerator
// **************************************************************************

///List of [CygnusPrintJobSettings]'s properties that can be used to check i they are supported or not by the current platform.
enum CygnusPrintJobSettingsProperty {
  ///Can be used to check if the [CygnusPrintJobSettings.animated] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.animated.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  animated,

  ///Can be used to check if the [CygnusPrintJobSettings.canSpawnSeparateThread] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.canSpawnSeparateThread.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  canSpawnSeparateThread,

  ///Can be used to check if the [CygnusPrintJobSettings.collate] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.collate.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  collate,

  ///Can be used to check if the [CygnusPrintJobSettings.colorMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.colorMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  colorMode,

  ///Can be used to check if the [CygnusPrintJobSettings.copies] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.copies.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  copies,

  ///Can be used to check if the [CygnusPrintJobSettings.detailedErrorReporting] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.detailedErrorReporting.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  detailedErrorReporting,

  ///Can be used to check if the [CygnusPrintJobSettings.duplexMode] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.duplexMode.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView 23+
  ///- iOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  duplexMode,

  ///Can be used to check if the [CygnusPrintJobSettings.faxNumber] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.faxNumber.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  faxNumber,

  ///Can be used to check if the [CygnusPrintJobSettings.firstPage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.firstPage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  firstPage,

  ///Can be used to check if the [CygnusPrintJobSettings.footerHeight] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.footerHeight.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  footerHeight,

  ///Can be used to check if the [CygnusPrintJobSettings.footerUri] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.footerUri.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  footerUri,

  ///Can be used to check if the [CygnusPrintJobSettings.forceRenderingQuality] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.forceRenderingQuality.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 14.5+
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  forceRenderingQuality,

  ///Can be used to check if the [CygnusPrintJobSettings.handledByClient] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.handledByClient.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  handledByClient,

  ///Can be used to check if the [CygnusPrintJobSettings.headerAndFooter] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.headerAndFooter.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  headerAndFooter,

  ///Can be used to check if the [CygnusPrintJobSettings.headerHeight] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.headerHeight.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  headerHeight,

  ///Can be used to check if the [CygnusPrintJobSettings.headerTitle] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.headerTitle.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  headerTitle,

  ///Can be used to check if the [CygnusPrintJobSettings.horizontalPagination] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.horizontalPagination.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  horizontalPagination,

  ///Can be used to check if the [CygnusPrintJobSettings.isHorizontallyCentered] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.isHorizontallyCentered.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isHorizontallyCentered,

  ///Can be used to check if the [CygnusPrintJobSettings.isVerticallyCentered] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.isVerticallyCentered.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  isVerticallyCentered,

  ///Can be used to check if the [CygnusPrintJobSettings.jobDisposition] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.jobDisposition.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  jobDisposition,

  ///Can be used to check if the [CygnusPrintJobSettings.jobName] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.jobName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  jobName,

  ///Can be used to check if the [CygnusPrintJobSettings.jobSavingURL] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.jobSavingURL.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  jobSavingURL,

  ///Can be used to check if the [CygnusPrintJobSettings.lastPage] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.lastPage.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  lastPage,

  ///Can be used to check if the [CygnusPrintJobSettings.margins] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.margins.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  margins,

  ///Can be used to check if the [CygnusPrintJobSettings.maximumContentHeight] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.maximumContentHeight.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  maximumContentHeight,

  ///Can be used to check if the [CygnusPrintJobSettings.maximumContentWidth] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.maximumContentWidth.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  maximumContentWidth,

  ///Can be used to check if the [CygnusPrintJobSettings.mediaSize] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.mediaSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  mediaSize,

  ///Can be used to check if the [CygnusPrintJobSettings.mustCollate] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.mustCollate.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  mustCollate,

  ///Can be used to check if the [CygnusPrintJobSettings.numberOfPages] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.numberOfPages.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  numberOfPages,

  ///Can be used to check if the [CygnusPrintJobSettings.orientation] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.orientation.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  orientation,

  ///Can be used to check if the [CygnusPrintJobSettings.outputType] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.outputType.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  outputType,

  ///Can be used to check if the [CygnusPrintJobSettings.pageHeight] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.pageHeight.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pageHeight,

  ///Can be used to check if the [CygnusPrintJobSettings.pageOrder] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.pageOrder.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pageOrder,

  ///Can be used to check if the [CygnusPrintJobSettings.pageRanges] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.pageRanges.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pageRanges,

  ///Can be used to check if the [CygnusPrintJobSettings.pageWidth] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.pageWidth.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pageWidth,

  ///Can be used to check if the [CygnusPrintJobSettings.pagesAcross] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.pagesAcross.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pagesAcross,

  ///Can be used to check if the [CygnusPrintJobSettings.pagesDown] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.pagesDown.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pagesDown,

  ///Can be used to check if the [CygnusPrintJobSettings.pagesPerSide] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.pagesPerSide.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  pagesPerSide,

  ///Can be used to check if the [CygnusPrintJobSettings.paperName] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.paperName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  paperName,

  ///Can be used to check if the [CygnusPrintJobSettings.printDialogKind] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.printDialogKind.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  printDialogKind,

  ///Can be used to check if the [CygnusPrintJobSettings.printerName] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.printerName.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  printerName,

  ///Can be used to check if the [CygnusPrintJobSettings.resolution] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.resolution.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Android WebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  resolution,

  ///Can be used to check if the [CygnusPrintJobSettings.scalingFactor] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.scalingFactor.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  scalingFactor,

  ///Can be used to check if the [CygnusPrintJobSettings.shouldPrintBackgrounds] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.shouldPrintBackgrounds.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  shouldPrintBackgrounds,

  ///Can be used to check if the [CygnusPrintJobSettings.shouldPrintHeaderAndFooter] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.shouldPrintHeaderAndFooter.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  shouldPrintHeaderAndFooter,

  ///Can be used to check if the [CygnusPrintJobSettings.shouldPrintSelectionOnly] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.shouldPrintSelectionOnly.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  shouldPrintSelectionOnly,

  ///Can be used to check if the [CygnusPrintJobSettings.showUI] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showUI.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- Windows WebView2
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showUI,

  ///Can be used to check if the [CygnusPrintJobSettings.showsNumberOfCopies] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsNumberOfCopies.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsNumberOfCopies,

  ///Can be used to check if the [CygnusPrintJobSettings.showsPageRange] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsPageRange.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsPageRange,

  ///Can be used to check if the [CygnusPrintJobSettings.showsPageSetupAccessory] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsPageSetupAccessory.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsPageSetupAccessory,

  ///Can be used to check if the [CygnusPrintJobSettings.showsPaperOrientation] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsPaperOrientation.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView 15.0+
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsPaperOrientation,

  ///Can be used to check if the [CygnusPrintJobSettings.showsPaperSelectionForLoadedPapers] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsPaperSelectionForLoadedPapers.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- iOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsPaperSelectionForLoadedPapers,

  ///Can be used to check if the [CygnusPrintJobSettings.showsPaperSize] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsPaperSize.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsPaperSize,

  ///Can be used to check if the [CygnusPrintJobSettings.showsPreview] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsPreview.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsPreview,

  ///Can be used to check if the [CygnusPrintJobSettings.showsPrintPanel] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsPrintPanel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsPrintPanel,

  ///Can be used to check if the [CygnusPrintJobSettings.showsPrintSelection] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsPrintSelection.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsPrintSelection,

  ///Can be used to check if the [CygnusPrintJobSettings.showsProgressPanel] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsProgressPanel.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsProgressPanel,

  ///Can be used to check if the [CygnusPrintJobSettings.showsScaling] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.showsScaling.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  showsScaling,

  ///Can be used to check if the [CygnusPrintJobSettings.time] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.time.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  time,

  ///Can be used to check if the [CygnusPrintJobSettings.verticalPagination] property is supported at runtime.
  ///
  ///{@template cygnus_core.CygnusPrintJobSettings.verticalPagination.supported_platforms}
  ///
  ///**Officially Supported Platforms/Implementations**:
  ///- macOS WKWebView
  ///
  ///Use the [CygnusPrintJobSettings.isPropertySupported] method to check if this property is supported at runtime.
  ///{@endtemplate}
  verticalPagination,
}

extension _CygnusPrintJobSettingsPropertySupported on CygnusPrintJobSettings {
  static bool isPropertySupported(
    CygnusPrintJobSettingsProperty property, {
    TargetPlatform? platform,
  }) {
    switch (property) {
      case CygnusPrintJobSettingsProperty.animated:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.canSpawnSeparateThread:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.collate:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.colorMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.copies:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.detailedErrorReporting:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.duplexMode:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.faxNumber:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.firstPage:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.footerHeight:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.footerUri:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.forceRenderingQuality:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.handledByClient:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.headerAndFooter:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.headerHeight:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.headerTitle:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.horizontalPagination:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.isHorizontallyCentered:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.isVerticallyCentered:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.jobDisposition:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.jobName:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.jobSavingURL:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.lastPage:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.margins:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.maximumContentHeight:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.maximumContentWidth:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.mediaSize:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.mustCollate:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.numberOfPages:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.orientation:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
              TargetPlatform.iOS,
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.outputType:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.pageHeight:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.pageOrder:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.pageRanges:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.pageWidth:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.pagesAcross:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.pagesDown:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.pagesPerSide:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.paperName:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.printDialogKind:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.printerName:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.resolution:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.android,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.scalingFactor:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.macOS,
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.shouldPrintBackgrounds:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.shouldPrintHeaderAndFooter:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.shouldPrintSelectionOnly:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showUI:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.windows,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsNumberOfCopies:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsPageRange:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsPageSetupAccessory:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsPaperOrientation:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [
              TargetPlatform.iOS,
              TargetPlatform.macOS,
            ].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsPaperSelectionForLoadedPapers:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.iOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsPaperSize:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsPreview:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsPrintPanel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsPrintSelection:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsProgressPanel:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.showsScaling:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.time:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
      case CygnusPrintJobSettingsProperty.verticalPagination:
        return ((kIsWeb && platform != null) || !kIsWeb) &&
            [TargetPlatform.macOS].contains(platform ?? defaultTargetPlatform);
    }
  }
}
