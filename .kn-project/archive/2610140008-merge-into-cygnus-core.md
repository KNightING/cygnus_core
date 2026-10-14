# 2610140008 - merge-into-cygnus-core

- Created: 2026-10-14 00:08 / Archived: 2026-10-14 23:15
- Issue: KNightING/cygnus_core#1
- Milestone: 0.0.0 / Base Branch: main

## Summary
把 8 個聯邦式 inappwebview 套件合併為單一 Flutter plugin 套件 `cygnus_core`（repo 根目錄即套件根目錄），6 個平台的 Dart 與原生程式碼整併，對外名稱（Dart 類別、Java namespace、channel 前綴、JS 全域名稱）一律不變。
這是 Cygnus 框架 WebView 核心套件化的階段 ①（共四階段）：Dart 命名（②）、原生／channel／JS 命名（③）與 `nuxt-flutter-app` 改依賴（④）各自另立計畫。
新 repo `KNightING/cygnus_core` 為獨立 repo（非 fork，公開，單一初始 commit，不帶上游歷史），工作以 5 個 Phase commit 完成後 fast-forward 併入 `main`，未開 PR、未建版本分支。

## Cross-Repo Scope
無（單一 repo）。階段 ④ 會牽動 `KNightING/nuxt-flutter-app`，屆時另立計畫；本計畫完成後該 repo 的 `flutter-host` 仍依賴舊 repo `KNightING/flutter_inappwebview` 的 tag `6.2.0-beta.3.6`，不受影響。

