<!-- REMINDER: Relative Paths Only! No file:///c:/... -->
# Plan: 2610152309 - release-0-1-1
- Created: 2026-10-15
- Branch: feature/2610152309-release-0-1-1
- Issue: KNightING/cygnus_core#12
- Milestone: N/A（未指定）
- Base Branch: main
- Status: In Progress
- Completed: [Wait for Finish]

## Goals
把 `pubspec.yaml` 版本由 `0.1.0` 改為 `0.1.1`，合併後在 `main` 打並推送 tag `0.1.1`，使使用端能釘到含 Windows／Linux 方法名修正的版本。公開 API、channel、JS 字串不變。

## Architecture
單一設定改動；tag 與 `pubspec.yaml` 的 `version` 一致。

## Cross-Repo Scope
使用端 `nuxt-flutter-app`（計畫 `bridge-global-cygnus`）依賴本 tag；本計畫先完成。

## Impact Files
- `pubspec.yaml:3` — `version: 0.1.0` → `0.1.1`

## App-Flow Screens
（不適用。）

## Open Questions / 待確認事項
無。（使用者於使用端計畫的 Q3 已選擇「在 cygnus_core 打新 tag 0.1.1」並核准；本計畫是該決定的前置。）

## Manual Follow-ups / 人工收尾事項
無。

## Key Decisions
- **[Phase 0]** 版本 `0.1.1`、完成後 commit + 開 PR 並自行合併、做合併後清理，合併後打 tag — 理由：使用者於使用端計畫 Q3、Q4 的核准。

## Git Completion Policy
- PR 以 `--base main` 顯式指定；commit 與 PR body 含 `Closes #12`；歸檔後於 issue 張貼結案留言；commit 一律自動。
- PR/archive order: Archive automatically triggered on PR request

## References
- `.kn-project/archive/2610152244-dart-impl-naming-cygnus.md`（含方法名修正）。
