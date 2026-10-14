# 2610150052 - java-to-kotlin-android

- Created: 2026-10-15 00:52 / Archived: 2026-10-15 02:10
- Issue: KNightING/cygnus_core#6
- Milestone: N/A / Base Branch: main

## Summary
Android 原生端 159 個 Java 檔（約 24,500 行）全數改寫為 Kotlin（`android/src/main/kotlin`），並把命名空間由 `com.pichillilorenzo.flutter_inappwebview_android` 改為 `com.github.knighting.cygnus.core`。
行為不變：Dart 端、其他平台、channel 前綴、JS 全域名稱、`pluginClass`、子套件名稱都未動。`assembleDebug`／`assembleRelease`（R8）通過；24 個 channel 名稱與基準逐一相同；`@JavascriptInterface` 方法齊全；example 在 Android 模擬器可啟動、plugin 註冊成功且無崩潰。**WebView 實際載入未能驗證**（模擬器上基準版同樣逾時）。

## Cross-Repo Scope
無（單一 repo）。

## Key Decisions
- **[Phase 0]** 與階段 ② 分開，另開計畫、issue 與 PR — 理由：使用者選擇；改名與轉語言的 diff 都很大，分開才能單獨審查與還原。
- **[Phase 0]** 命名空間一併更換 — 理由：使用者選擇「順便改 namespace」。
- **[Phase 0]** 目標命名空間 `com.github.knighting.cygnus.core` — 理由：使用者未指定；沿用 `nuxt-flutter-app` 的 `com.github.knighting.*` 慣例，並以 `.cygnus.core` 對應套件名而避免底線；此為 agent 判斷，使用者若要別的名稱，全專案以腳本可一次改回。
- **[Phase 0]** 子套件名稱不改、channel／JS／`pluginClass`／FileProvider authority 不改 — 理由：它們是 Dart／JS／其他平台共用字串或超出「Java 命名空間」，屬階段 ③。
- **[Phase 0]** Android 執行期以建置通過為準 — 理由：使用者選擇；模擬器 WebView 載入逾時，基準版同樣逾時。
- **[Phase 0]** 完成後 commit + 開 PR 並自行合併、做合併後清理 — 理由：使用者選擇；base 為 `main`。
- **[Phase 0]** 使用者的 `/goal` 指示（「直接完成所有計畫」）視為對本計畫 Phase 2 核准閘的授權 — 理由：使用者明確要求不中途停下並離席；範圍與四個問題已事先詢問並取得答案。
- **[Phase C]** 以 12 個 agent 分批平行改寫（依目錄、每批約 2,300 行），各自在獨立 worktree 建置驗證，合併後由單一 agent 統一修跨批次互通錯誤 — 理由：159 個檔案、24,500 行無法逐檔人工完成，且 IDE 轉換器無法無頭執行。
- **[Phase C]** 互通慣例：`static` → `companion object`＋`@JvmStatic`／`@JvmField`／`const val`；public 欄位 `@JvmField`；Kotlin 預設 final，被繼承者一律 `open`；`protected`／package-private 一律放寬為 public 並註解原可見度；`String.split`、`trim`、`toLowerCase` 以保留 Java 語意的寫法取代 — 理由：行為不變。
- **[Phase C]** 發現的可疑原行為只以 `// NOTE:` 標記、不修 — 理由：計畫明定不順手修 bug（清單見 Deviations）。