## Key Decisions
- **[Phase 0]** Milestone `0.0.0`（起始版本）— 理由：使用者選擇；舊的 `6.2.0-beta.3.x` 屬原 inappwebview 系列，對新套件不適用。milestone 已於 2026-10-14 在 `KNightING/cygnus_core` 建立（#1）。
- **[Phase 0]** 整合主幹 `${DEFAULT_BRANCH}` = `main` — 理由：遠端只有 `main` 一條分支，無 `dev` 類候選，依 Rule 23 不詢問。
- **[Phase 0]** 本 repo 為新建（非 GitHub fork），公開、僅一個初始 commit（`20baf3e`）— 理由：使用者決定；初始內容與 `KNightING/flutter_inappwebview@1883884f5` 完全一致，Apache-2.0 授權與版權宣告原樣保留，出處記於 commit 訊息。
- **[Phase 0]** 分階段執行：① 合併成單一套件 → ② Dart 命名 → ③ 原生／channel／JS 命名 → ④ `flutter-host` 換依賴；每階段各自一份計畫與 PR — 理由：使用者決定；每階段可獨立建置驗證，出問題易定位。
- **[Phase 0]** 階段 ① 不改 Dart 類別名、Java namespace、channel 前綴、JS 全域名稱；並改寫 `project.md`／`AGENTS.md` 的「不改名、零分歧」規則 — 理由：使用者確認；先做結構合併，行為不變。
- **[Phase 0]** Dart 命名規則由使用者於階段 ② 前自行定義；JS 全域名稱與 channel 前綴是否更動留到階段 ③ 再問 — 理由：使用者決定／Rule 16 每份計畫獨立決策。
- **[Phase 0]** 版本檔：目前 repo 根目錄無版本檔，各子套件 `pubspec.yaml` 的版本屬套件版本；合併後根 `pubspec.yaml` 為唯一來源，版本設為 `0.0.0` 與 milestone 一致 — 理由：Rule 24，版本號與 milestone 標題一致；非 mobile 且標題無 `+N`，不做 versionCode 檢查。
- **[核准閘前]** **Base Branch = `main`，不建版本分支 `0.0.0`，不開 PR**；工作分支 `feature/2610140008-merge-into-cygnus-core` 開發，完成後本機 fast-forward 合併進 `main` 再 push — 理由：使用者指示「開發階段直接推送 main、不走 PR」並選定此做法。這是對 Rule 23（有 milestone 即以版本分支為 base）的**明示例外**：milestone `0.0.0` 僅作 issue 的版本標記，Rule 26 的 `0.0.0 → main` Merge PR 不適用。理由補充：新 repo 尚無任何使用端依賴 `main`，且工作分支讓中途進度可備份、避免 `main` 停在半套結構。
- **[核准閘前]** 版本檔仍依 Rule 24 同步：根 `pubspec.yaml` 的 `version` 為 `0.0.0` — 理由：與 milestone 標題一致，不因不建版本分支而改變。
- **[Q1]** repo 根目錄即套件根目錄 — 理由：使用者在對照真實路徑與使用端寫法後選擇 A；使用端不需 `path:`。
- **[Q2]** platform_interface 整包放 `lib/src/platform_interface/`，內部相對結構不動 — 理由：保證 269 個 `*.g.dart` 的 `part` 相對路徑不破。
- **[Q3]** 以條件匯出隔離 Web 與原生實作 — 理由：Dart 官方做法，原生建置不編入 `dart:js_interop`。
- **[Q4]** `flutter_inappwebview_internal_annotations` 改用 `dev_packages/` 本地副本（path 依賴），`generators` 一併改 — 理由：使用者選擇 B，不再依賴 pub.dev 上游套件；套件名稱本身階段 ① 不改。
- **[Q5]** 只保留主 `example/`，移除 6 個實作各自的 example 與 4 個 test 樁檔 — 理由：合併後失去所屬套件。
- **[Q6]** 本機驗證 Android／iOS／macOS／Web，Windows 與 Linux 列人工收尾 — 理由：Mac 上無法建置 Windows／Linux。
- **[Q7]** 保留 `publish:*` 並合併為單一套件的發佈腳本 — 理由：使用者選擇 B；本計畫只改腳本，不實際發佈。
- **[執行中]** dartdoc 的 `{@macro}`／`{@template}` 命名空間前綴 `flutter_inappwebview_platform_interface.`（2395 處）與 `flutter_inappwebview.`（3 處）統一改為 `cygnus_core.` — 理由：產生器把「所在套件名」寫進模板名，套件改名後不改會讓 1735 個手寫的 `{@macro}` 指向不存在的模板（`dart doc` 解析失敗）；改完重跑 build_runner，269 個 `*.g.dart` 與原版逐檔比對，扣除此前綴改名後完全一致。屬 `lib/src/**` 範圍內的內容修改，已含於 Impact Files 的目錄級項目。
- **[執行中]** Android／iOS／macOS／Windows／Linux 的 `in_app_webview_controller.dart` 內寫死的內建頁面資產路徑 `packages/flutter_inappwebview/assets/t_rex_runner/...` 改為 `packages/cygnus_core/assets/...`（根 `pubspec.yaml` 的 `assets:` 同步） — 理由：Flutter 以套件名解析 `packages/<套件>/...` 資產路徑，套件改名後舊字串會找不到檔案。計畫原未特別點名，屬 `lib/src/platforms/**` 目錄級項目已涵蓋的內容修改。
- **[執行中]** 根目錄需新增 `analysis_options.yaml`（原三個套件各自有，內容不同） — 理由：合併後只剩一份分析設定；Phase 4 逐檔比對三份差異後合併，避免 lint 規則悄悄放寬。
- **[執行中]** 根 `pubspec.yaml` 在 Phase 2 只宣告 android 與 web；ios／macos／windows／linux 的 plugin 宣告改到 Phase 3 與各自原生目錄一起加入 — 理由：宣告了 `pluginClass` 卻沒有對應原生目錄，使用端 `pod install`／CMake 會直接失敗；與原生搬移放在同一階段才能一起驗證。
- **[執行中]** Web 的資產 `web_support.js` 併入 `lib/assets/web/`，執行期路徑由 `assets/packages/flutter_inappwebview_web/assets/web/web_support.js` 變為 `assets/packages/cygnus_core/assets/web/web_support.js` — 理由：資產路徑以套件名解析；使用端 `index.html` 若硬寫舊路徑需改，列入 README 說明（Phase 4）。
- **[執行中]** Windows／Linux 的 CMake 除 `PROJECT_NAME`、`PLUGIN_NAME` 與 `include/` 目錄外，還須把 `set(flutter_inappwebview_<平台>_bundled_libraries` 改為 `set(cygnus_core_bundled_libraries` — 理由：Flutter 產生的 `generated_plugins.cmake` 以 `${plugin}_bundled_libraries` 取得需隨附的 DLL／so，不改則 WebView2 等函式庫不會被打包（原計畫只列了前三項，屬 `windows/**`、`linux/**` 目錄級範圍內的必要識別字）。
- **[執行中]** 刻意不改：CMake 內的來源檔名（`flutter_inappwebview_windows_plugin.cpp` 等）、`flutter_inappwebview_windows_apply_standard_settings` 輔助函式與 `test/` 檔名 — 理由：來源檔名與標頭檔名由 `pluginClass` 決定（Flutter 產生的 `#include <cygnus_core/flutter_inappwebview_windows_plugin_c_api.h>` 即由它推得），pluginClass 本階段不改；輔助函式只在該 CMake 內自用。
- **[執行中]** Linux `utils/log.h` 以 `"/flutter_inappwebview_linux/"` 切割來源路徑（只影響日誌顯示），改為 `"/cygnus_core/"` — 理由：插件符號連結目錄隨套件名改變，不改則日誌路徑不再被縮短。
- **[執行中]** iOS／macOS：SPM library 名稱改為 `cygnus-core`（套件名的連字號形式）、target 與 podspec 為 `cygnus_core`；iOS 的 `WebView.storyboard` 的 `customModule` 同步改為 `cygnus_core` — 理由：Swift 模組名由 target／podspec 名決定，storyboard 以它解析自訂類別，不改會在執行期找不到 `InAppBrowserWebViewController`。
- **[驗證]** 4 個原生平台＋Android 的對外名稱未被更動 — 依據：與初始 commit 比對 channel 前綴與 JS 全域名稱的逐檔出現次數完全相同，Java `namespace`／`group` 與 plugin 類別名亦未變。
- **[Q8]** 舊套件資料夾的非程式碼檔採「保留有價值、合併重複、再刪除舊資料夾」：CHANGELOG 搬到 `doc/upstream-changelogs/`、LICENSE 確認相同後只留根目錄一份、README 有用內容併入新根 README、三份 `analysis_options.yaml` 與各 `build.yaml` 逐份比對後合併、`WPE_BACKEND.md` 搬到 `doc/linux-wpe-backend.md` — 理由：使用者選擇 A；上游歷史與設定不遺失，也不留重複檔。
- **[Q9]** 只移除 `.github/FUNDING.yml`，其餘 `.github/**`（autolabeler、Copilot instructions／agents、ISSUE_TEMPLATE、PULL_REQUEST_TEMPLATE）留待另案 — 理由：使用者選擇；它們是上游專案的社群文件與路徑指令，非合併所必需，混入本計畫會讓變更失焦；FUNDING.yml 會在公開 repo 頁面顯示上游贊助連結，故先移除。計畫範圍修訂（新增 `web_support/package.json`、`.github/FUNDING.yml`）已於 2026-10-14 經使用者核准（Rule 2）。
- **[執行中]** 合併 `analysis_options.yaml` 的方式為「根目錄一份通用設定＋`lib/src/platform_interface/` 一份子設定（多忽略 4 項）」，而非單一檔案 — 理由：3 份原檔只有 platform_interface 多忽略 `unnecessary_non_null_assertion`、`unused_element`、`unused_element_parameter`、`dead_null_aware_expression`（為產生檔而設）；放到根目錄會放寬全部程式碼的 lint，與 Q8「避免規則悄悄放寬」的目的相反。8 個 `LICENSE` 經 md5 確認完全相同，只留根目錄一份；6 份 `build.yaml` 內容相同，合為根目錄一份。
- **[執行中]** 範例 `example/test/test_helpers/mock_inappwebview_platform.dart:3` 的 `package:flutter_inappwebview_platform_interface/...` 改為 `package:cygnus_core/src/platform_interface/flutter_inappwebview_platform_interface.dart` — 理由：該檔需要未經 `hide` 的完整 platform_interface barrel（主入口 `cygnus_core.dart` 會隱藏部分內部符號）；它是 example 的測試，落在已核准的 `example/**` 範圍內。
- **[執行中]** `scripts/publish.sh` 本來就以根目錄為基準，不需更動；`package.json` 的 `publish` 腳本依 Q7 B 保留，但根 `pubspec.yaml` 因 Q4 B 使用 `path:` 依賴，`flutter pub publish` 會被拒絕（analyzer 回報 `invalid_dependency`）— 理由：Q4 B 與 Q7 B 兩項使用者決定彼此有張力，已寫入 `project.md` 的保留鐵則並於回報中向使用者說明，未自行替使用者取捨。
- **[執行中]** `NOTICE` 以「來源、授權、主要變更、未更動項目」四段撰寫，不另行主張版權；Apache-2.0 §4(b) 對「修改過的檔案」的逐檔標示，本階段僅以 `NOTICE` 與 git 歷史涵蓋（多數檔案的修改只是 `package:` 匯入與 dartdoc 前綴）— 理由：逐檔加註對數百個產生檔與搬移檔不切實際，且 `LICENSE`、各檔原版權標頭皆原樣保留；是否需要更嚴格的逐檔標示留給使用者判斷，列入人工收尾事項。
- **[驗證]** `example/test/` 的單元測試有 4 個失敗（`responsive_phase7_screens_test` 的 `test_all_screens_mobile_no_overflow`、`event_console_widget_test` 的 2 個、`method_tester_widget_test` 的 1 個），**初始 commit 上同樣 4 個失敗**（`+10 -4`，名稱一致，皆為 UI 斷言），非本計畫造成，本計畫不處理 — 理由：與套件合併無關；已列為既有問題。
- **[驗證]** Android 模擬器上的實機驗證有一個環境干擾：使用者的自訂桌面 `github.knighting.avalon.launcher`（設為嚴格偏好的 home）會在約 12–25 秒後把任何 App 切回後台（對照實驗：連系統 Settings 也會被切走），而 example 的 debug 冷啟動要十幾秒才出畫面。改以「進程已初始化後切回前景再立即截圖」取得證據：WebView 載入 flutter.dev，`shouldInterceptRequest`、`shouldInterceptFetchRequest` 事件正常記錄。先前一次空白＋`onReceivedError` 是切到後台造成的暫態（模擬器與主機網路皆正常），重新載入後恢復。這與本計畫的變更無關。
- **[驗證]** 驗證涵蓋範圍：Android（建置＋實際啟動）、macOS（建置＋實際啟動）、Web（建置，含 Wasm 試編譯）、iOS 模擬器（**僅建置**，未實際啟動：此機的 iPad／iPhone 模擬器曾出現 locationd 損壞，與本計畫無關）；Windows、Linux 僅靜態檢查，列入人工收尾事項。

