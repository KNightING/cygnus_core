# 2610142351 - dart-naming-cygnus

- Created: 2026-10-14 23:51 / Archived: 2026-10-15 01:00
- Issue: KNightING/cygnus_core#4
- Milestone: N/A / Base Branch: main

## Summary
Dart 公開 API 改為 Cygnus 風格命名：526 個型別加 `Cygnus` 前綴並移除任何位置的 `InApp`、43 個小寫識別字（含公開方法名）移除 `InApp`、`lib/` 內 111 個檔案與目錄去掉 `in_app_` 並把 `inappwebview` 改為 `webview`。
這是 `cygnus_core` 四階段中的階段 ②；原生端、channel 前綴、JS 全域名稱未動（階段 ③）。改名以腳本依 `doc/dart-rename-map.md` 套用，產生器同步更新後重跑 build_runner，新舊產生檔逐檔比對等價；`flutter analyze` 0 error、4062 項（與階段 ① 基準相同）。不保留舊名別名，唯一使用端 `flutter-host` 於階段 ④ 更新。

## Cross-Repo Scope
無（單一 repo）。階段 ④ 將牽動 `KNightING/nuxt-flutter-app`（`flutter-host` 用到 8 個會改名的型別），屆時另立計畫。

## Key Decisions
- **[Phase 0]** 不指定 milestone，Base Branch `main`，不做版本檔同步 — 理由：使用者選擇；Rule 23／24 本計畫停用。
- **[Phase 0]** 命名規則 = 前綴 `Cygnus` ＋ 移除任何位置的詞 `InApp` — 理由：使用者定義；使用者在見到「只動開頭」會讓 29 個名稱的 `InApp` 留在中間之後，選擇移除任何位置（共 50 個名稱受影響）。
- **[Phase 0]** 範圍＝公開 API（526 個）；平台實作內部類別、4 個不對外匯出的名稱維持原名；`Platform` 與平台前綴保留 — 理由：使用者選擇。
- **[Phase 0]** 直接改名、不保留舊名別名 — 理由：使用者選擇；唯一的使用端 `flutter-host` 於階段 ④ 一併更新。
- **[Phase 0]** 兩組重名（`InAppWebViewOptions`／`WebViewOptions`、`InAppBrowserOptions`／`BrowserOptions`）以「已弃用的舊式子類維持 `InApp`」解決 — 理由：使用者選擇；這兩個子類是已弃用的舊式 API，空基底類別回到 `CygnusWebViewOptions`／`CygnusBrowserOptions`。
- **[Phase 0]** 檔案與目錄名只去掉 `in_app_` 這個詞、不加前綴 — 理由：使用者選擇；檔名不是公開 API，其餘 450 多個檔案不必為前綴而改名。
- **[Phase 0]** 對照表須先經使用者核對才開計畫 — 理由：使用者要求；**先前提供的對照表含錯誤**（旧式函式 typedef 的返回型別 `void`／`dynamic` 被誤判為類別名，並漏掉 4 個真正的 typedef），已重建並加完整性檢查（必須是 PascalCase、不是核心型別），名稱數由 528 更正為 526；更正後的對照表於核准閘前重新產出供核對。
- **[Phase 0]** 「檢查每個檔案順便看優化」只收集、不修改 — 理由：優化屬計畫範圍之外的改動，依 Rule 25 歸為「岔題」，記錄後由使用者另行決定。
- **[Q1]** 逐檔審視採靜態分析＋腳本掃描涵蓋全部 537 個非產生檔案，另對熱點細讀；只收集「優化候選」、不修改 — 理由：使用者選擇；注意此深度不等於人工逐行閱讀每個檔案，回報時會如實說明涵蓋方式。
- **[Q2]** 註解、dartdoc、`@Deprecated` 訊息與 `{@macro}`／`{@template}` id 一併改名 — 理由：使用者選擇；文件與程式碼一致，id 本由類別名產生。
- **[Q3]** 7 個同名實作類別維持原名（`AndroidInAppWebViewController`、`AndroidServiceWorkerController`、`AndroidWebStorageManager`、`AndroidWebViewFeature`、`IOSCookieManager`、`IOSInAppWebViewController`、`IOSWebStorageManager`），替換依目錄排除 — 理由：使用者選擇；符合「實作類別不動」。其中 6 個在公開層有手寫宣告，`AndroidWebViewFeature` 的公開版由 `AndroidWebViewFeature_` 產生。
- **[Q4]** `doc/dart-rename-map.md` 進版控 — 理由：使用者選擇；階段 ④ 與日後遷移需要。
- **[核准閘]** 完成後：commit + 開 PR（預設；自動歸檔＋wiki，Rule 12 非互動鏈），base 為 `main` — 理由：使用者選擇；變動量大，PR 提供完整 diff。完成時會 `git fetch` 後 `git rebase origin/main` 並以 `--force-with-lease --force-if-includes` 更新遠端工作分支（已揭露）。
- **[Phase 1]** 逐檔審視完成（唯讀，未修改任何檔案）：以 `flutter analyze`（4062 項）、`dart fix --dry-run`（2804 項可自動修正／358 個檔案）與腳本掃描涵蓋全部檔案，並細讀 12 個 warning 對應的原始碼；**未做人工逐行閱讀**。優化候選清單已回報使用者，實際優化不在本計畫內，由使用者另行決定；審視中另發現規則的兩處邊界（Q5、Q6）。
- **[Q5]** 小寫識別字（公開方法名與私有欄位）也依「移除 `InApp`」改名 — 理由：使用者選擇；公開方法名（如 `createPlatformInAppWebViewController`）與新類別名一致。改名須避開撞名，並避開字串字面值（channel 名、JS 名）。
- **[Q6]** `lib/**` 內檔名與 `library` 指令的 `inappwebview` 一併改為 `webview`（19 個檔案）— 理由：使用者選擇；已確認與 `in_app_` 去除規則合併後零撞名、零既有檔案衝突。`dev_packages/flutter_inappwebview_internal_annotations`（內部套件目錄）與 `example/**` 不在此範圍，維持原名，留待階段 ③。
- **[Phase 4]** `doc/linux-wpe-backend.md` 不修改 — 理由：實際只含原生與套件名稱，沒有 Dart 類別名（計畫原列為待更新）。
- **[Phase 5]** Android 執行期以建置通過為準 — 理由：模擬器上 WebView 載入逾時，基準版 `7184792` 同樣逾時（環境問題，非回歸）。

