<!-- REMINDER: Relative Paths Only! No file:///c:/... -->
# Plan: 2610142351 - dart-naming-cygnus
- Created: 2026-10-14
- Branch: feature/2610142351-dart-naming-cygnus
- Issue: KNightING/cygnus_core#4
- Milestone: N/A（未指定）
- Base Branch: main
- Status: In Progress
- Completed: [Wait for Finish]

## Goals
**階段 ②**：把 Dart 公開 API 的類型名稱改為 Cygnus 風格；`cygnus_core` 的 Dart 面不再出現 `InApp` 字樣，並統一以 `Cygnus` 為前綴。行為不變、原生端與 JS 端名稱不動。

**規則（使用者定義，已全部確認）**
1. 所有對外公開類型加 `Cygnus` 前綴。
2. 移除**任何位置**的詞 `InApp`：`InAppWebView` → `CygnusWebView`、`HeadlessInAppWebView` → `CygnusHeadlessWebView`、`IOSInAppWebViewController` → `CygnusIOSWebViewController`。
3. `Platform` 與平台前綴（`Android`／`IOS`／`MacOS`／`Windows`／`Linux`／`Web`）保留，只在最前面加 `Cygnus`。
4. 兩個例外：已弃用的舊式子類 `InAppWebViewOptions` → `CygnusInAppWebViewOptions`、`InAppBrowserOptions` → `CygnusInAppBrowserOptions`（否則與空基底類別 `WebViewOptions`、`BrowserOptions` 同名）。
5. 檔案與目錄名**只去掉 `in_app_` 這個詞**，不加前綴（96 個檔案，含 `*.g.dart`）。
6. 各平台實作內部類別（約 260 個）維持原名；直接改名，**不保留舊名別名**。
7. 4 個不對外匯出的內部名稱不改：`ChannelController`、`Color`（來源 `Color_`）、`IdGenerator`、`Util`。

**數量**：實際改名 **526 個類型名稱**；新名彼此零重複、與現存類別名零撞名；96 個新路徑零重複、零撞名。

**不在範圍**：原生端（Java／Swift／C++）、channel 前綴、JS 全域名稱（階段 ③）；`nuxt-flutter-app` 的 `flutter-host`（階段 ④，它用到 8 個會改名的類型，改名後須同步更新）；`web_support/` 的 TypeScript 型別（與 Dart 類別只是同名）；`.github/**`；各平台實作類別名稱；任何「優化」的實際修改（見 Q1）。

## Architecture
**改名以腳本進行、以對照表為單一依據、以驗證證明等價**，不靠人工逐檔編輯。

1. **對照表是唯一依據**：`doc/dart-rename-map.md`（new）列出 526 個「舊名 → 新名」與 96 個「舊路徑 → 新路徑」，由腳本自原始碼產生；它同時是階段 ④ 更新使用端、以及使用者遷移的依據。
2. **同名雙胞胎（需依目錄區分）**：`lib/src/platforms/**` 內有 7 個實作類別與要改名的公開類別**同名**（`AndroidInAppWebViewController`、`AndroidServiceWorkerController`、`AndroidWebStorageManager`、`AndroidWebViewFeature`、`IOSCookieManager`、`IOSInAppWebViewController`、`IOSWebStorageManager`）。依範圍規則實作類別不動，因此替換在 `lib/src/platforms/**` 內**排除這 7 個名稱**，其餘位置照改；實作檔對其他公開類型的引用仍照改。
3. **字串與註解**：落在字串、註解、dartdoc、`@Deprecated` 訊息中的舊名一併改（Q2）；已查證沒有任何舊類別名流向原生端或 JS 的字串（唯一靠近 `invokeMethod` 的 2 處是 `${...Method.xxx.name}` 的程式碼插值，會被正確改名）；36 個三引號字串經檢視為 `note:` 說明文字，不是 JS。
4. **產生器必須同步更新**：`dev_packages/generators/lib/src/exchangeable_object_generator.dart` 以類別名字串做特殊處理並輸出含名稱的程式碼——`displayString == "WebUri"`（`:405`、`:763`、`:890`）、輸出 `WebUri.uri(...)`、`WebUri('')`（`:408`、`:411`、`:765`、`:767`）、`EnumMethod`（`:438`、`:614`、`:839-861`、`:929-951`）。不更新的話，改名後產生碼會悄悄出錯或編譯失敗。
5. **來源類別與產生檔**：297 個以 `_` 結尾的來源類別（如 `URLRequest_`）改為 `CygnusURLRequest_`；產生器去掉 `_` 產生公開類別；`*.g.dart`（269 個）**不手改、由 build_runner 重新產生**。
6. **等價性驗證（核心）**：重新產生後，把「舊的產生檔套用對照表」與「新產生檔」逐檔比對，必須完全一致；這證明改名沒有改變任何產生邏輯。

