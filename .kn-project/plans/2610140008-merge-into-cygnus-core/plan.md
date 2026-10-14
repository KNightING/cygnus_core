<!-- REMINDER: Relative Paths Only! No file:///c:/... -->
# Plan: 2610140008 - merge-into-cygnus-core
- Created: 2026-10-14
- Branch: feature/2610140008-merge-into-cygnus-core
- Issue: KNightING/cygnus_core#1
- Milestone: 0.0.0
- Base Branch: main
- Status: In Progress
- Completed: [Wait for Finish]

## Goals
**階段 ①（共四階段中的第一階段）**：把 8 個互相依賴的 inappwebview 聯邦式套件合併成**一個** Flutter plugin 套件 `cygnus_core`，**行為與對外名稱零變動**。

- 套件名改為 `cygnus_core`；repo 根目錄即套件根目錄（單一 `pubspec.yaml`）。
- 6 個平台（Android、iOS、macOS、Windows、Linux、Web）的 Dart 與原生程式碼都收進同一個套件。
- **不變**：Dart 類別名、Android Java namespace（`com.pichillilorenzo.flutter_inappwebview_android`）、channel 前綴（`com.pichillilorenzo/`）、JS 全域名稱（`window.flutter_inappwebview`）。這些留給階段 ②③。
- 改寫本 repo 治理文件中「不改套件名、與上游零分歧」的鐵則，使其與 `cygnus_core` 的新定位一致。

**不在本計畫範圍**（各自另立計畫）：
- 階段 ②：Dart 公開 API 命名改為 Cygnus 風格（規則由使用者另行定義）。
- 階段 ③：原生端、channel 前綴、JS 全域名稱改名（屆時再決定是否改、改成什麼）。
- 階段 ④：`nuxt-flutter-app` 的 `flutter-host` 改依賴 `cygnus_core`。
- 舊 repo `KNightING/flutter_inappwebview` 的後續處置。
- `flutter-nativeview` 的 native-view 鏡像功能。

## Architecture
**來源**：本 repo 的初始 commit `20baf3e`，內容等同 `KNightING/flutter_inappwebview@1883884f5`（tag `6.2.0-beta.3.6`）的 `main`，不含 git 歷史。

**現況（已驗證）**：
- 主套件 `flutter_inappwebview` 只含 Dart，以 `default_package` 指向 5 個平台實作（`flutter_inappwebview/pubspec.yaml:56-62`）；實作套件各自以 `dartPluginClass` 註冊（例：`flutter_inappwebview_android/pubspec.yaml:52-53`）。
- 所有 Dart 型別集中在 `flutter_inappwebview_platform_interface`（590 檔，其中 269 個 `*.g.dart` 由 build_runner 產生）；7 個套件以 `package:flutter_inappwebview_platform_interface/...` 匯入它。
- Web 實作是 `pluginClass` + `fileName: web/main.dart`，無 `dartPluginClass`（`flutter_inappwebview_web/pubspec.yaml:52-54`）。

**目標佈局**：

```
cygnus_core/                          ← repo 根目錄 = 套件根目錄
├─ pubspec.yaml                       ← name: cygnus_core；version: 0.0.0；6 平台 plugin 宣告
├─ lib/cygnus_core.dart               ← 對外入口（沿用原 flutter_inappwebview.dart 的匯出與 hide 清單）
├─ lib/src/platform_interface/…       ← 原 platform_interface 的 lib/src（含 *.g.dart）
├─ lib/src/platforms/{android,ios,macos,windows,linux,web}/…   ← 原各平台實作的 Dart
├─ android/  ios/  macos/  windows/  linux/                   ← 原各平台原生程式碼
├─ assets/…                           ← t-rex 頁面與 web_support.js
├─ example/                           ← 原主套件 example
└─ dev_packages/{generators, flutter_inappwebview_internal_annotations}/   ← 維持獨立的 path 套件
```

