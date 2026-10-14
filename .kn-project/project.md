<!-- REMINDER: Relative Paths Only! No file:///c:/... -->
# cygnus_core

Cygnus 框架（Nuxt 網頁 + Flutter 殼）的 WebView 核心套件，供 KNightING 自有專案以 **git 依賴**方式使用。
原本是 8 個聯邦式套件，自階段 ①（2026-10）起合併為單一 Flutter plugin 套件 `cygnus_core`。

源自 `pichillilorenzo/flutter_inappwebview`（Apache-2.0，出處與變更見 `NOTICE`），直接來源為
`KNightING/flutter_inappwebview`（tag `6.2.0-beta.3.6`，commit `1883884f5`）。本 repo 是獨立 repo
（**不是 GitHub fork**），初始只有一個匯入 commit，不帶上游 git 歷史。

存在目的不是追隨上游，而是**把使用端反覆重造的原生行為收進套件**——最先處理的是軟鍵盤避讓：
那件事需要同時掌握「鍵盤高度」與「WebView 的原生視圖」，兩者都只有套件層拿得到，
放在模板或 App 層必然重複實作且互相打架。

## 保留鐵則

- **永久分岔，不再同步上游。** 合併後的目錄結構與上游不同，無法再 merge；上游日後的修正需手動評估
  移植。本專案不對上游發 PR，所有變更只服務 KNightING 自有專案的需求。
- **對外名稱分階段調整，每階段各自一份計畫、可獨立建置驗證**：
  - 階段 ①（進行中）：合併為單一套件、套件名改為 `cygnus_core`。**不改** Dart 類別名、Android Java
    namespace、channel 前綴 `com.pichillilorenzo/`、JS 全域名稱 `window.flutter_inappwebview`——
    先只做結構合併，行為不變，把變更面壓到最小。
  - 階段 ②：Dart 公開 API 命名改為 Cygnus 風格（命名規則由使用者定義）。
  - 階段 ③：原生端、channel 前綴、JS 全域名稱是否更動與改成什麼，屆時再決定。
  - 階段 ④：`nuxt-flutter-app` 的 `flutter-host` 改依賴本套件。
- **目前以 git 依賴使用，不發佈 pub.dev。** 根 `pubspec.yaml` 對 `dev_packages/*` 使用 `path:` 依賴，
  `flutter pub publish` 會因此被拒絕（`invalid_dependency`）；`package.json` 的 `publish` 腳本是保留
  的意圖，並不能直接成功執行。要發佈須先處理 `flutter_inappwebview_internal_annotations`。
- **對同 repo 的 `dev_packages` 一律用相對 `path:`**，不帶版本約束（`path` 依賴不得同時帶版本）。
- **版本號即 milestone 標題**，起始為 `0.0.0`；根 `pubspec.yaml` 的 `version` 是唯一來源。

## 開發機設定

本 repo 不是 fork，`gh pr create` 不會誤指向他人的 repo。若想省略 `gh` 指令的 `--repo` 旗標，可在
**各 clone**（設定存於 `.git/config`，不隨 repo 傳遞）執行：

```bash
gh repo set-default KNightING/cygnus_core
```

## Architecture

單一 Flutter plugin 套件，repo 根目錄即套件根目錄（根 `pubspec.yaml`）：

| 位置 | 職責 |
| :--- | :--- |
| `lib/cygnus_core.dart` | 唯一對外入口（沿用原 app-facing 套件的匯出與 `hide` 清單） |
| `lib/src/platform_interface/` | 平台無關的介面與設定物件（`InAppWebViewSettings` 等），含 build_runner 產生的 `*.g.dart` |
| `lib/src/*`（`platform_interface`、`platforms` 以外） | 原 app-facing 套件的類別（`InAppWebView`、`InAppBrowser`、`ChromeSafariBrowser` 等） |
| `lib/src/platforms/<平台>/` | 各平台的 Dart 實作（android、ios、macos、windows、linux、web） |
| `lib/src/platforms/platforms.dart` | 以 `dart.library.js_interop` 條件匯出：原生建置只公開 5 個平台的註冊類別，Web 改由 pubspec 的 `fileName` 註冊 |
| `android/` `ios/` `macos/` `windows/` `linux/` | 各平台原生程式碼（Android 為 Java，命名空間 `com.pichillilorenzo.flutter_inappwebview_android`） |
| `dev_packages/flutter_inappwebview_internal_annotations` | 程式碼產生用註記（套件名階段 ① 不改） |
| `dev_packages/generators` | 程式碼產生器 |
| `example/` | 範例與整合測試（唯一保留的 example） |
| `web_support/` | Web 端 JS 橋接（TypeScript），建置為 `lib/assets/web/web_support.js` |

新增一個跨平台設定的路徑固定為：`lib/src/platform_interface` 宣告 → `lib/src/platforms/<平台>/`
各平台實作解析 → `lib/src/` 下的 app-facing 類別透傳（`*.g.dart` 以 `npm run build` 重新產生）。

原生建置識別字（podspec、Swift Package、CMake 目標與 `include/` 目錄）一律與套件名 `cygnus_core`
一致——Flutter 產生的 registrant 與 `generated_plugins.cmake` 以套件名解析它們；
`pluginClass`（`InAppWebViewFlutterPlugin` 等）決定標頭與函式名，階段 ① 不改。

### Android 的 WebView 層次

