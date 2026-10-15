# 2610152204 - native-bridge-naming-cygnus

- Created: 2026-10-15 22:04 / Archived: 2026-10-16 00:30
- Issue: KNightING/cygnus_core#8
- Milestone: N/A / Base Branch: main

## Summary
原生端、channel、JS 橋接與 plugin 命名全面改為 Cygnus 風格，去掉 `inappwebview`／`InApp` 字樣：channel 前綴 `com.github.knighting.cygnus/`（30 個後綴去掉 `flutter_` 與 `inapp`）、JS 全域 `window.cygnus`、事件 `cygnusPlatformReady`、plugin `CygnusCorePlugin`（Windows `CygnusCorePluginCApi`）、`dartPluginClass` 改為 `Cygnus<平台>WebViewPlatform`，五個原生端的類別、命名空間與 156 個檔案路徑依「前綴 `Cygnus`、移除 `InApp`」改名。
這是 `cygnus_core` 四階段中的階段 ③，JS 為硬切換、不留舊名稱（使用端 `nuxt-flutter-app` 須另立計畫同步，且新舊網頁包與殼互不相容）；持久化名稱一併改名，Android `CredentialDatabase.db` 首次開啟時自動搬移。Android／iOS／macOS 由編譯器驗證建置通過，Windows／Linux 僅做靜態一致性檢查；`pubspec.yaml` 版本對齊為 `0.1.0` 並於合併後打同名 tag。

## Cross-Repo Scope
- `KNightING/cygnus_core`（提供方，本計畫）：A–F 全部；完成後 tag `0.1.0`。
- `KNightING/nuxt-flutter-app`（消費方，另立計畫）：`packages/cygnus` 的 TypeScript（`window.flutter_inappwebview` → `window.cygnus`）、`flutter-host` 的 `ref` 改新 tag、host／網頁包版本需求（硬切換的相容閘）、wiki。
- 執行順序：本 repo 先、使用端後；使用端的前提是 tag `0.1.0` 已存在。

## Key Decisions
- **[Phase 0]** 範圍 A＋B＋C＋D＋E，前綴 `cygnus`、去掉 `inapp`；OTA 硬切換；持久化改名並遷移 — 理由：使用者 2026-10-15 的選擇。
- **[Phase 0]** Channel 前綴 `com.github.knighting.cygnus/` — 理由：沿用 Android 命名空間 `com.github.knighting.cygnus.core` 的慣例（agent 的細節判斷，待核准時糾正）。
- **[Phase 0]** JS 全域 `window.cygnus`、事件 `cygnusPlatformReady`（agent 的細節判斷，待核准時糾正）。
- **[Phase 0]** 使用端為另一份計畫，共用 `2610152204` 時戳，順序為本 repo 先 — 理由：契約提供方先完成並出新 tag，消費方才能依它釘版本。

- **[Q2]** 原生類別與 Dart 同一套規則（前綴 `Cygnus`、移除 `InApp`）— 理由：使用者核准；避免與 `android.webkit.WebView` 等平台類別同名。
- **[Q3]** Windows／Linux 照做、靜態檢查，建置驗證列入人工收尾事項 — 理由：使用者核准。
- **[Q4]** `dartPluginClass` 一併改為 `Cygnus<平台>WebViewPlatform` — 理由：使用者核准。
- **[Q5]** 完成後 tag `0.1.0` — 理由：使用者核准。
- **[核准閘]** 完成後：commit + 開 PR，自行合併、做合併後清理；PR 以 `--base main`。完成時 `git fetch` 後 `git rebase origin/main` 並以 `--force-with-lease --force-if-includes` 更新遠端工作分支（已揭露）。
- **[核准閘]** 使用者的核准涵蓋對外動作：建立 issue、分支、完成後的 tag `0.1.0`。
- **[執行中]** 小寫識別字就地替換、C++／GObject 衍生名一併改名；Web 端互通全域為 `window.cygnusWeb` — 理由：避免撞名並維持 `G_DECLARE_FINAL_TYPE` 的衍生關係；實測互通全域其實是 `flutter_inappwebview_plugin`。
- **[執行中]** `pubspec.yaml` 版本改為 `0.1.0` 與 tag 一致 — 理由：使用端 `pubspec.lock` 會記錄套件版本，tag 與內容版本需一致。