**關鍵設計點**：
1. **Dart 註冊**：一個套件、每個平台只能宣告一次 `dartPluginClass`；各平台實作類別須能從 `package:cygnus_core/cygnus_core.dart` 取得（Flutter 產生的 registrant 以該入口匯入），因此入口對 6 個平台實作採**條件匯出**：`dart.library.js_interop` 為 Web 實作、`dart.library.io` 為原生實作，避免原生建置編入 `dart:js_interop`、Web 建置編入 `dart:io`。
2. **同名衝突**：6 個實作都有 `PlatformUtil`、`CustomPlatformView*` 等同名類別，且有 31 個同檔名；各平台放在 `lib/src/platforms/<平台>/` 獨立目錄，入口只匯出實際需要的符號，不把 6 份一起 `export *`。
3. **原生命名**：Windows 與 Linux 的 CMake 目標、include 目錄須與套件名一致（`cygnus_core`、`cygnus_core_plugin`），否則 Flutter 產生的 registrant 找不到；iOS／macOS 的 podspec 與 SPM package／target 名同理。**只改這些「必須跟套件名一致」的識別字**，plugin 類別名、Java namespace、channel 與 JS 名稱一概不動。
4. **產生器**：`generators` 與 `flutter_inappwebview_internal_annotations` 維持 `dev_packages/` 下的獨立 path 套件（建置器不能與被產生碼同在一個套件，否則循環）；**兩者之間與根 `pubspec.yaml` 對 `flutter_inappwebview_internal_annotations` 的依賴一律改為本地 path（Q4 決議 B），不再依賴 pub.dev 的 `^1.3.0`**；build_runner 的 `generate_for` 範圍（`lib/src/**.dart`）須涵蓋新位置。套件名稱 `flutter_inappwebview_internal_annotations` 本身階段 ① 不改。
5. **驗證方法**：重跑 build_runner，產物應與搬移後的 269 個 `*.g.dart` 完全一致，證明搬移沒有破壞產生碼。

**程式碼風格**：本計畫的程式碼改動將遵守 `kn-project-code-style` 技能規範（Rule 14）；搬移檔案以 `git mv` 保留可追溯性，只在必要處修改內容。

## Cross-Repo Scope
無（單一 repo）。本計畫只動 `KNightING/cygnus_core`。階段 ④ 會牽動 `KNightING/nuxt-flutter-app`，屆時另立計畫、另取核准；本計畫完成後 `flutter-host` 仍依賴舊 repo 的 tag `6.2.0-beta.3.6`，不受影響。

## Impact Files
> 路徑相對於本 repo 根目錄。搬移類以目錄為單位列出，個別檔案以 `git mv` 一次處理。

**套件宣告與入口**
- `flutter_inappwebview/pubspec.yaml:1` (`name`)、`:24-36`（對 7 個套件的 path 依賴）、`:46`（generators）、`:56-62`（`default_package`）、`:68-70`（assets）— 改寫為根目錄 `pubspec.yaml`（new），合併依賴與 6 平台 plugin 宣告
- `flutter_inappwebview/lib/flutter_inappwebview.dart:22`（`library`）、`:24`（匯出 platform_interface 並 hide）、`:36`（`export 'src/main.dart'`）— 搬為 `lib/cygnus_core.dart`（new），保留 hide 清單，加入 6 平台條件匯出
- `flutter_inappwebview_platform_interface/pubspec.yaml:23-24`（hosted `flutter_inappwebview_internal_annotations: ^1.3.0`，path 版本被註解）、`:31-33`（build_runner、generators）— 其依賴併入根 `pubspec.yaml`，annotations 改 `path: dev_packages/flutter_inappwebview_internal_annotations`
- `dev_packages/generators/pubspec.yaml:17-18`（hosted `flutter_inappwebview_internal_annotations: ^1.3.0`，path 版本被註解）— 改為本地 path（Q4 B）

