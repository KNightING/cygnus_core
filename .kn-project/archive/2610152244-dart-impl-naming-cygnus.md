# 2610152244 - dart-impl-naming-cygnus

- Created: 2026-10-15 22:44 / Archived: 2026-10-16 00:20
- Issue: KNightING/cygnus_core#10
- Milestone: N/A / Base Branch: main

## Summary
Dart 實作層（`lib/src/platforms/**`）、內部類別與 `example` 自訂類別中殘留的 `InApp` 全數改為 Cygnus 風格（75 個名稱，前綴 `Cygnus`、移除 `InApp`），完成後 `lib/`、`example/`、`dev_packages/` 的 Dart 檔除 2 個刻意保留的舊式子類（`CygnusInAppWebViewOptions`、`CygnusInAppBrowserOptions`）外不再有 `InApp`。
與公開類別同名的兩個實作類別加 `Impl` 後綴（`CygnusAndroidWebViewControllerImpl`、`CygnusIOSWebViewControllerImpl`）。同時修正階段 ③ 漏改的一處 Dart↔原生不一致：Windows／Linux 建立平台視圖的 channel 方法名 `createInAppWebView`（Dart 端）與原生端的 `createCygnusWebView` 不符。行為不變；公開 API 與 channel／JS 字串不變，使用端（釘 tag `0.1.0`）不受影響，未打新 tag。

## Cross-Repo Scope
無（單一 repo）。

## Key Decisions
- **[Phase 0]** 規則：前綴 `Cygnus`、移除 `InApp`；雙胞胎實作類別加 `Impl` 後綴 — 理由：使用者選擇；公開版已佔用不帶 `Impl` 的名稱。
- **[Phase 0]** 內部類別一起改、example 自訂類別同樣前綴 `Cygnus` 並移除 `InApp`；2 個舊式子類不動 — 理由：使用者選擇；階段 ② 已定它們保留 `InApp`。
- **[Phase 0]** 不打新 tag、不動使用端 — 理由：公開 API 與 channel／JS 字串不變。
- **[核准閘]** 使用者的「改」與細節回答視為核准，計畫建立後直接執行；完成後 commit + 開 PR，自行合併、做合併後清理（`--base main`，rebase 後 `--force-with-lease --force-if-includes`）— 理由：使用者選擇並已揭露。

## Deviations
- **修正階段 ③ 的遺漏**：階段 ③ 只對原生端套用識別字規則，Dart 端字串 `'createInAppWebView'`（`lib/src/platforms/linux|windows/src/webview/custom_platform_view.dart`）未同步，與原生端改名後的 `createCygnusWebView` 不一致，會使 Windows／Linux 建立平台視圖失敗。階段 ③ 的驗證只比對了 channel 名稱集合，沒有涵蓋 channel 方法名。本計畫的腳本已一併修正，並比對確認 Dart 端已無其他與原生共用且含 `InApp` 的字串；該修正仍未在 Windows／Linux 實機驗證。
- **範圍比預期小**：計畫初稿說明的「約 260 個實作類別」是實作類別總數，實際含 `InApp` 的只有 75 個名稱（宣告約 57 個）。
- **附帶**：Dart 除錯標籤 `flutter_inappwebview_{linux,windows}_custom_platform_view` 改為 `cygnus_core_*`；階段 ③ 歸檔與 wiki 變動紀錄的日期誤寫為 2026-10-16，更正為 2026-10-15。
- **驗證**：`flutter analyze` 4062 項（與基準相同）；build_runner 重新產生無差異；`example` 單元測試 +274 −4（與基準相同的 4 個失敗）；macOS 建置，macOS 整合測試 `getTitle`、`JavaScript Handler` 通過（`getTitle` 在一次與建置並行的執行中出現失敗，重跑通過，未查明原因）；Android debug 建置通過。
- **未能驗證**：Windows／Linux 的實際編譯與執行；`example` 的 `assets/*.html`、`Info.plist` 文字內的 `InApp` 字樣未改（非類別名）。
- 既有問題（未處理）：`example/test` 4 個 UI 測試失敗、wiki-lint 31 項硬閘、`.github/**` 上游文件過時。

## Impact Files
- `lib/src/platforms/{android,ios,macos,windows,linux,web}/**` — 實作類別、Creation Params、Widget、Browser、Headless 與 `custom_platform_view.dart` 的方法名
- `lib/src/webview/**`、`lib/src/platform_interface/**` — `InternalInAppWebViewKeepAlive`、`_InAppWebViewState` 等內部類別；`lib/cygnus_core.dart` 的 `hide` 清單
- `example/**/*.dart` — 自訂類別
- `doc/dart-rename-map.md` — 末段補實作層與內部類別對照
- `.kn-project/project.md`、`.kn-project/wiki/features/android-high-frequency-events.md`、`.kn-project/archive/2610152204-native-bridge-naming-cygnus.md`（日期更正）
- 不動：`android/ ios/ macos/ windows/ linux/ web_support/`、`.github/**`、2 個舊式子類

## Wiki Changes

| 頁面 | 日期 | 版本 | 變動 | Issue | PR |
|---|---|---|---|---|---|
| `features/android-high-frequency-events.md` | 2026-10-15 | — | Dart 實作類別名更新 | [#10](https://github.com/KNightING/cygnus_core/issues/10) | [PR #11](https://github.com/KNightING/cygnus_core/pull/11) |