## Deviations
- **範圍在執行中擴大（已核准）**：Phase 1 審視發現規則的兩處邊界，新增 Q5（小寫識別字，43 種、1135 處）與 Q6（`lib/` 內 `inappwebview` 檔名與 `library` 指令），使用者選擇一併改，計畫修訂後重新核准；檔案路徑因此由 96 個變成 111 個。
- **Phase 2 實作時發現的衍生名稱**：產生器由類別名衍生 115 處私有 `extension _XxxSupported` 名稱，手寫原始碼需同步更新；等價性驗證去掉 `Cygnus` 前綴並統一排版後，只剩這些私有名稱（7 個檔案）與換行差異。
- **JS／channel 名稱保留**：`flutterInAppWebViewPlatformReady`、`flutterInAppWebView`、`createFlutterInAppWebView`、`createInAppWebView` 由 JS 或原生端以名稱呼叫，Q5 不改，留待階段 ③。
- **`doc/linux-wpe-backend.md` 未修改**（計畫原列）；`dev_packages/flutter_inappwebview_internal_annotations` 目錄與 `example/**` 檔名維持原名。
- **Android 執行期未能驗證**：模擬器上 WebView 載入逾時（`getTitle` 整合測試），基準版 `7184792` 同樣逾時，屬環境問題；Android 僅驗證 `assembleDebug` 建置通過。macOS 的 `getTitle` 整合測試實際載入 WebView 並通過；Web、macOS、iOS 模擬器建置通過。
- **channel／JS／Java namespace／plugin 類別名逐項計數與基準相同**（`com.pichillilorenzo/` 217、`window.flutter_inappwebview` 48、Java namespace 534、`InAppWebViewFlutterPlugin` 187）；`android/ ios/ macos/ windows/ linux/ web_support/` 與 `pubspec.yaml` 相對基準零差異。
- **`example` 單元測試**：與階段 ① 相同的 4 個 UI 測試失敗，不增不減；`wiki-lint` 仍為既有的 31 項硬閘違規。
- **commit 的 `Closes #4`**：僅 Phase 1 的 commit 與 PR body 帶有（其餘 commit 漏帶，PR 合併的 commit 仍會關閉 issue；關閉的正式時機在合併後清理）。
- **Windows、Linux 僅靜態檢查**（Dart 改動不涉及 CMake）。

## Impact Files
- `doc/dart-rename-map.md` (new) — 526 型別、43 小寫識別字、111 路徑的新舊對照
- `lib/**`（非 `*.g.dart` 與 269 個 `*.g.dart`）— 型別、識別字、註解、dartdoc、訊息改名；`lib/src/platforms/**` 排除 7 個同名實作類別；111 個路徑 `git mv`
- `lib/cygnus_core.dart:24-38`、`lib/src/platforms/platforms_native.dart:5-11` — 匯出與 `show`／`hide` 路徑更新
- `dev_packages/generators/lib/src/exchangeable_object_generator.dart:405,408,411,438,614,763,765,767,839-861,890,929-951` — `WebUri`、`EnumMethod` 字串
- `example/**/*.dart` — 隨公開名稱改名（套件名 `flutter_inappwebview_example` 與 `mock_inappwebview_platform.dart` 檔名不動）
- `.kn-project/project.md`、`.kn-project/wiki/features/` 6 頁、`README.md`、`AGENTS.md` — 類別名、路徑與「名稱未更動」的敘述
- 不動：`android/ ios/ macos/ windows/ linux/ web_support/`、`.github/**`

## Wiki Changes

| 頁面 | 日期 | 版本 | 變動 | Issue | PR |
|---|---|---|---|---|---|
| `features/android-high-frequency-events.md` | 2026-10-15 | — | Dart 公開 API 改為 Cygnus 風格命名 | [#4](https://github.com/KNightING/cygnus_core/issues/4) | [#5](https://github.com/KNightING/cygnus_core/pull/5) |
| `features/android-platform-view-composition.md` | 2026-10-15 | — | Dart 公開 API 改為 Cygnus 風格命名 | [#4](https://github.com/KNightING/cygnus_core/issues/4) | [#5](https://github.com/KNightING/cygnus_core/pull/5) |
| `features/keyboard-avoidance.md` | 2026-10-15 | — | Dart 公開 API 改為 Cygnus 風格命名 | [#4](https://github.com/KNightING/cygnus_core/issues/4) | [#5](https://github.com/KNightING/cygnus_core/pull/5) |
| `features/windows-scroll-input.md` | 2026-10-15 | — | Dart 公開 API 改為 Cygnus 風格命名 | [#4](https://github.com/KNightING/cygnus_core/issues/4) | [#5](https://github.com/KNightING/cygnus_core/pull/5) |
| `features/windows-webview-focus.md` | 2026-10-15 | — | Dart 公開 API 改為 Cygnus 風格命名 | [#4](https://github.com/KNightING/cygnus_core/issues/4) | [#5](https://github.com/KNightING/cygnus_core/pull/5) |