**Dart 樹合併**（`git mv` + 重寫 import）
- `flutter_inappwebview_platform_interface/lib/**` → `lib/src/platform_interface/**`（590 檔，含 269 個 `*.g.dart`）
- `flutter_inappwebview/lib/src/**` → `lib/src/**`（46 檔）
- `flutter_inappwebview_{android,ios,macos,windows,linux,web}/lib/**` → `lib/src/platforms/<平台>/**`（34／31／27／29／27／20 檔）
- 上列所有檔案中的 `package:flutter_inappwebview_platform_interface/...` 與各實作套件的 `package:` 匯入（platform_interface 被 7 個套件匯入：主 29、android 22、ios 18、macos 16、windows 16、linux 15、web 12 個檔案）— 改為 `package:cygnus_core/...`
- `flutter_inappwebview_web/lib/web/main.dart` — Web 的 `fileName` 入口，需對應新位置（plugin 宣告 `flutter_inappwebview_web/pubspec.yaml:53-54`）

**原生端**（搬移並改必要的識別字）
- `flutter_inappwebview_android/android/**` → `android/**`；`build.gradle:1`（`group`）、`:27`（`namespace`）**維持不變**，`settings.gradle:1`（`rootProject.name`）改為 `cygnus_core`
- `flutter_inappwebview_ios/ios/flutter_inappwebview_ios.podspec:6`（`s.name`）、`:16`（`source_files`）、`:19`（`resource_bundles`）與 `ios/flutter_inappwebview_ios/Package.swift:7,12,19` — 改為 `cygnus_core`；Swift 目錄 `Sources/flutter_inappwebview_ios/` 隨之更名；`InAppWebViewFlutterPlugin` 類別名不動
- `flutter_inappwebview_macos/macos/flutter_inappwebview_macos.podspec:6,17,19` 與其 `Package.swift` — 同上
- `flutter_inappwebview_windows/windows/CMakeLists.txt:15`（`PROJECT_NAME`）、`:24`（`PLUGIN_NAME`）— 改為 `cygnus_core`／`cygnus_core_plugin`；`include/flutter_inappwebview_windows/` 目錄更名為 `include/cygnus_core/`；`FlutterInappwebviewWindowsPluginCApi` 不動
- `flutter_inappwebview_linux/linux/CMakeLists.txt:7`（`PROJECT_NAME`）、`:12`（`PLUGIN_NAME`）— 同上；`include/flutter_inappwebview_linux/` 更名
- 5 個平台各自的 `*.dart` 註冊（`dartPluginClass`：`AndroidInAppWebViewPlatform`、`IOSInAppWebViewPlatform`、`MacOSInAppWebViewPlatform`、`WindowsInAppWebViewPlatform`、`LinuxInAppWebViewPlatform`）— 合併進根 `pubspec.yaml` 的 6 平台 plugin 宣告

**產生器與工具**
- `dev_packages/generators/build.yaml`（`builder_factories`、`generate_for`）— 範圍改涵蓋 `lib/src/**`
- `package.json:6-9`（build_runner／watch 的 `cd flutter_inappwebview_platform_interface`）、`:13-14`（`format` 列出 7 個目錄）、`:16-17`（`docs:gen`）— 改為根目錄的新路徑
- `package.json:21-23` 起的 `publish:*`（8 個套件各一組，含 `:windows` 變體）— 依 Q7 保留並**合併為單一 `publish`（與 `publish:windows`）發佈 `cygnus_core`**；只改腳本，本計畫不實際發佈
- `scripts/publish.sh`、`scripts/test.sh`、`scripts/test.ps1`、`tool/env.dart` — 改為新路徑（`publish.sh` 改為單一套件）
- `.vscode/launch.json`（71 處 `flutter_inappwebview`）— 工作目錄改為 `example`
- `.fvmrc` — 維持，不動

**範例與測試**
- `flutter_inappwebview/example/**` → `example/**`；其 `pubspec.yaml` 依賴改為 `cygnus_core: path: ../`
- `flutter_inappwebview/test_driver`、`flutter_inappwebview/example/integration_test/**` — 隨 example 搬移，`import` 改為 `package:cygnus_core/...`
- `flutter_inappwebview_{android,ios,macos,web,windows,linux}/example/**`、`flutter_inappwebview_{android,ios,macos,web}/test/**` — 處置見 Q5

