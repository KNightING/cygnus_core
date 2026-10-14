# Tasks for 2610142351

## Phase 1 — 逐檔審視（唯讀，不改任何程式碼）
- [x] 以腳本產生更正後的對照表（526 個類型、96 個路徑），檢查零重複、零撞名、全部為 PascalCase 且不是核心型別
- [x] 依 Q1 對 537 個非產生檔案做審視：`flutter analyze` 全部項目分類統計、TODO／FIXME、弃用 API 的使用處、檔案長度、跨平台重複實作、命名不一致處
- [x] 將「優化候選」整理成清單回報給使用者（只收集，不修改）

## Phase 2 — 產生器與型別改名
- [x] 更新 `dev_packages/generators/lib/src/exchangeable_object_generator.dart` 中 `WebUri`、`EnumMethod` 的字串比對與輸出
- [x] 以腳本對 `lib/**`、`example/**` 的 Dart 檔套用對照表（`lib/src/platforms/**` 排除 7 個同名實作類別；`web_support/**`、原生程式碼不動）
- [x] 來源類別 `X_` 改為 `CygnusX_`；`export`／`hide` 清單同步
- [x] 重新執行 build_runner 產生 `*.g.dart`
- [x] 等價性驗證：把舊產生檔套用對照表，與新產生檔逐檔比對，必須完全一致

- [x] （Q5）小寫識別字（41 種、993 處）移除 `InApp`：先產生對照並檢查撞名，再以腳本替換；不得動到字串字面值（channel／JS 名稱）
## Phase 3 — 檔案與目錄路徑
- [x] 以 `git mv` 去掉 96 個路徑中的 `in_app_`
- [x] 同步更新 `import`／`export`／`part`／`part of` 路徑；確認沒有舊路徑殘留
- [x] （Q6）`lib/**` 內 19 個含 `inappwebview` 的檔名改為 `webview`（`flutter_inappwebview_<平台>.dart` → `flutter_webview_<平台>.dart` 等），並更新 7 個 `library` 指令與 `lib/cygnus_core.dart`、`platforms_native.dart` 的匯出路徑；先確認與 `in_app_` 規則合併後零撞名

## Phase 4 — 文件
- [x] 新增 `doc/dart-rename-map.md`（依 Q4）
- [x] 更新 wiki 7 頁、`project.md`（階段 ② 標記完成）、`doc/linux-wpe-backend.md` 中的類別名稱

## Phase 5 — 驗證
- [ ] `flutter pub get`；整包 `flutter analyze` error 為 0，並與階段 ① 結束時的 4062 項 warning／info 比較
- [ ] 殘留檢查：舊名（完整單字）在 `lib/`、`example/`、文件中只剩 7 個同名實作類別、2 個例外與 TypeScript 端
- [ ] 與初始基準逐檔比對 channel 前綴、JS 全域名稱、Java namespace、plugin 類別名的出現次數，確認**皆未更動**
- [ ] Android debug、Web、macOS、iOS 模擬器建置通過；Android 與 macOS 實際啟動並載入 WebView
- [ ] example 單元測試：與階段 ① 相同的 4 個失敗，不增不減
- [ ] Windows、Linux：僅靜態檢查（Dart 改動不涉及 CMake），建置列於前兩份計畫遺留的人工事項