## Deviations
- **執行方式**：計畫原構想「每批轉完建置驗證」；實際以 12 個 agent 平行改寫，合併後出現約 137 個跨批次編譯錯誤（`Map`／`MutableMap`、可空性、可見度、屬性語法），由一次統一修正解決（`TrustedWebActivity` 的欄位 `builder` 因與父類同名改名為 `twaBuilder`，`InAppWebViewInterface` 的簽名調整為與 `InAppWebView` 一致，`ChannelDelegateImpl.channel` 改為 `protected`）。agent 的 worktree 起初從舊 `main` 建立，缺少命名空間改名，已改用手動建立的 worktree 重做受影響批次。
- **字串不變性檢查**：Java 原始碼 1,865 個字串字面值，Kotlin 端只缺 3 個——舊命名空間的錯誤訊息字串（隨命名空間改名）、一個 `Log.w` 訊息改為字串模板（`"…" + e` → `"…$e"`，結果相同）、`@SuppressWarnings("unchecked")` 註解；多行 JS 字串逐段保留 `+` 串接並跳脫 `$`。
- **Kotlin 空值安全造成的差異**：Java 把 null 靜默傳進 `@NonNull` 參數之處，Kotlin 會在呼叫前 NPE（約 40 處 `!!`，集中在 `InAppWebView.kt` 的設定欄位、各 `fromMap` 的必填欄位、`FindInteractionController` 的 id、`HeadlessInAppWebViewManager.run` 的 id）。Dart 端實際永遠會傳這些值，預期不影響；若 Dart 端日後漏傳，錯誤位置會提前。
- **可見度放寬**：`protected`／package-private 成員改為 public（Kotlin 無 package-private，companion 不能 `protected`），原可見度寫在註解；影響 `LOG_TAG` 等常數、`InputAwareWebView.dispose()`、`ThreadedInputConnectionProxyAdapterView` 等。
- **原樣保留、以 `// NOTE:` 標記的可疑原行為（未修）**：`FlutterWebView.onMethodCall` 的 `clearFormData` 缺 `break` 會落入 `hideInputMethod` 並重複呼叫 `result.success`；`HeadlessInAppWebView.setSize` 高度判斷用了寬度；`InAppWebViewSettings.setLayoutAlgorithm` 的 `switch` fall-through 讓任何值最終變 `TEXT_AUTOSIZING`；`MyCookieManager.flush` 多數路徑不回呼 `result`；`ChromeCustomTabsActivity.mayLaunchUrl` 的 `otherLikelyURLs` 實際被忽略；自訂 scheme 回應把 `contentType` 同時當 mime type 與 encoding；`NoHistoryCustomTabsActivityCallbacks` 可能 `ConcurrentModificationException`；`Util.isIPv6` 會解析主機名稱。
- **Android 執行期**：只驗證 `assembleDebug`、`assembleRelease`（含 R8）與模擬器啟動／plugin 註冊／無崩潰；WebView 載入、JS 橋接、InAppBrowser、Custom Tabs、Cookie、列印均未能驗證（模擬器 WebView 載入逾時，基準版同樣逾時）。
- **命名空間目標名稱為 agent 判斷**：使用者要求「順便改 namespace」但未指定名稱，採 `com.github.knighting.cygnus.core`。
- **未處理**：`.github/instructions/android.instructions.md` 等上游 Copilot 文件仍寫 Java，延續「`.github/**` 另案」；`wiki-lint` 31 項硬閘違規、`example` 4 個 UI 測試失敗為既有問題。

## Impact Files
- `android/src/main/java/**`（159 個 `.java`）→ `android/src/main/kotlin/com/github/knighting/cygnus/core/**/*.kt`（含 `android/print/InAppWebViewPrintDocumentAdapter.kt`）；`src/main/java` 已清空
- `android/build.gradle:1,27,60-65` — `group`、`namespace`、Kotlin `jvmTarget` 17 設定
- `android/src/main/AndroidManifest.xml:3,8,13,17,21,26,29` — `package` 與 6 個元件 `android:name`
- `pubspec.yaml:37` — Android `package:`
- `android/proguard-rules.pro:11,17`、`android/src/main/res/layout/activity_web_view.xml`、`android/src/main/res/menu/menu_main.xml` — 類別路徑
- `example/android/app/build.gradle:49` — 註解中的路徑
- `.kn-project/project.md`、`AGENTS.md`、`README.md`、wiki 的 `android-platform-view-composition.md`、`android-back-gesture.md`、`android-high-frequency-events.md` — 敘述、路徑與行號
- 不動：`lib/**`、`ios/ macos/ windows/ linux/`、`web_support/`、`.github/**`

## Wiki Changes

| 頁面 | 日期 | 版本 | 變動 | Issue | PR |
|---|---|---|---|---|---|
| `features/android-back-gesture.md` | 2026-10-15 | — | Android 原生端改寫為 Kotlin，更新路徑與行號 | [#6](https://github.com/KNightING/cygnus_core/issues/6) | [PR #7](https://github.com/KNightING/cygnus_core/pull/7) |
| `features/android-high-frequency-events.md` | 2026-10-15 | — | Android 原生端改寫為 Kotlin，更新路徑與行號 | [#6](https://github.com/KNightING/cygnus_core/issues/6) | [PR #7](https://github.com/KNightING/cygnus_core/pull/7) |
| `features/android-platform-view-composition.md` | 2026-10-15 | — | Android 原生端改寫為 Kotlin，更新路徑與行號 | [#6](https://github.com/KNightING/cygnus_core/issues/6) | [PR #7](https://github.com/KNightING/cygnus_core/pull/7) |