## Deviations
- **完成流程偏離預設**：使用者指定「開發階段直接推送 main、不走 PR」，故不建版本分支 `0.0.0`、不開 PR、不跑 Rule 26 的 `0.0.0 → main` Merge PR；milestone `0.0.0` 只作 issue 的版本標記。歸檔因此不由 PR 觸發，而是經使用者明確許可。
- **計畫範圍執行中修訂（已經使用者核准）**：新增 `web_support/package.json`（建置輸出路徑，功能性必要）與移除 `.github/FUNDING.yml`（Q9）；新增待確認 Q8（舊套件非程式碼檔）、Q9（`.github`）。
- **計畫未列、執行中發現的必要改動**：Windows／Linux 的 `*_bundled_libraries` 變數；iOS storyboard 的 `customModule`；Linux `utils/log.h` 的路徑切割字串；各平台寫死的 `packages/flutter_inappwebview/assets/...` 資產路徑；dartdoc 命名空間前綴（2398 處）；根目錄 `analysis_options.yaml`；example 測試的一處舊 `platform_interface` 匯入。
- **`analysis_options.yaml` 以兩個檔合併而非一個**：根目錄通用設定＋`lib/src/platform_interface/` 子設定（多忽略 4 項），避免放寬全部程式碼的 lint。
- **Wiki 實際只需改 2 頁共 3 行路徑**（計畫原寫 4 頁）；另因「本 fork」措辭過時，修剪 3 頁共 5 行。
- **未實際驗證**：iOS 僅編譯、未啟動（此機模擬器 `locationd` 損壞，與本計畫無關）；Windows、Linux 僅靜態檢查，建置列為人工收尾事項。
- **既有問題（與本計畫無關，未處理）**：(1) `example/test/` 有 4 個 UI 測試失敗，初始 commit 上同樣失敗（`+10 -4`）；(2) `wiki-lint` 對現有 wiki 回報 31 項硬閘違規（格式早於現行規範：舊 `## References`、mermaid、H1 過寬、正文含路徑等），本計畫前後數量相同，`wiki.html` 因此未建置；(3) 整包 `flutter analyze` 另有約 4000 項原本就存在的 warning／info。
- **Q4 B 與 Q7 B 互相牴觸**：`annotations` 與 `generators` 為 `path:` 依賴，`flutter pub publish` 會被 pub 拒絕（`invalid_dependency`），而 `publish` 腳本依 Q7 B 保留。已寫入 `project.md`，未替使用者取捨。
- **環境干擾**：Android 模擬器上的自訂桌面 launcher 會在十幾秒後把任何 App 切到後台，已以「進程初始化後切回前景再截圖」取證。