## Deviations
- **以腳本與對照表執行，未使用平行 agent**：規則全部機械式，改以分階段腳本（channel／JS 字串 → plugin 專用名稱 → 通用識別字與路徑）套用並以建置驗證；原生識別字分「識別字」與「路徑」兩種模式（路徑模式去掉 `in_app_`、`inappwebview` → `webview`；識別字模式 `in_app_` → `cygnus_`，避免與既有 `webview` 識別字撞名）。
- **規則的細節展開**：小寫識別字採就地替換（`inApp` → `cygnus`、`createInAppWebView` → `createCygnusWebView`），而非 Dart 的「移除再前綴」，以避免與既有識別字撞名並維持可讀；C++／GObject 的巨集與型別名（`INAPPWEBVIEW_*` → `CYGNUS_WEBVIEW_*`）依 `G_DECLARE_FINAL_TYPE` 的衍生關係一併改名。
- **Web 端互通全域**：`window.flutter_inappwebview_plugin` 改為 `window.cygnusWeb`（計畫只列 `flutterInAppWebView`，實測 Dart 端互通全域其實是 `flutter_inappwebview_plugin`）；`web_support.js` 含 inline sourcemap，以 `esbuild` 重新建置而非手改。
- **範圍外保留**：Dart 實作層內部類別（約 260 個，如 `AndroidInAppWebViewController`）仍沿用階段 ② 的「實作類別不動」；`example` 應用程式識別（Android `applicationId`、iOS／macOS bundle id、版權字串）與 `example` 內 `in_app_*` 目錄、`.github/**` 上游說明文件仍是舊名稱；上游的啟動訊息 `Hi, flutter_inappwebview here…` 與指向上游的連結保留（出處標示）。
- **附帶改名**：內部套件 `flutter_inappwebview_internal_annotations` → `cygnus_core_internal_annotations`、example 套件 `flutter_inappwebview_example` → `cygnus_core_example`、`mock_inappwebview_platform` → `mock_cygnus_platform`、Linux 環境變數 `FLUTTER_INAPPWEBVIEW_LINUX_DISABLE_GL` → `CYGNUS_LINUX_DISABLE_GL`（使用者可見，已列入 `doc/native-rename-map.md`）。
- **驗證**：Android debug／release（R8）、iOS 模擬器、macOS、Web 建置皆通過；`flutter analyze` 4062 項（與基準相同）；build_runner 重新產生無差異；channel 字串集合在 Dart、Android、iOS、macOS、Windows、Linux 六個區域與改名前（套用對照後）逐一相同（114／24／21／18／19／21 處）；macOS 整合測試 `getTitle`、`JavaScript Handler`、`evaluateJavascript` 通過（`window.cygnus.callHandler` 與 Dart handler 端到端可用）；`example` 單元測試與基準相同的 4 個失敗；`wiki-lint` 31 項既有硬閘；Windows／Linux 的所有 `#include` 與 CMake 來源清單皆指向存在的檔案，Flutter 產生的 registrant 所需的標頭與註冊函式（`cygnus_core/cygnus_core_plugin.h`、`cygnus_core_plugin_register_with_registrar`、`CygnusCorePluginCApiRegisterWithRegistrar`）皆存在。
- **未能驗證**：Windows、Linux 的 C++ 編譯；Android 執行期 WebView 載入（模擬器逾時，基準版同樣逾時；僅確認 App 啟動且 plugin 註冊成功）；`CredentialDatabase` 舊資料搬移的執行期行為（僅編譯驗證）；iOS／macOS 的 InAppBrowser、Cookie 等功能。
- **版本**：`pubspec.yaml` 的 `version` 由 `0.0.0` 改為 `0.1.0`，與合併後要打的 tag 一致（計畫原只寫打 tag）。
- 既有問題（未處理）：`example/test` 4 個 UI 測試失敗、wiki-lint 31 項硬閘、`.github/**` 上游文件過時。

## Impact Files
- `doc/native-rename-map.md` (new) — channel 後綴、plugin 與原生識別字、路徑的新舊對照
- `lib/**` — channel 字串、`window.cygnusWeb`、`dartPluginClass`／web plugin 類別名；`lib/assets/web/web_support.js` 重新建置
- `web_support/src/index.ts` — Web 端互通全域與型別
- `android/src/main/kotlin/**`、`AndroidManifest.xml`、`proguard-rules.pro`、`res/` — 類別、子套件、檔名；`credential_database/CredentialDatabase.kt` — 資料庫改名與舊檔搬移
- `ios/`、`macos/`（Swift）、`windows/`、`linux/`（C++）— 類別、命名空間、檔名（156 個路徑搬移）；`linux/include/cygnus_core/cygnus_core_plugin.h`、`windows/include/cygnus_core/cygnus_core_plugin_c_api.h`
- `pubspec.yaml:1-5,36-54` — 版本與 `pluginClass`／`dartPluginClass`
- `dev_packages/cygnus_core_internal_annotations/`（原 `flutter_inappwebview_internal_annotations`）、`example/` — 套件名與 mock 檔名
- `.kn-project/project.md`、`AGENTS.md`、`README.md`、`doc/linux-wpe-backend.md`、wiki 7 頁 — 敘述與路徑
- 不動：`.github/**`

## Wiki Changes

| 頁面 | 日期 | 版本 | 變動 | Issue | PR |
|---|---|---|---|---|---|
| `features/android-back-gesture.md` | 2026-10-16 | — | 原生類別名與路徑改為 Cygnus 命名 | [#8](https://github.com/KNightING/cygnus_core/issues/8) | [PR #9](https://github.com/KNightING/cygnus_core/pull/9) |
| `features/android-platform-view-composition.md` | 2026-10-16 | — | 原生類別名與路徑改為 Cygnus 命名 | [#8](https://github.com/KNightING/cygnus_core/issues/8) | [PR #9](https://github.com/KNightING/cygnus_core/pull/9) |
| `features/keyboard-avoidance.md` | 2026-10-16 | — | 原生類別名與路徑改為 Cygnus 命名 | [#8](https://github.com/KNightING/cygnus_core/issues/8) | [PR #9](https://github.com/KNightING/cygnus_core/pull/9) |
| `features/windows-scroll-input.md` | 2026-10-16 | — | 原生類別名與路徑改為 Cygnus 命名 | [#8](https://github.com/KNightING/cygnus_core/issues/8) | [PR #9](https://github.com/KNightING/cygnus_core/pull/9) |
| `features/windows-view-geometry.md` | 2026-10-16 | — | 原生類別名與路徑改為 Cygnus 命名 | [#8](https://github.com/KNightING/cygnus_core/issues/8) | [PR #9](https://github.com/KNightING/cygnus_core/pull/9) |
| `features/windows-webview-focus.md` | 2026-10-16 | — | 原生類別名與路徑改為 Cygnus 命名 | [#8](https://github.com/KNightING/cygnus_core/issues/8) | [PR #9](https://github.com/KNightING/cygnus_core/pull/9) |
