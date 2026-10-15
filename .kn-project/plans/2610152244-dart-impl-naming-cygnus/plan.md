<!-- REMINDER: Relative Paths Only! No file:///c:/... -->
# Plan: 2610152244 - dart-impl-naming-cygnus
- Created: 2026-10-16
- Branch: feature/2610152244-dart-impl-naming-cygnus
- Issue: KNightING/cygnus_core#10
- Milestone: N/A（未指定）
- Base Branch: main
- Status: In Progress
- Completed: [Wait for Finish]

## Goals
把 Dart 實作層（`lib/src/platforms/**`）、內部類別與 `example/` 自訂類別中殘留的 `InApp` 改為 Cygnus 風格。行為不變；原生端、channel／JS 字串、公開 API 不動。完成後 `lib/` 與 `example/` 除 2 個刻意保留的舊式子類（`CygnusInAppWebViewOptions`、`CygnusInAppBrowserOptions`，階段 ② 為避免與 `CygnusWebViewOptions`／`CygnusBrowserOptions` 同名而保留）外不再有 `InApp`。

## Architecture
1. **規則**：前綴 `Cygnus`、移除 `InApp`（與階段 ② 同一套）；`_` 開頭的私有類別保留底線；2 個同名雙胞胎實作類別（`AndroidInAppWebViewController` → `CygnusAndroidWebViewControllerImpl`、`IOSInAppWebViewController` → `CygnusIOSWebViewControllerImpl`）加 `Impl` 後綴，因公開版已是 `CygnusAndroidWebViewController`／`CygnusIOSWebViewController`。
2. **以 token 腳本改名並先檢查零撞名**（新名不得與 `lib/`、`example/` 現存任何識別字相同）；範圍 `lib/**`、`example/**`、`dev_packages/**` 的 Dart 檔。`*.g.dart` 不含這些名稱，改後以 build_runner 確認零差異。
3. **驗證**：`flutter analyze` 與基準相同（4062 項、0 error）；`example` 單元測試與基準相同的 4 個失敗；Android debug、macOS 建置；macOS 整合測試 `getTitle`、`JavaScript Handler`。

## Cross-Repo Scope
無（單一 repo）。公開 API 與 channel／JS 字串不變，使用端 `nuxt-flutter-app`（釘 tag `0.1.0`）不受影響，也不需要新 tag。

## Impact Files
- `lib/src/platforms/{android,ios,macos,windows,linux,web}/**` — 實作類別、Creation Params、Widget、Browser、Headless；含 `lib/src/platforms/web/web/main.dart`
- `lib/src/platform_interface/**` — `InternalInAppWebViewKeepAlive`、`_InAppWebViewState`（`lib/src/webview/**`）等內部類別與 `lib/cygnus_core.dart:24-38` 的 `hide` 清單
- `example/**/*.dart` — 自訂類別約 13 個（如 `InAppBrowserScreen`、`MyInAppBrowser`、`TestInAppBrowser`、`InAppWebViewFetchTest`）
- `doc/dart-rename-map.md` — 補實作層與內部類別對照
- `.kn-project/wiki/features/android-high-frequency-events.md:53`（`AndroidInAppWebViewController.handleMethod`）、`project.md` — 類別名
- 不動：`android/ ios/ macos/ windows/ linux/ web_support/`、`.github/**`、2 個舊式子類

## App-Flow Screens
（本 repo 無 `app-flow.json`，不適用。）

## Open Questions / 待確認事項
- [x] 雙胞胎命名：加 `Impl` 後綴　**決議**：使用者選擇　✅
- [x] 內部類別一起改（2 個舊式子類不動）　**決議**：使用者選擇　✅
- [x] example 類別：移除 `InApp` 並加 `Cygnus` 前綴　**決議**：使用者選擇　✅
- [x] 完成後：開 PR 並自行合併、做合併後清理，不打新 tag　**決議**：使用者選擇　✅

## Manual Follow-ups / 人工收尾事項
無。本計畫只動 Dart 與 `example`，不涉及 migration、環境變數、部署設定或第三方主控台；公開 API 與使用端不受影響。（先前計畫遺留的 Windows／Linux 建置驗證、Android 資料庫搬移驗證等仍記在 issue #8 的結案留言。）

## Key Decisions
- **[Phase 0]** 規則：前綴 `Cygnus`、移除 `InApp`；雙胞胎實作類別加 `Impl` 後綴 — 理由：使用者選擇；公開版已佔用不帶 `Impl` 的名稱。
- **[Phase 0]** 內部類別一起改、example 自訂類別同樣前綴 `Cygnus` 並移除 `InApp`；2 個舊式子類不動 — 理由：使用者選擇；階段 ② 已定它們保留 `InApp`。
- **[Phase 0]** 不打新 tag、不動使用端 — 理由：公開 API 與 channel／JS 字串不變。
- **[核准閘]** 使用者的「改」與細節回答視為核准，計畫建立後直接執行 — 理由：使用者明示要改並一次回答所有細節。
- **[核准閘]** 完成後：commit + 開 PR，自行合併、做合併後清理；PR `--base main`；完成時 `git fetch` 後 `git rebase origin/main` 並以 `--force-with-lease --force-if-includes` 更新遠端工作分支（已揭露）。

## Git Completion Policy
- PR 一律以 `--base main` 顯式指定 base (Rule 23)。
- 每個 commit 訊息與 PR body 都含 `Closes #10`；歸檔後於該 issue 張貼結案留言 (Rule 20)；關閉發生在合併後清理。
- commit 一律自動（Rule 17）。
- PR/archive order: Archive automatically triggered on PR request

## References
- 前階段歸檔：`.kn-project/archive/2610142351-dart-naming-cygnus.md`、`2610152204-native-bridge-naming-cygnus.md`；對照表 `doc/dart-rename-map.md`。
