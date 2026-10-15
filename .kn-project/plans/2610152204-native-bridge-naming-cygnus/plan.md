<!-- REMINDER: Relative Paths Only! No file:///c:/... -->
# Plan: 2610152204 - native-bridge-naming-cygnus
- Created: 2026-10-15
- Branch: feature/2610152204-native-bridge-naming-cygnus
- Issue: KNightING/cygnus_core#8
- Milestone: N/A（未指定）
- Base Branch: main
- Status: In Progress
- Completed: [Wait for Finish]

## Goals
**階段 ③**：把原生端、channel、JS 橋接與 plugin 的命名改為 Cygnus 風格，去掉 `inappwebview`／`InApp` 字樣。行為不變；Dart 公開 API 已於階段 ② 完成，不再動。

使用者已定的決策（2026-10-15）：
1. **範圍**：A Channel 名稱、B JS 全域名稱與事件、C Plugin 類別名、D+E 原生類別／檔名與 Android 子套件，全部都改。
2. **規則**：前綴 `cygnus`，去掉 `inapp`。
3. **OTA 相容**：硬切換，不留舊名稱（舊網頁包與新殼互不相容，靠既有的 host 版本需求機制擋住）。
4. **持久化與系統可見名稱**：改名並提供遷移。

## Architecture
**命名規格（規則由使用者定，細節由 agent 展開，待核准時一併確認）**

| 類別 | 舊 | 新 |
|---|---|---|
| A. Channel 前綴 | `com.pichillilorenzo/` | `com.github.knighting.cygnus/` |
| A. Channel 後綴 | `flutter_inappwebview`、`flutter_inappwebview_<x>`、`flutter_inappbrowser[_<id>]`、`flutter_headless_inappwebview[_<id>]`、`flutter_webview_environment`、`flutter_chromesafaribrowser`、`flutter_webauthenticationsession`、`custom_platform_view_<id>` | `webview`、`webview_<x>`、`browser[_<id>]`、`headless_webview[_<id>]`、`webview_environment`、`chromesafaribrowser`、`webauthenticationsession`、`custom_platform_view_<id>`（去掉 `flutter_`、`inapp`；新名稱須先檢查零撞名） |
| B. JS 橋接全域 | `window.flutter_inappwebview`（預設值 `JAVASCRIPT_BRIDGE_NAME`） | `window.cygnus` |
| B. JS 就緒事件 | `flutterInAppWebViewPlatformReady` | `cygnusPlatformReady` |
| B. Web 端互通全域 | `flutterInAppWebView`、`createFlutterInAppWebView`、型別 `FlutterInAppWebViewBridge` | `cygnusWeb`、`createCygnusWebView`、`CygnusWebBridge` |
| B. JS 內部變數與佔位符 | `_flutter_inappwebview_*`（181 處）、`$IN_APP_WEBVIEW_*` | `_cygnus_*`、`$CYGNUS_*` |
| C. pluginClass | `InAppWebViewFlutterPlugin`（Android／iOS／macOS／Web）、`FlutterInappwebviewWindowsPluginCApi`、`FlutterInappwebviewLinuxPlugin` | `CygnusCorePlugin`、`CygnusCorePluginCApi`、`CygnusCorePlugin`；Linux／Windows 的標頭檔與註冊函式名依 Flutter 慣例隨之改為 `cygnus_core_plugin*` |
| D. 原生類別 | `InApp*` 等 | 與 Dart 同一套規則：前綴 `Cygnus`、移除 `InApp`（例：`InAppWebView` → `CygnusWebView`）；理由：去掉 `InApp` 後會與 `android.webkit.WebView` 等平台類別同名，C++ 全域符號也須避免與同進程的舊套件衝突 |
| D. C++ 命名空間 | `flutter_inappwebview_plugin`（194 個檔案） | `cygnus_core_plugin` |
| D+E. 原生檔名與 Android 子套件 | `in_app_*`、`*inappwebview*`（Android 27／iOS 24／macOS 25／Windows 29／Linux 35 個檔名） | 與階段 ② 路徑規則相同：去掉 `in_app_`、`inappwebview` → `webview`；類別檔名跟著類別名 |
| F. 持久化 | Android `CredentialDatabase.db` | 改名並於首次開啟時搬移舊檔（資料不遺失） |
| F. 系統可見 | FileProvider authority `<applicationId>.flutter_inappwebview_android.fileprovider`；intent key `com.pichillilorenzo.flutter_inappwebview.ChromeCustomTabs.*` | `<applicationId>.cygnus_core.fileprovider`；`com.github.knighting.cygnus.ChromeCustomTabs.*`；`example` 的 manifest 同步 |

