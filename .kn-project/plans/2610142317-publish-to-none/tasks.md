# Tasks for 2610142317

## Phase 1 — 設定與腳本
- [x] `pubspec.yaml`：在 `version` 之後新增 `publish_to: none`
- [x] `package.json`：移除 `publish:dry`、`publish:dry:windows`、`publish`、`publish:windows` 四條與其上方分隔空行，確認仍是合法 JSON
- [x] 刪除 `scripts/publish.sh`
- [x] 依 Q1 處理 `.github/instructions/general.instructions.md:159`

## Phase 2 — 文件
- [ ] `.kn-project/project.md:26-28`：改寫「不發佈 pub.dev」一條，反映 `publish_to: none` 已強制、發佈腳本已移除

## Phase 3 — 驗證
- [ ] `flutter pub get` 成功；整包 `flutter analyze` 不再有 `invalid_dependency`，且 error 數維持 0
- [ ] `flutter pub publish --dry-run` 如預期被 pub 以 `publish_to: none` 拒絕（證明設定生效）
- [ ] `npm run` 清單已無任何 publish 腳本；全 repo grep 無 `publish.sh`、`pub publish` 殘留（歷史歸檔除外）