**逐檔審視（唯讀）**：在改名之前先對**全部 537 個非產生檔案**做一輪審視，只產出「優化候選」清單，**不做任何修改**（Q1）。

**程式碼風格**：改動遵守 `kn-project-code-style` 通用鐵則（Rule 14）：貼合既有風格、註解置於程式碼上一行、LF 換行；腳本本身是一次性工具，不進版控，對照表進版控。

## Cross-Repo Scope
無（單一 repo）。階段 ④ 將牽動 `KNightING/nuxt-flutter-app`，屆時另立計畫；本計畫完成後該 repo 仍依賴舊 repo `KNightING/flutter_inappwebview` 的 tag `6.2.0-beta.3.6`，不受影響。

## Impact Files
> 路徑相對於本 repo 根目錄；改名類以目錄為單位，數字為原始碼實測。
- `doc/dart-rename-map.md` (new) — 526 個類型與 96 個路徑的新舊對照，兼作遷移說明
- `lib/src/**`（非 `*.g.dart` 共 537 個檔案；含 `lib/src/platform_interface/**`、`lib/src/<app-facing>`、`lib/src/platforms/**`）— 類型名稱、註解、dartdoc、訊息字串改名；`platforms/**` 內排除 7 個同名實作類別
- `lib/src/**/*.g.dart`（269 個）— 不手改，重新產生
- `lib/cygnus_core.dart:24-38` — `export` 與 `hide` 清單中的名稱隨之更新（`hide` 內不對外匯出的 4 個內部名稱不改）
- `lib/src/platforms/platforms_native.dart:5-11` — 各平台註冊類別（`AndroidInAppWebViewPlatform` 等）屬實作類別，**不動**，僅確認 `show` 仍成立
- `lib/src/**`中含 `in_app_` 的 96 個路徑 — `git mv` 去掉該詞；同步更新 `import`／`export`／`part`／`part of` 路徑
- `dev_packages/generators/lib/src/exchangeable_object_generator.dart:405,408,411,438,614,763,765,767,839-861,890,929-951` — 隨 `WebUri`、`EnumMethod` 改名更新字串比對與輸出
- `example/**/*.dart`（舊名共 5,199 處／238 個檔案，其中 `example/integration_test` 1,479 處／127 個、`example/test` 257 處／13 個，其餘在 `example/lib`）、`example/test/test_helpers/mock_inappwebview_platform.dart:3` — 隨公開名稱改名；`example` 自己的套件名 `flutter_inappwebview_example` 不動
- `.kn-project/wiki/features/*.md`（7 頁）、`.kn-project/project.md`（6 處，含「階段 ②」的描述）、`doc/linux-wpe-backend.md`（1 處）— 文件中的類別名稱更新；`project.md` 階段 ② 標記為完成
- `README.md` — 無舊類別名，不動
- 不動：`android/` `ios/` `macos/` `windows/` `linux/` 的原生程式碼、`web_support/**`（TypeScript 型別與 Dart 類別同名但屬 JS 端）、`.github/**`（其中的 Copilot 指令文件會因類別改名而過時，延續前一份計畫的「另案」）、`package.json`、`pubspec.yaml`

## App-Flow Screens
（本 repo 無 `app-flow.json`，不適用。）

## Open Questions / 待確認事項
> Q1–Q6 皆已確認（Q5、Q6 於 2026-10-15 確認，範圍因此擴大，需**重新核准**後才進入 Phase 2）。

### Q1. 「檢查每個檔案時順便看有沒有優化的地方」要做到多深？ — 影響範圍：Phase 1 的工作量與成本
> 前提：優化只**收集、不修改**；任何實際的優化改動都需另行核准，不在本計畫內做。
- [x] 選項 A：靜態分析＋腳本掃描涵蓋全部檔案，另對熱點細讀
- [ ] 選項 B：派多個 subagent 逐檔細讀 537 個檔案　(涵蓋最完整，但成本高，且多數檔案是機械重複的平台實作)
- **決議**：A　狀態：✅ 已確認

### Q2. 註解、dartdoc 與訊息字串中的舊名要不要一併改？ — 影響範圍：約 1,000 處字串內的舊名與大量註解
- [x] 選項 A：一併改，含 `@Deprecated('Use XXX instead')` 的訊息與 `{@macro}`／`{@template}` 的 id
- [ ] 選項 B：只改程式碼，字串與註解維持
- **決議**：A　狀態：✅ 已確認