**執行原則**
1. **以腳本與對照表為單一依據**，新增 `doc/native-rename-map.md` 記錄全部名稱對照。
2. **channel／JS／plugin 是「Dart ↔ 五個原生端」共用的字串**，每一個必須在所有端同時改；以「改名前後各端的字串集合（排序後）逐一對照」驗證沒有任何一端漏改或改錯。
3. **改名後的新名稱先檢查零撞名**（含與 `android.webkit.*`、Apple／Windows／GTK 平台類別）。
4. **Android 建置為編譯器守門**；iOS／macOS 以 `xcodebuild`（透過 `flutter build`）守門；**Windows／Linux 無法在本機編譯**，只能做靜態一致性檢查並列入人工收尾事項（風險最高的部分，見 Open Questions Q3）。
5. **Dart 面保持階段 ② 的結果**，只改與原生／JS 溝通的字串、plugin 宣告與 `pubspec.yaml`。
6. 大量檔案的機械式改名可分批平行處理（沿用 Kotlin 計畫的 worktree 分批作法）。

**使用端（另一份計畫，不在本 repo）**：`nuxt-flutter-app` 的 `packages/cygnus` TypeScript（`window.flutter_inappwebview` → `window.cygnus`）、`flutter-host` 的 `ref` 更新與 host 版本需求，由該 repo 自己的計畫處理（見 Cross-Repo Scope）。

## Cross-Repo Scope
- **`KNightING/cygnus_core`（提供方，本計畫）**：A–F 全部。完成後打新 tag（建議 `0.1.0`）。
- **`KNightING/nuxt-flutter-app`（消費方，另立計畫，共用 `2610152204` 時戳）**：`packages/cygnus` 的 TS、`flutter-host` 的 `ref` 改新 tag、host／網頁包版本需求（硬切換的相容閘）、wiki；milestone 與版本由該計畫詢問。
- **執行順序**：本 repo 先、使用端後；使用端的前提是新 tag 已存在。

## Impact Files
> 路徑相對本 repo 根目錄；數字為 Phase 0 實測。
- **Channel**：Dart 94 個檔案、Kotlin 24、Swift 39、C++／標頭 36（`com.pichillilorenzo/` 字串）；例：`lib/src/platforms/android/src/platform_util.dart:7`、`android/src/main/kotlin/com/github/knighting/cygnus/core/PlatformUtil.kt`
- **JS**：`android/src/main/kotlin/com/github/knighting/cygnus/core/plugin_scripts_js/JavaScriptBridgeJS.kt`（`JAVASCRIPT_BRIDGE_NAME`）及各平台對應 JS 來源、`web_support/src/index.ts`、`lib/assets/web/web_support.js`、`lib/src/platforms/web/web/js_bridge.dart:48`、`example/integration_test/**`
- **Plugin**：`pubspec.yaml:36-54`（`pluginClass`／`dartPluginClass`）、`android/…/InAppWebViewFlutterPlugin.kt`、`ios/`、`macos/`、`windows/`、`linux/` 的 plugin 檔案與標頭
- **原生類別／檔名**：`android/`（Kotlin 159 檔）、`ios/`、`macos/`、`windows/`、`linux/`；`android/src/main/AndroidManifest.xml`、`proguard-rules.pro`、`res/layout/activity_web_view.xml`、`res/menu/menu_main.xml`（子套件改名連動）
- **持久化／系統名稱**：`android/…/credential_database/CredentialDatabase.kt:84`、`android/…/InAppWebViewFileProvider.kt:8`、`android/…/chrome_custom_tabs/ActionBroadcastReceiver.kt:42`、`example/android/app/src/main/AndroidManifest.xml:59`
- **周邊**：`dev_packages/flutter_inappwebview_internal_annotations`（目錄與套件名）、`example` 套件名與 mock 檔名、`.github/**` 上游文件（若納入範圍）
- `doc/native-rename-map.md` (new) — 對照表
- `.kn-project/project.md`、`AGENTS.md`（紅線 2、3 更新）、`README.md`、wiki — 敘述與路徑

## App-Flow Screens
（本 repo 無 `app-flow.json`，不適用。）

## Open Questions / 待確認事項
### Q1. 範圍、規則、OTA、持久化
- [x] 範圍 A＋B＋C＋D＋E；前綴 cygnus；硬切換；持久化改名並遷移　**決議**：使用者 2026-10-15 選擇　狀態：✅