## Impact Files
> 路徑為合併後的現況（舊路徑已不存在，故不保留舊錨點）；括號內為來源位置。
- `pubspec.yaml` (new)、`analysis_options.yaml` (new)、`build.yaml`（來自 platform_interface）— 單一套件宣告：`name: cygnus_core`、`version: 0.0.0`、6 平台 plugin、`dev_packages/*` 為 path 依賴
- `lib/cygnus_core.dart:24-26`（原 `flutter_inappwebview/lib/flutter_inappwebview.dart`）— 唯一入口，保留 `hide` 清單
- `lib/src/platforms/platforms.dart`、`platforms_native.dart`、`platforms_web.dart` (new) — 以 `dart.library.js_interop` 條件匯出
- `lib/src/platform_interface/**`（原 `flutter_inappwebview_platform_interface/lib/**`，含 269 個 `*.g.dart`）、`lib/src/platform_interface/analysis_options.yaml` (new)
- `lib/src/**`（原主套件 `lib/src/**`）、`lib/assets/**`（t_rex_runner 與 `web_support.js`）
- `lib/src/platforms/{android,ios,macos,windows,linux,web}/**`（原各平台實作 `lib/**`）
- `android/**`（`android/settings.gradle:1` `rootProject.name`；`android/build.gradle:1,27` 的 `group`／`namespace` 未改）
- `ios/cygnus_core.podspec:6,16,19`、`ios/cygnus_core/Package.swift:7,12,19`、`ios/cygnus_core/Sources/cygnus_core/Resources/WebView.storyboard`（`customModule`）
- `macos/cygnus_core.podspec`、`macos/cygnus_core/Package.swift`
- `windows/CMakeLists.txt:15,24,322`、`windows/include/cygnus_core/`、`windows/flutter_inappwebview_windows_plugin_c_api.cpp:1`
- `linux/CMakeLists.txt:7,12,363`、`linux/include/cygnus_core/`、`linux/flutter_inappwebview_linux_plugin.cc:1`、`linux/utils/log.h:20-22`
- `dev_packages/generators/pubspec.yaml:17-18`（annotations 改本地 path）
- `example/**`（原 `flutter_inappwebview/example/**`；`example/pubspec.yaml` 依賴 `cygnus_core: path: ../`；`example/test/test_helpers/mock_inappwebview_platform.dart:3`）
- `package.json`、`scripts/test.sh`、`scripts/test.ps1`、`tool/env.dart:10`、`.vscode/launch.json`（3 組 example 設定）、`web_support/package.json:7`
- `doc/upstream-changelogs/<原套件名>.md`（8 份）、`doc/linux-wpe-backend.md`
- `README.md`、`NOTICE` (new)、`AGENTS.md`、`.kn-project/project.md`
- 已刪除：8 個舊套件資料夾（含 6 個實作各自的 `example/` 與 4 個 `test/` 樁檔）、`.github/FUNDING.yml`
- `.kn-project/wiki/features/android-platform-view-composition.md:113,115`、`android-back-gesture.md:8,53,78`、`keyboard-avoidance.md:90`、`windows-view-geometry.md:53-54`

