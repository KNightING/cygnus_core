# Tasks for 2610140008

## Phase 1 — 可行性 spike：最小合併（Dart 核心 + Android）
> 目的：在大規模搬移前，先證明「單一套件、條件匯出、dartPluginClass 註冊」可行。失敗則停下回報，回 Open Questions，不硬推。
- [x] 版本號同步：根 `pubspec.yaml`（new）的 `version` 設為 `0.0.0`（Rule 24，與 milestone 一致）
- [x] 建立並推送工作分支 `feature/2610140008-merge-into-cygnus-core`（自 `origin/main` 切出；不建版本分支，見 plan.md Key Decisions）
- [x] 建立根 `pubspec.yaml`：`name: cygnus_core`，先只宣告 Android plugin；`flutter_inappwebview_internal_annotations` 與 `generators` 皆為本地 path 依賴（Q4 B）
- [x] `dev_packages/generators/pubspec.yaml:17-18` 的 annotations 依賴改為本地 path
- [x] `git mv` platform_interface、主套件 `lib/src`、Android 實作的 Dart 到新位置
- [x] 重寫上列檔案的 `package:` 匯入；`lib/cygnus_core.dart` 保留 hide 清單
- [x] `flutter pub get`、`flutter analyze` 通過
- [x] 重跑 build_runner：產物與搬移後的 `*.g.dart` 無差異（269 檔逐檔一致，僅 dartdoc 命名空間前綴隨套件改名）
- [x] 搬移 `android/`，`rootProject.name` 改 `cygnus_core`；`example` 以 Android 建置並啟動（確認 `AndroidInAppWebViewPlatform` 註冊成功、頁面能載入）— 已於 Android 模擬器載入 flutter.dev，事件正常記錄，logcat 無外掛錯誤

## Phase 2 — Dart 樹全面合併
- [x] 搬移 ios／macos／windows／linux／web 的 Dart 到 `lib/src/platforms/<平台>/`
- [x] 在 `lib/cygnus_core.dart` 加入 6 平台條件匯出；解決 `PlatformUtil`、`CustomPlatformView*` 等同名類別的匯出衝突（`platforms.dart` 以 `dart.library.js_interop` 切換，原生側只 `show` 各平台註冊類別）
- [x] 重寫全部 `package:flutter_inappwebview_*` 匯入
- [x] 根 `pubspec.yaml` 宣告 6 平台 plugin（含 Web 的 `fileName` 與 `flutter_web_plugins`、`web` 依賴）— 本階段先宣告 android 與 web；ios／macos／windows／linux 隨 Phase 3 的原生端一併宣告，避免宣告了卻沒有原生目錄
- [x] `flutter analyze` 通過；`example` 以 Web 建置（`flutter build web`）通過（analyze 0 error；web 與 Android 建置皆成功）

## Phase 3 — 原生端搬移與必要改名
- [ ] iOS：搬移到 `ios/`，podspec 與 SPM（`Package.swift`）名稱改 `cygnus_core`，Swift 目錄更名
- [ ] macOS：同上
- [ ] Windows：搬移到 `windows/`，`CMakeLists.txt` 的 `PROJECT_NAME`／`PLUGIN_NAME` 與 `include/` 目錄改 `cygnus_core`
- [ ] Linux：同上
- [ ] 確認各平台 plugin 類別名、Java namespace、channel 前綴、JS 全域名稱**皆未被更動**（以 grep 比對初始 commit）

## Phase 4 — 產生器、工具、範例與文件
- [ ] `dev_packages/generators/build.yaml` 的 `generate_for` 涵蓋新位置
- [ ] 根 `package.json`、`scripts/*`、`tool/env.dart`、`.vscode/launch.json` 改為新路徑
- [ ] `publish:*` 與 `scripts/publish.sh` 合併為單一 `cygnus_core` 的發佈腳本（Q7 B；只改腳本、不發佈）
- [ ] `example/`（含 `integration_test`、`test_driver`）搬移並改依賴為 `cygnus_core: path: ../`
- [ ] 移除 6 個實作各自的 `example/` 與 4 個 `test/` 樁檔（Q5 A）
- [ ] 新增 `NOTICE`；改寫 `README.md`
- [ ] 改寫 `.kn-project/project.md` 與 `AGENTS.md` 的保留鐵則與三條紅線
- [ ] 更新 4 個 wiki 頁的原生檔案路徑

## Phase 5 — 驗證
- [ ] `flutter analyze` 全數通過
- [ ] build_runner 重跑，產物與現有 `*.g.dart` 無差異
- [ ] Android debug 建置並於模擬器啟動 `example`
- [ ] iOS 模擬器、macOS 建置通過
- [ ] Web 建置通過
- [ ] grep 確認舊套件名（`flutter_inappwebview_platform_interface` 等）已無殘留匯入
- [ ] 版本檔 Version Gate：根 `pubspec.yaml` `version` 與 milestone `0.0.0` 一致（Rule 24）
- [ ] Windows、Linux 建置：列於人工收尾事項，由使用者驗證

## Phase 6 — 併入 main
- [ ] 上述驗證全部通過後，`git fetch`、`git rebase origin/main`
- [ ] 本機 fast-forward 合併進 `main`，`git push origin main`（不開 PR）
- [ ] 以 `--force-with-lease --force-if-includes` 備份推送工作分支
- [ ] 向使用者請求歸檔許可（Phase 5 閘口），取得同意後歸檔