**文件與治理**
- `README.md`（117 處 `flutter_inappwebview`）— 改寫為 `cygnus_core` 說明並標明來源與授權
- `NOTICE`（new）— 註明源自 `pichillilorenzo/flutter_inappwebview`（Apache-2.0），原 `LICENSE` 與各檔版權宣告原樣保留
- `.kn-project/project.md:11-50`（保留鐵則）、`:15-21`（零分歧與不改名）、`:48-50`（PR 目標）、`:52-69`（每台開發機首次 clone 必做）— 改寫為 `cygnus_core` 定位：非 fork、無 `upstream` remote、無 `gh repo set-default` 需求、不再同步上游
- `AGENTS.md:31`（零分歧）、`:35-36`（不改套件名）及「本 repo 特有的三條紅線」整段 — 改寫
- `.kn-project/wiki/features/{android-platform-view-composition,windows-scroll-input,android-back-gesture,keyboard-avoidance}.md` — 更新原生檔案路徑

## App-Flow Screens
（本 repo 無 `app-flow.json`，不適用。）

## Open Questions / 待確認事項
> Q1–Q7 已確認（2026-10-14）；Q8 為 Phase 3 執行中新發現，**確認前不得進入 Phase 4 的清理工作**。決議同步記於 `## Key Decisions`。

### Q1. 套件根目錄放哪裡？ — 影響範圍：整個 repo 佈局
- [x] 選項 A：repo 根目錄就是套件根目錄（根 `pubspec.yaml`）
- [ ] 選項 B：套件放在子資料夾 `cygnus_core/`
- **決議**：A（已對照真實路徑與使用端寫法後確認）　狀態：✅ 已確認

### Q2. 原 platform_interface 的 Dart 檔放在哪？ — 影響範圍：約 590 檔的 import
- [x] 選項 A：整包原樣放進 `lib/src/platform_interface/`，內部相對結構不動
- [ ] 選項 B：攤平到 `lib/src/`
- **決議**：A　狀態：✅ 已確認

### Q3. Web 與原生實作如何隔離？ — 影響範圍：`lib/cygnus_core.dart` 與各平台入口
- [x] 選項 A：以條件匯出（`dart.library.js_interop`／`dart.library.io`）隔離
- [ ] 選項 B：Web 實作改為獨立入口檔
- **決議**：A　狀態：✅ 已確認

### Q4. `flutter_inappwebview_internal_annotations` 怎麼處理？ — 影響範圍：根 `pubspec.yaml`、`dev_packages/generators/pubspec.yaml`、269 個 `*.g.dart`
- [ ] 選項 A：階段 ① 維持依賴 pub.dev 的 `^1.3.0`
- [x] 選項 B：現在就改用 `dev_packages/` 內的本地副本（path 依賴）
- **決議**：B（使用者選擇，與建議不同）　狀態：✅ 已確認

### Q5. 各平台實作套件原有的 `example/` 與 `test/` 怎麼處理？ — 影響範圍：`flutter_inappwebview_{android,ios,macos,web,windows,linux}/example`、`.../test`
- [x] 選項 A：只保留主套件的 `example/`，其餘 6 個 example 與 4 個 `test/` 樁檔移除
- [ ] 選項 B：先比對再併入
- **決議**：A　狀態：✅ 已確認

### Q6. 驗證範圍是否接受？ — 影響範圍：Phase 5
- [x] 是：本機（macOS）驗證 `flutter analyze`、Android debug 建置、iOS／macOS 模擬器建置、Web 建置、build_runner 重跑無差異；Windows 與 Linux 列為人工收尾事項
- [ ] 否
- **決議**：是（使用者本輪只改 Q7、未選 Q6 的變更項，依此視為採建議；若有誤請糾正）　狀態：✅ 已確認

### Q7. `package.json` 的 `publish:*` 與 `scripts/publish.sh` 怎麼辦？ — 影響範圍：`package.json`、`scripts/publish.sh`
- [ ] 選項 A：移除
- [x] 選項 B：保留並改為發佈單一 `cygnus_core`
- **決議**：B（使用者選擇，與建議不同；只改腳本，本計畫不實際發佈）　狀態：✅ 已確認

