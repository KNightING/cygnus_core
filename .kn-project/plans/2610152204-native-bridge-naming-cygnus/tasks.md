# Tasks for 2610152204-native-bridge-naming-cygnus

## Phase 1 — 對照表與基準
- [ ] 產生 `doc/native-rename-map.md` 草稿：channel 字串、JS 名稱、plugin 類別、原生類別與檔名、持久化名稱；檢查零撞名
- [ ] 取得基準：各端字串集合（channel、JS 全域與事件、plugin、manifest、authority）與 `@JavascriptInterface` 方法名

## Phase 2 — Channel 與 JS 字串（Dart ↔ 五個原生端同步）
- [ ] Channel 前綴與後綴（Dart、Kotlin、Swift、C++）
- [ ] JS 全域名稱、事件、Web 端互通全域、內部變數與佔位符（原生注入的 JS、`web_support`、`example` 測試）
- [ ] 逐端字串集合對照：改名前後一致、無遺漏

## Phase 3 — Plugin 與 pubspec
- [ ] `pluginClass`（含 Windows／Linux 標頭與註冊函式）、依 Q4 決議的 `dartPluginClass`
- [ ] `pubspec.yaml`、`example` 的 generated registrant 重新產生

## Phase 4 — 原生類別、檔名與 Android 子套件
- [ ] Android（Kotlin 159 檔）：類別、檔名、子套件；`AndroidManifest`、`proguard-rules.pro`、`res/`
- [ ] iOS、macOS（Swift）：類別與檔名
- [ ] Windows、Linux（C++）：類別、命名空間、檔名（靜態檢查）
- [ ] `assembleDebug`／`assembleRelease`、iOS／macOS `flutter build` 通過

## Phase 5 — 持久化與系統可見名稱
- [ ] `CredentialDatabase` 改名與首次開啟的舊檔搬移
- [ ] FileProvider authority、intent key；`example` manifest 同步

## Phase 6 — 文件與驗證
- [ ] `doc/native-rename-map.md` 定稿；更新 `project.md`、`AGENTS.md`（紅線 2、3）、`README.md`、wiki
- [ ] 驗證：analyze 0 error 與基準相同；字串集合對照；Android／macOS 實際啟動；example 單元測試與基準相同
