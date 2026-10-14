<!-- REMINDER: Relative Paths Only! No file:///c:/... -->
# Plan: 2610150052 - java-to-kotlin-android
- Created: 2026-10-15
- Branch: feature/2610150052-java-to-kotlin-android
- Issue: KNightING/cygnus_core#6
- Milestone: N/A（未指定）
- Base Branch: main
- Status: In Progress
- Completed: [Wait for Finish]

## Goals
把 Android 原生端的 Java 完整改寫為 Kotlin，並把命名空間改為 `com.github.knighting.cygnus.core`。行為不變：Dart 端、其他平台、channel／JS／`pluginClass` 名稱都不動。

1. `android/src/main/java` 的 159 個 `.java`（約 24,500 行）全數改寫為 `.kt`，置於 `android/src/main/kotlin`；完成後 `src/main/java` 不再有 Java 檔。
2. 命名空間 `com.pichillilorenzo.flutter_inappwebview_android` → `com.github.knighting.cygnus.core`（使用者指示「順便改 namespace」，目標名稱由 agent 依 `nuxt-flutter-app` 的 `com.github.knighting.*` 慣例選定，見 Key Decisions）。子套件名稱（`in_app_browser`、`headless_in_app_webview`、`webview.in_app_webview` 等）本計畫不改。
3. 不引入行為變更；不順手重構、不修 bug（發現的問題只記錄）。

**不在範圍**：Dart 端、iOS／macOS／Windows／Linux 原生端、channel 前綴 `com.pichillilorenzo/`、JS 全域名稱、`pluginClass`、FileProvider authority 字串、`example` 應用程式的 applicationId（階段 ③）。

## Architecture
**先改命名空間、再轉語言，每一步都能單獨建置驗證。**

1. **步驟 A：命名空間（仍為 Java）** — `package`／`import`／完整限定名稱、`build.gradle` 的 `group`／`namespace`、`AndroidManifest.xml`、`pubspec.yaml` 的 `package:`、`proguard-rules.pro`、`res/` 內的自訂 View 與 `tools:context`；目錄 `git mv` 到新套件路徑；`package android.print` 墊片不動。以 `assembleDebug` 驗證。
2. **步驟 B：Kotlin 支援** — AGP 9.3.0 內建 Kotlin，`build.gradle` 設定 Kotlin 編譯選項（jvm target 17）；先以 1 個檔案試轉，確認混合編譯可行。
3. **步驟 C：分批改寫** — 依目錄分批（`types` 62 個、`webview`、`chrome_custom_tabs`、其餘），每批轉換後 `git mv` 到 `src/main/kotlin` 並以 `assembleDebug` 驗證；轉換以 Kotlin 慣用寫法為主，但必須保持：公開方法簽名（Dart 經 channel 以字串呼叫，不受影響）、`@JavascriptInterface` 方法、被 `proguard-rules.pro` 保留的類別、被反射或 `Parcelable` 使用的成員。
4. **驗證** — `assembleDebug`／`assembleRelease`（含 R8 混淆）、`flutter analyze`、字串不變性檢查（channel 名、`@JavascriptInterface` 方法名、JS 橋接字串、manifest 元件）逐項與基準相同。

## Cross-Repo Scope
無（單一 repo）。

## Impact Files
> 路徑相對於本 repo 根目錄。
- `android/src/main/java/**`（159 個 `.java`，24,557 行）→ `android/src/main/kotlin/com/github/knighting/cygnus/core/**/*.kt`；其中 `android/src/main/java/android/print/` 墊片同樣改寫並保留 `package android.print`
- `android/build.gradle:1,27` — `group`、`namespace`；新增 Kotlin 設定
- `android/src/main/AndroidManifest.xml:3,8,13,17,21,26,29` — `package` 與 6 個元件的 `android:name`
- `pubspec.yaml:37` — Android 的 `package:`
- `android/proguard-rules.pro:11,17` — 保留規則中的類別路徑
- `android/src/main/res/layout/activity_web_view.xml:10,24,29,33`、`android/src/main/res/menu/menu_main.xml:6` — 自訂 View 與 `tools:context`
- `example/android/app/build.gradle:49` — 註解中的 `R.menu.menu_main` 路徑
- `.kn-project/project.md`、`AGENTS.md`、`README.md`、`.kn-project/wiki/features/`（含 Java 路徑與命名空間的段落）— 敘述更新
- 不動：`lib/**`、`ios/ macos/ windows/ linux/`、`web_support/`、`.github/**`