### Q8. 舊套件資料夾裡剩下的非程式碼檔怎麼處理？ — 影響範圍：8 個舊套件資料夾（`flutter_inappwebview*/`）的 `CHANGELOG.md`、`LICENSE`、`README.md`、`analysis_options.yaml`、`build.yaml`、`.metadata`、`.gitignore`；`flutter_inappwebview_linux/WPE_BACKEND.md`；`flutter_inappwebview/.vscode`、`.fvmrc`
- [ ] 選項 A：保留有價值的、合併重複的後刪除舊資料夾　(建議，理由：上游歷史與設定不遺失，又不留 8 份重複檔)
  - 8 份 `CHANGELOG.md` → 搬到 `doc/upstream-changelogs/<原套件名>.md`，保留上游出處
  - 8 份 `LICENSE` → 先以 md5 確認內容相同，只保留根目錄一份
  - 8 份 `README.md` → 有用的說明併入新的根 `README.md`，其餘刪除
  - 3 份不同的 `analysis_options.yaml` 與 `build.yaml` → 逐份比對後合併為根目錄各一份，避免 lint／產生器設定悄悄放寬
  - `WPE_BACKEND.md` → 搬到 `doc/linux-wpe-backend.md`；`.metadata`、`.gitignore`、`.vscode`、`.fvmrc` 依需要併入根目錄
- [ ] 選項 B：全部直接刪除（歷史仍可從初始 commit 與上游 repo 查到）
- **決議**：_(待使用者勾選)_　狀態：⏳ 待確認

## Manual Follow-ups / 人工收尾事項
- **[合併後]** 在 Windows 機器驗證 `example` 的 `flutter build windows` 與 `flutter run -d windows` 可啟動並載入網頁 — 於 `cygnus_core/example` 執行上述指令 — agent 在 macOS 上無法建置 Windows，且 Flutter 不支援跨平台建置
- **[合併後]** 在 Linux 機器驗證 `example` 的 `flutter build linux` — 於 `cygnus_core/example` 執行，需 WPE WebKit 與 nlohmann_json 依賴 — 同上，本機無 Linux 環境

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

## Git Completion Policy
- **完成後（使用者自訂，Rule 17 三選項之外）**：commit 一律自動；任務完成時 `git fetch` 後 `git rebase origin/main` 工作分支，再於本機 **fast-forward 合併進 `main`** 並 `git push origin main`，**不開 PR**。工作分支另以 `git push --force-with-lease --force-if-includes` 備份到遠端（此動作會重寫遠端工作分支歷史；`main` 的推送是 fast-forward，不改寫）。
- 因為不開 PR，**歸檔不由 PR 觸發**（Rule 13）：Phase 4 通過後依 `AGENTS.md` 的 Phase 5 閘口，由我請求歸檔許可，取得同意才歸檔；歸檔 commit 也直接進 `main`。
- Issue 綁定時，**每個 commit 訊息**都必須含 `Closes #${N}`（`${N}` 取自上方 `- Issue:`，**不是** `${ID}`）；commit 推到預設分支 `main` 時 GitHub 會自動關閉該 issue。歸檔完成後於該 issue 張貼由 archive 蒸餾的結案留言 (Rule 20)。
- 不建版本分支，Rule 26 的 `0.0.0 → main` Merge PR 不適用（見 `## Key Decisions`）。
- `main` 是公開 repo 的預設分支，每次 push 前須確認內容已通過 Phase 4 的驗證；遠端 `main` 與本機分歧時只回報，不自動 rebase 他人提交 (Rule 9)。

## References
- 掃描報告（本對話）：`KNightING/flutter_inappwebview@1883884f5` 的套件結構、原生入口、產生器與命名衝突；`KNightING/nuxt-flutter-app@f8d59e4` 對該 fork 的依賴（`flutter-host/pubspec.yaml:18-25`、`flutter-host/lib/main.dart:6`、`packages/cygnus/src/index.ts:49`）。
- 本 repo 既有規則：`.kn-project/project.md:11-50`、`AGENTS.md` 的「三條紅線」——本計畫將改寫它們。
- 歸檔參考：`.kn-project/archive/2610131552-drop-inappwebview-overrides.md`（單一 git 依賴的現況）。
