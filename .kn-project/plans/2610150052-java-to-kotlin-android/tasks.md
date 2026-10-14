# Tasks for 2610150052

## Phase A — 命名空間（Java）
- [x] 取得基準：舊命名空間出現次數、channel／JS／manifest 元件字串快照
- [x] 改 `package`／`import`／完整限定名稱；`git mv` 目錄到 `com/github/knighting/cygnus/core`；`android.print` 墊片不動
- [x] 更新 `build.gradle`、`AndroidManifest.xml`、`pubspec.yaml`、`proguard-rules.pro`、`res/`、`example/android/app/build.gradle` 註解
- [x] `assembleDebug`（example）通過

## Phase B — Kotlin 設定
- [x] 設定 Kotlin 編譯選項；以 1 個檔案試轉，確認混合編譯可行（含 `assembleRelease`）

## Phase C — 分批改寫
- [x] `types`（62 個）
- [x] `webview`、`webview/in_app_webview`、`webview/web_message`
- [x] `chrome_custom_tabs`、`in_app_browser`、`headless_in_app_webview`
- [x] `plugin_scripts_js`、`content_blocker`、`credential_database`、`print_job`、`tracing`、`pull_to_refresh`、`find_interaction`、`service_worker`、`proxy`、`process_global_config`、根目錄 8 個檔案、`android/print` 墊片
- [x] `src/main/java` 不再有 `.java`
- [x] 每批 `assembleDebug` 通過

## Phase D — 文件
- [x] 更新 `project.md`、`AGENTS.md`、`README.md`、wiki 中關於 Java 與命名空間的敘述

## Phase E — 驗證
- [x] `assembleDebug`、`assembleRelease`（R8）通過
- [x] 不變性檢查：channel 名稱、`@JavascriptInterface` 方法名、JS 橋接字串、manifest 元件、FileProvider authority 與基準逐項相同
- [x] `flutter analyze`：0 error、4062 項不變；macOS 整合測試不受影響
- [x] `src/main/java` 無 `.java`；舊命名空間於 `android/` 與 `pubspec.yaml` 零殘留