### Q3. 7 個同名雙胞胎的實作類別是否確定維持原名？ — 影響範圍：`lib/src/platforms/**` 內 7 個類別
- [x] 選項 A：維持原名，替換依目錄排除
- [ ] 選項 B：這 7 個實作類別也一併改名
- **決議**：A　狀態：✅ 已確認

### Q4. 對照表 `doc/dart-rename-map.md` 是否進版控？ — 影響範圍：1 個新檔
- [x] 選項 A：進版控
- [ ] 選項 B：只放在歸檔，不放進 `doc/`
- **決議**：A　狀態：✅ 已確認

### Q5. 規則只涵蓋「類型名」，但小寫開頭的識別字（含公開方法名）仍有 `InApp`，要不要一起改？ — 影響範圍：41 種識別字、993 處
> Phase 1 審視發現：`createPlatformInAppWebViewController`、`fromPlatformInAppWebViewControllerCreationParams` 等是**公開方法名**；`_inAppBrowserEventHandler`（721 處）、`_inAppBrowser`（78 處）等是私有欄位。
- [x] 選項 A：公開方法名與私有識別字都依「移除 `InApp`」改（如 `createPlatformInAppWebViewController` → `createPlatformWebViewController`、`_inAppBrowser` → `_browser`）　(建議，理由：改名後公開方法名與類別名一致；私有欄位名只是內部一致性，改動機械)
- [ ] 選項 B：只改公開方法名，私有識別字維持
- [ ] 選項 C：都不改，維持目前「只改類型名」的規則
- **決議**：已確認（2026-10-15）　狀態：✅

### Q6. 檔名與 `library` 指令中仍有 `inappwebview` 連寫的舊品牌名（11 種檔名、7 個 `library` 指令），要不要一起改？ — 影響範圍：11 種檔名共約 17 個檔案、7 個 `library` 指令
> 例：`flutter_inappwebview_android.dart`（各平台 barrel，被 `lib/src/platforms/platforms_native.dart:5-11` 匯出）、`inappwebview_platform.dart`、`platform_inappwebview_controller.dart`。
- [ ] 選項 A：不改，維持目前「只去掉 `in_app_`」的檔名規則　(建議，理由：這些檔名不是公開 API；`flutter_inappwebview_*` 是階段 ③ 處理原生／channel／JS 品牌名時再一併決定較合適)
- [x] 選項 B：一併把 `inappwebview` 改為 `webview`（含 `library` 指令與匯出路徑）
- **決議**：已確認（2026-10-15）　狀態：✅

## Manual Follow-ups / 人工收尾事項
無。本計畫只動 Dart 與文件，不涉及 migration、環境變數、部署設定或第三方主控台。需注意：改名是**破壞性的公開 API 變更**，`flutter-host` 用到的 8 個類型（`InAppWebView`、`InAppWebViewSettings`、`InAppWebViewController`、`ChromeSafariBrowser`、`WebUri`、`URLRequest`、`MixedContentMode`、`ScrollViewContentInsetAdjustmentBehavior`）會在階段 ④ 一併更新，在那之前它仍依賴舊 repo 的 tag，不受影響。（前兩份計畫遺留的 3 項——Windows／Linux 建置驗證、Apache-2.0 標示確認——仍有效，記在 issue #1 的結案留言。）

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

## Git Completion Policy
- PR 一律以 `--base main` 顯式指定 base，不依賴 `gh` 的預設值 (Rule 23)。
- Issue 綁定時，**每個 commit 訊息**與 PR body 都必須含 `Closes #${N}`（`${N}` 取自上方 `- Issue:`，**不是** `${ID}`）。歸檔完成後於該 issue 張貼由 archive 蒸餾的結案留言 (Rule 20)。
- Issue 的關閉發生在**合併後清理**（使用者回報已合併、內容驗證通過），不在歸檔當下 (Rule 21 步驟 6)；commit 關鍵字為保險絲。
- commit 一律自動（Rule 17）。完成時依核准閘的「完成後」選項：選 push 或 PR 才會 `git fetch` 後 `git rebase origin/main` 並更新遠端工作分支（`git push --force-with-lease --force-if-includes`）；選只 commit 則兩者都不做。
- PR/archive order: Archive automatically triggered on PR request

## References
- 前一階段歸檔：`.kn-project/archive/2610140008-merge-into-cygnus-core.md`（階段 ①，結構合併）。
- 命名規則的現況盤點與對照表：本計畫 Phase 0 的原始碼實測（類型 526 個、檔案 96 個）；`project.md` 的階段 ② 說明。