## App-Flow Screens
（本 repo 無 `app-flow.json`，不適用。）

## Open Questions / 待確認事項
> 使用者已指示（`/goal`）直接完成全部計畫並離席，提問窗口已於開工前用掉；以下決議為使用者回答與 agent 依預設判斷的結果，皆記於 Key Decisions。

### Q1. Kotlin 工作與階段 ② 同 PR 或另開？
- [x] 另開計畫＋issue＋PR　**決議**：使用者選擇　狀態：✅

### Q2. 命名空間
- [x] 一併更換　**決議**：使用者選擇「順便改 namespace」；目標名稱使用者未指定，由 agent 選定 `com.github.knighting.cygnus.core`　狀態：✅（目標名稱為 agent 判斷，已於回報揭露）

### Q3. Android 執行期驗證標準
- [x] 以建置為準，未能驗證處如實標註　**決議**：使用者選擇；模擬器上 WebView 載入逾時（基準版同樣逾時）　狀態：✅

### Q4. 完成後收尾範圍
- [x] 開 PR 並自行合併、做合併後清理　**決議**：使用者選擇　狀態：✅

## Manual Follow-ups / 人工收尾事項
- **[合併後]** 在實機或可正常載入 WebView 的 Android 裝置驗證：`flutter run` 開啟 `example`，確認 WebView 載入、JS 橋接（`callHandler`）、InAppBrowser、Chrome Custom Tabs、Cookie、列印可用 — 於 `cygnus_core/example`；模擬器環境的 WebView 載入逾時，本計畫無法驗證執行期
- **[合併後]** 若有下游專案在 R8 規則或反射中引用舊命名空間 `com.pichillilorenzo.flutter_inappwebview_android`，需同步更新

## Key Decisions
- **[Phase 0]** 與階段 ② 分開，另開計畫、issue 與 PR — 理由：使用者選擇；改名與轉語言的 diff 都很大，分開才能單獨審查與還原。
- **[Phase 0]** 命名空間一併更換 — 理由：使用者選擇「順便改 namespace」。
- **[Phase 0]** 目標命名空間 `com.github.knighting.cygnus.core` — 理由：使用者未指定；沿用 `nuxt-flutter-app` 的 `com.github.knighting.*` 慣例，並以 `.cygnus.core` 對應套件名而避免底線；此為 agent 判斷，使用者若要別的名稱，全專案以腳本可一次改回。
- **[Phase 0]** 子套件名稱不改、channel／JS／`pluginClass`／FileProvider authority 不改 — 理由：它們是 Dart／JS／其他平台共用字串或超出「Java 命名空間」，屬階段 ③。
- **[Phase 0]** Android 執行期以建置通過為準 — 理由：使用者選擇；模擬器 WebView 載入逾時，基準版同樣逾時。
- **[Phase 0]** 完成後 commit + 開 PR 並自行合併、做合併後清理 — 理由：使用者選擇；base 為 `main`。
- **[Phase 0]** 使用者的 `/goal` 指示（「直接完成所有計畫」）視為對本計畫 Phase 2 核准閘的授權 — 理由：使用者明確要求不中途停下並離席；範圍與四個問題已事先詢問並取得答案。

## Git Completion Policy
- PR 一律以 `--base main` 顯式指定 base，不依賴 `gh` 的預設值 (Rule 23)。
- 每個 commit 訊息與 PR body 都含 `Closes #6`（`- Issue:` 的編號，不是 `${ID}`）；歸檔後於該 issue 張貼結案留言 (Rule 20)。
- Issue 的關閉發生在合併後清理（內容驗證通過後），commit 關鍵字為保險絲 (Rule 21)。
- commit 一律自動（Rule 17）；完成時 `git fetch` 後 `git rebase origin/main`，以 `--force-with-lease --force-if-includes` 更新遠端工作分支。
- PR/archive order: Archive automatically triggered on PR request

## References
- 前一階段歸檔：`.kn-project/archive/2610142351-dart-naming-cygnus.md`（階段 ②）。
- `project.md` 的四階段說明；`AGENTS.md` 紅線 2（原生名稱分階段調整）。
