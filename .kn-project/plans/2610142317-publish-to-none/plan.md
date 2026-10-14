<!-- REMINDER: Relative Paths Only! No file:///c:/... -->
# Plan: 2610142317 - publish-to-none
- Created: 2026-10-14
- Branch: feature/2610142317-publish-to-none
- Issue: KNightING/cygnus_core#2
- Milestone: N/A（未指定）
- Base Branch: main
- Status: In Progress
- Completed: [Wait for Finish]

## Goals
讓「不發佈 pub.dev」由設定強制落實，而不是只寫在文件裡：在根 `pubspec.yaml` 加上 `publish_to: none`，並移除不再可能成功的發佈腳本，同步修正 `project.md` 中對應的說明。

- 解決先前記錄的牴觸：`annotations` 與 `generators` 為 `path:` 依賴（Q4 B），`flutter pub publish` 本來就會被拒絕（`invalid_dependency`），而發佈腳本卻被保留（Q7 B）。使用者已決定：不發佈，移除腳本。
- 範圍：`pubspec.yaml`、`package.json` 的 4 條發佈腳本、`scripts/publish.sh`、`project.md` 一段說明。
- 不在範圍：版本號與 milestone（本計畫未指定 milestone，不做版本同步）；`.github/**` 的其餘上游文件。

## Architecture
無結構變動。`publish_to: none` 是 pub 的內建欄位：設定後實際執行 `flutter pub publish` 會被拒絕（「A private package cannot be published.」），且 analyzer 不再對 `path:` 依賴回報 `invalid_dependency`。**`--dry-run` 不受影響**，仍會列出內容並做驗證（計畫初稿誤寫為「也被拒絕」，驗證時發現並更正，見 Key Decisions）。`generators` 套件已採同樣寫法（`dev_packages/generators/pubspec.yaml:4`），本計畫沿用其慣例。

**程式碼風格**：改動僅限設定與腳本檔，遵守 `kn-project-code-style` 通用鐵則（Rule 14）：註解置於程式碼上一行、LF 換行、貼合既有風格。

## Cross-Repo Scope
無（單一 repo）。

## Impact Files
- `pubspec.yaml:3`（`version: 0.0.0`）— 其後新增 `publish_to: none`，位置與寫法比照 `dev_packages/generators/pubspec.yaml:4`
- `package.json:19-22`（`publish:dry`、`publish:dry:windows`、`publish`、`publish:windows`）— 四條整段移除，連同其上方分隔用的空行；其餘腳本不動
- `scripts/publish.sh:1-12`（`dartfmt -w .`、`flutter analyze`、`flutter pub publish --dry-run`、`flutter pub publish`）— 整個檔案刪除；全 repo 無其他程式引用它（已 grep 確認）
- `.kn-project/project.md:26-28`（保留鐵則的「不發佈 pub.dev」一條）— 由「`publish` 腳本是保留的意圖，並不能直接成功執行」改寫為「`pubspec.yaml` 以 `publish_to: none` 強制」；移除過時的腳本描述
- `.github/instructions/general.instructions.md:159`（`npm run publish:dry`）— 是否一併處理見 Q1
- 不動：`README.md:23`（「本套件不發佈到 pub.dev」改動後仍然正確）、`.kn-project/project.md:142`（版本紀錄說明）

## App-Flow Screens
（本 repo 無 `app-flow.json`，不適用。）

## Open Questions / 待確認事項
> Q1 已確認（2026-10-14）；Q2 為 Phase 3 驗證時新發現，**確認前不得進入完成流程（歸檔、PR）**。

### Q1. `.github/instructions/general.instructions.md:159` 提到 `npm run publish:dry` 怎麼處理？ — 影響範圍：該檔 1 行
- [x] 選項 A：一併刪除該行
- [ ] 選項 B：不動，留待 `.github` 另案（延續前一份計畫 Q9 的處理方式）
- **決議**：A　狀態：✅ 已確認

### Q2. `publish:dry`、`publish:dry:windows` 與 `scripts/publish.sh` 是否仍要移除？ — 影響範圍：`package.json`、`scripts/publish.sh`（已於 Phase 1 移除，可還原）
> 此題因驗證發現「`--dry-run` 其實不被 `publish_to: none` 拒絕」而新增；先前使用者的選擇是在錯誤說法下做的。
- [ ] 選項 A：維持移除（已執行）　(建議，理由：repo 明定不發佈，發佈相關工具不留，避免誤以為仍可發佈；`--dry-run` 只是驗證套件內容，對一個永遠不發佈的 repo 價值很低)
- [ ] 選項 B：還原 `publish:dry`、`publish:dry:windows` 兩條，只保留「移除真正的 `publish`、`publish:windows` 與 `scripts/publish.sh`」
- **決議**：_(待使用者勾選)_　狀態：⏳ 待確認