## Wiki Changes

| 頁面 | 日期 | 版本 | 變動 | Issue | PR |
|---|---|---|---|---|---|
| `features/android-platform-view-composition.md` | 2026-10-14 | 0.0.0 | 8 個 inappwebview 套件合併為單一套件 cygnus_core，修正檔案路徑並移除過時的 fork 措辭 | [#1](https://github.com/KNightING/cygnus_core/issues/1) | — |
| `features/android-back-gesture.md` | 2026-10-14 | 0.0.0 | 8 個 inappwebview 套件合併為單一套件 cygnus_core，修正檔案路徑並移除過時的 fork 措辭 | [#1](https://github.com/KNightING/cygnus_core/issues/1) | — |
| `features/keyboard-avoidance.md` | 2026-10-14 | 0.0.0 | 8 個 inappwebview 套件合併為單一套件 cygnus_core，修正檔案路徑並移除過時的 fork 措辭 | [#1](https://github.com/KNightING/cygnus_core/issues/1) | — |
| `features/windows-view-geometry.md` | 2026-10-14 | 0.0.0 | 8 個 inappwebview 套件合併為單一套件 cygnus_core，修正檔案路徑並移除過時的 fork 措辭 | [#1](https://github.com/KNightING/cygnus_core/issues/1) | — |