### Q2. 原生類別是否也加 `Cygnus` 前綴？
- [x] 選項 A：與 Dart 同一套規則（前綴 `Cygnus`、移除 `InApp`）　(建議，理由：去掉 `InApp` 後 `WebView` 會與 `android.webkit.WebView` 同名；與 Dart 對照表一致，可直接重用)
- [ ] 選項 B：只移除 `InApp`，不加前綴
- **決議**：使用者 2026-10-15 核准　狀態：✅

### Q3. Windows／Linux 無法在本機編譯，風險怎麼處理？
> 它們的 C++ 約 `flutter_inappwebview_plugin` 命名空間 194 個檔案加上 plugin 標頭與註冊函式的改名。本機只能做靜態一致性檢查（符號與 include 路徑對照），編譯錯誤要等到人在 Windows／Linux 機器上建置才會發現。
- [x] 選項 A：照做，靜態檢查後列入人工收尾事項，由你在 Windows／Linux 建置驗證　(建議：命名一致性是機械式的，風險集中在遺漏而非邏輯；對照表與計數可大幅降低遺漏)
- [ ] 選項 B：Windows／Linux 的原生類別與檔名改名拆成獨立計畫，等你有建置環境時再做（本計畫仍改它們的 channel／JS／plugin 字串，因為那些必須與 Dart 同步）
- **決議**：使用者 2026-10-15 核准　狀態：✅

### Q4. `dartPluginClass`（各平台註冊類別）是否一併改名？
> `AndroidInAppWebViewPlatform`、`IOSInAppWebViewPlatform`、`MacOSInAppWebViewPlatform`、`WindowsInAppWebViewPlatform`、`LinuxInAppWebViewPlatform` 是 Dart 實作類別，階段 ② 因「實作類別不動」而保留；它們出現在 `pubspec.yaml` 與使用端的 generated registrant。
- [x] 選項 A：改為 `CygnusAndroidWebViewPlatform` 等（移除 `InApp`、加 `Cygnus`）　(建議，理由：這是 `pubspec.yaml` 對外可見的 plugin 宣告，留著會與其餘新命名不一致)
- [ ] 選項 B：維持
- **決議**：使用者 2026-10-15 核准　狀態：✅

### Q5. cygnus_core 完成後的 tag
- [x] `0.1.0`　(建議，理由：Dart 與 channel／JS 均不相容於 `0.0.0`，次版號遞增能表達；仍在 0.x 階段)
- [ ] 其他版號
- **決議**：使用者 2026-10-15 核准　狀態：✅

### Q6. 完成後
- [x] commit + 開 PR，自行合併、做合併後清理（上一輪的選擇；依 Rule 16 本計畫需重新確認）
- [ ] commit + 開 PR，不自動合併
- **決議**：使用者 2026-10-15 核准　狀態：✅

## Manual Follow-ups / 人工收尾事項
- **[合併後]** 在 Windows 與 Linux 機器各建置 `cygnus_core/example`（`flutter build windows`／`flutter build linux`）— 本機（macOS）無法編譯這兩個目標；原生改名只做過靜態一致性檢查
- **[合併後]** 在 Android／iOS／macOS 實機或模擬器實際載入網頁，確認 JS 橋接（`window.cygnus.callHandler`）、InAppBrowser、Cookie、列印；Android 模擬器的 WebView 載入先前會逾時
- **[合併後]** 在已安裝舊版的 Android 裝置上驗證 `CredentialDatabase` 的舊資料遷移（需要事先有儲存的 HTTP 認證）
- **[合併後]** 使用端 `nuxt-flutter-app` 的對應計畫須等本計畫的新 tag 出現後才能開始；舊網頁包與新殼互不相容，上線順序與 host 版本需求需配合

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

## Git Completion Policy
- PR 一律以 `--base main` 顯式指定 base，不依賴 `gh` 的預設值 (Rule 23)。
- Issue 綁定時，每個 commit 訊息與 PR body 都含 `Closes #N`；歸檔後於該 issue 張貼結案留言 (Rule 20)。
- Issue 的關閉發生在合併後清理（內容驗證通過後）。
- commit 一律自動（Rule 17）。
- PR/archive order: Archive automatically triggered on PR request

## References
- 前階段歸檔：`.kn-project/archive/2610140008-merge-into-cygnus-core.md`、`2610142351-dart-naming-cygnus.md`、`2610150052-java-to-kotlin-android.md`；Dart 對照表 `doc/dart-rename-map.md`。
- 使用端的 flutter-host 計畫：`../nuxt-flutter-app/.kn-project/archive/2610152045-flutter-host-cygnus-core.md`。