## Manual Follow-ups / 人工收尾事項
無。本計畫只改設定與腳本，不涉及 migration、環境變數、部署設定或第三方主控台。（前一份計畫 `2610140008` 的人工收尾事項——Windows／Linux 建置驗證、Apache-2.0 標示確認——仍有效，記錄在 issue #1 的結案留言。）

## Key Decisions
- **[Phase 0]** 不指定 milestone，Base Branch `main` — 理由：使用者選擇；這是小幅設定調整，無需版本標記；Rule 23／24 本計畫停用，不做版本檔同步。
- **[Phase 0]** 「發佈腳本」範圍 = `package.json` 四條（`publish`、`publish:windows`、`publish:dry`、`publish:dry:windows`）＋ `scripts/publish.sh` — 理由：使用者選擇「全部發佈相關」。**原先附的理由「`publish_to: none` 之後 `--dry-run` 同樣被 pub 拒絕」是錯的**（驗證時發現 `--dry-run` 仍會跑完驗證），使用者的選擇是在這個錯誤說法下做的，已於 Phase 3 揭露並重新請示。
- **[Phase 0]** 本計畫為新計畫而非前一份計畫的 Iteration — 理由：`2610140008` 已歸檔結案，這是它留下的牴觸事項的後續處理；依 Rule 16 不沿用前一份的完成流程選擇（直接推 main、不開 PR）。
- **[Q1]** 一併刪除 `.github/instructions/general.instructions.md:159` 那一行 — 理由：它指向本計畫移除的 `npm run publish:dry`，留著會誤導；只動這一行，其餘 `.github` 上游文件維持前一份計畫 Q9 的「另案」。
- **[核准閘]** 完成後：commit + 開 PR（預設；自動歸檔＋wiki，Rule 12 非互動鏈），PR 的 base 為 `main` — 理由：使用者選擇；依 Rule 16 未沿用前一份計畫的「直接併入 main」。完成時會 `git fetch` 後 `git rebase origin/main` 並以 `--force-with-lease --force-if-includes` 更新遠端工作分支（已揭露）。
- **[驗證]** 以一個與本專案無關的臨時空套件、不可達的 pub 服務位址與關閉的 stdin 做安全測試：有 `publish_to: none` 時實際發佈輸出「A private package cannot be published.」；去掉它（對照）則流程一路走到連線服務器才失敗 — 結論：`publish_to: none` 確實讓實際發佈被拒絕，但 `flutter pub publish --dry-run` 仍會執行並做驗證（本 repo 目前只會因缺少 `CHANGELOG.md` 而回報未滿足）。因此 `publish:dry` 系列仍可運作，是否移除成為一個需要使用者重新決定的事項（見 Q2）。

## Git Completion Policy
- PR 一律以 `--base main` 顯式指定 base，不依賴 `gh` 的預設值 (Rule 23)。
- Issue 綁定時，**每個 commit 訊息**與 PR body 都必須含 `Closes #${N}`（`${N}` 取自上方 `- Issue:`，**不是** `${ID}`）。歸檔完成後於該 issue 張貼由 archive 蒸餾的結案留言 (Rule 20)。
- Issue 的關閉發生在**合併後清理**（使用者回報已合併、內容驗證通過），不在歸檔當下 (Rule 21 步驟 6)；commit 關鍵字為保險絲。
- commit 一律自動（Rule 17）。完成時依核准閘的「完成後」選項：選 push 或 PR 才會 `git fetch` 後 `git rebase origin/main` 並更新遠端工作分支（`git push --force-with-lease --force-if-includes`）；選只 commit 則兩者都不做。
- PR/archive order: Archive automatically triggered on PR request

## References
- 前一份計畫的歸檔：`.kn-project/archive/2610140008-merge-into-cygnus-core.md`（`## Deviations` 的「Q4 B 與 Q7 B 互相牴觸」）。
- 前一份計畫的 issue 結案留言：KNightING/cygnus_core#1。
