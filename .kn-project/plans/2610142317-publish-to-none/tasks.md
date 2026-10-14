# Tasks for 2610142317

## Phase 1 — 設定與腳本
- [x] `pubspec.yaml`：在 `version` 之後新增 `publish_to: none`
- [x] `package.json`：移除 `publish:dry`、`publish:dry:windows`、`publish`、`publish:windows` 四條與其上方分隔空行，確認仍是合法 JSON
- [x] 刪除 `scripts/publish.sh`
- [x] 依 Q1 處理 `.github/instructions/general.instructions.md:159`

## Phase 2 — 文件
- [x] `.kn-project/project.md:26-28`：改寫「不發佈 pub.dev」一條，反映 `publish_to: none` 已強制、發佈腳本已移除

## Phase 3 — 驗證
- [x] `flutter pub get` 成功；整包 `flutter analyze` 不再有 `invalid_dependency`，且 error 數維持 0（4062 項，error 0；原 4063 項少了那一則 warning）
- [x] 確認 `publish_to: none` 生效：實際發佈被 pub 拒絕（以臨時空套件安全驗證）；**`--dry-run` 不被拒絕**，與計畫初稿的預期不同，已更正並新增 Q2
- [x] `npm run` 清單已無任何 publish 腳本；全 repo grep 無 `publish.sh`、`pub publish` 殘留（歷史歸檔除外）（`npm` scripts 已無 publish；grep 僅剩 `project.md` 的說明文字）