`FlutterWebView`（`public class`，`implements PlatformWebView`）
→ `InAppWebView`（`final public class`）
→ `InputAwareWebView`（`public class`，**非 final**）
→ `android.webkit.WebView`。

`InputAwareWebView` 未被 final 修飾，是掛 window insets 監聽最自然的位置。

### 平台基準

對齊 **Flutter 3.47.0 / Dart 3.13.0**（2026-08-15，詳見 `archive/2608151157-flutter-3-47-upgrade.md`，
該檔另記有 3.47 各項門檻的 SDK 原始碼出處，供未來升級比對）。

| 項目 | 現值 |
| :--- | :--- |
| AGP | **9.3.0**；Gradle wrapper 9.5.0（升級歷程見 `archive/2608121003-agp-9-upgrade.md`） |
| Kotlin Gradle Plugin | **2.4.0**（Flutter 3.47 的 template 值） |
| `compileSdk` / `targetSdk` | 取 `flutter.compileSdkVersion`（跟隨 Flutter SDK，非硬寫）=36 |
| `minSdkVersion` | **24**（Flutter 支援下限；app 端低於 23 即建置失敗） |
| iOS 部署目標 | **15.0**（套件 SPM/podspec 與 example 專案一致） |
| macOS 部署目標 | **12.0**（同上） |

- iOS / macOS **同時**提供 `Package.swift`（SPM）與 `.podspec`（CocoaPods），兩者並存。
  **Flutter 3.47 起 SPM 於 stable 預設啟用**，故套件的 `Package.swift` 會被拉進 app 建置。
- **macOS 部署目標勿降回 10.14**：新版 Xcode 對 `ASWebAuthentication` 的可用性檢查會令 10.14
  直接建置失敗（詳見 `archive/2608140054-macos-spm-deployment-target.md`）。10.15 已於
  2026-08-15 進一步升至 12.0。
- iOS example 已採用 **UIScene 生命週期**（`UISceneDelegateClassName` 用 engine 內建的
  `FlutterSceneDelegate`，未新增 Swift 檔案、未改 `project.pbxproj` 結構）。
- **已知未驗證**：實體 iOS 裝置、Linux。
  （Windows example 已多次以真實操作驗證：觸控板捲動見
  `archive/2608152118-windows-trackpad-scroll.md` 與
  `archive/2608152335-windows-trackpad-pointer-input.md`；焦點、IME、原生彈出物落點與
  各輸入路徑見 `archive/2608201704-windows-webview-focus.md`。）

### JS 橋接名稱

注入於網頁的全域物件名**是執行期可設定的**，非寫死常數：
`JavaScriptBridgeJS.set_JAVASCRIPT_BRIDGE_NAME()` / `get_JAVASCRIPT_BRIDGE_NAME()`，
Android / iOS / macOS 三平台的宣告皆位於各自的 `plugin_scripts_js` / `PluginScriptsJS`
目錄下的 `JavaScriptBridgeJS`。預設值 `flutter_inappwebview`，使用端的
`window.flutter_inappwebview.callHandler(...)` 依此。

## 待移植（來自 `KNightING/camelot_inappwebview`）

該 fork（`arrrrny/zikzak_inappwebview` 的下游）已停止作為開發基底，但有三項上游沒有、
本專案需要的東西待移植：

- **Windows virtual host mappings** — 繞過本地 CORS，約 414 行，跨 `lib/src/platform_interface`
  與 Windows 實作（`lib/src/platforms/windows`、`windows/`）。
- **`ZikZakSecurityManager`** — 憑證釘選、HTTPS-only、fetch/XHR 請求攔截，661 行（Android）。
  移植時需重新命名（不沿用 ZikZak 字樣）。
- **macOS popup window 修正** — `window.open` 的 popup 視窗與事件遞送。移植前需先確認上游是否已修。

## 為何不是 zikzak fork（2026-08-11 決策）

曾以 `KNightING/camelot_inappwebview`（`arrrrny/zikzak_inappwebview` 下游）為基底，實測比對後改用本 repo：

> **下表為 2026-08-11 決策當下的快照，不代表現況。**「本 repo」欄的數值之後已隨多份計畫演進
> （AGP 已升至 9.3.0，且本 repo 為支援 keyboardAvoidance 等功能已累積少量上游 delta，
> 不再是「零分歧」）。**現行平台基準一律以上方的「平台基準」段為準**，此表僅保留作為當初的決策依據。

| 項目 | zikzak fork | 本 repo（2026-08-11 當時） |
| :--- | :--- | :--- |
| 與上游分歧 | 大幅改寫，同步即大規模衝突 | **零分歧** |
| AGP | 8.5.2 | 8.13.1 |
| `compileSdk` | 硬寫 36 | 跟隨 Flutter SDK |
| CocoaPods | **無 podspec**（已移除，SPM-only） | podspec 與 SPM 並存 |
| JS 橋接名 | 寫死 `final`，macOS 宣告誤置於 `FindInteractionJS.swift` | 執行期可設定，三平台位置一致 |
| 使用端遷移 | 需改依賴、`import`、JS 全域名 | **零遷移** |

軟鍵盤避讓所需的錨點（`InputAwareWebView` / `InAppWebView` / `InAppWebViewSettings`）兩邊相同，
改用本 repo 無工作損失。

## 版本紀錄

只記併回主幹，發佈狀態以 GitHub Release 為準。

- 6.2.0-beta.3.6 — 併回主幹 2026-10-13（主套件與平台實作的 pubspec 改用 `path:` 依賴，使用端免 `dependency_overrides`）
