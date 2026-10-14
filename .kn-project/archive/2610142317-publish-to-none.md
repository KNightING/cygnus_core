# 2610142317 - publish-to-none

- Created: 2026-10-14 23:17 / Archived: 2026-10-14 23:29
- Issue: KNightING/cygnus_core#2
- Milestone: N/A / Base Branch: main

## Summary
在根 `pubspec.yaml` 加上 `publish_to: none`，並移除 `package.json` 的 4 條發佈腳本與 `scripts/publish.sh`，讓「不發佈 pub.dev」由設定強制落實。
這解決前一份計畫（`2610140008-merge-into-cygnus-core`）留下的牴觸：`annotations` 與 `generators` 為 `path:` 依賴，實際發佈本來就不可能成功，發佈腳本卻被保留。`project.md` 的對應說明同步改寫，並刪除 `.github/instructions/general.instructions.md` 中指向已移除腳本的一行。

## Cross-Repo Scope
無（單一 repo）。

## Key Decisions
- **[Phase 0]** 不指定 milestone，Base Branch `main` — 理由：使用者選擇；這是小幅設定調整，無需版本標記；Rule 23／24 本計畫停用，不做版本檔同步。
- **[Phase 0]** 「發佈腳本」範圍 = `package.json` 四條（`publish`、`publish:windows`、`publish:dry`、`publish:dry:windows`）＋ `scripts/publish.sh` — 理由：使用者選擇「全部發佈相關」。**原先附的理由「`publish_to: none` 之後 `--dry-run` 同樣被 pub 拒絕」是錯的**（驗證時發現 `--dry-run` 仍會跑完驗證），使用者的選擇是在這個錯誤說法下做的，已於 Phase 3 揭露並重新請示。
- **[Phase 0]** 本計畫為新計畫而非前一份計畫的 Iteration — 理由：`2610140008` 已歸檔結案，這是它留下的牴觸事項的後續處理；依 Rule 16 不沿用前一份的完成流程選擇（直接推 main、不開 PR）。
- **[Q1]** 一併刪除 `.github/instructions/general.instructions.md:159` 那一行 — 理由：它指向本計畫移除的 `npm run publish:dry`，留著會誤導；只動這一行，其餘 `.github` 上游文件維持前一份計畫 Q9 的「另案」。
- **[核准閘]** 完成後：commit + 開 PR（預設；自動歸檔＋wiki，Rule 12 非互動鏈），PR 的 base 為 `main` — 理由：使用者選擇；依 Rule 16 未沿用前一份計畫的「直接併入 main」。完成時會 `git fetch` 後 `git rebase origin/main` 並以 `--force-with-lease --force-if-includes` 更新遠端工作分支（已揭露）。
- **[驗證]** 以一個與本專案無關的臨時空套件、不可達的 pub 服務位址與關閉的 stdin 做安全測試：有 `publish_to: none` 時實際發佈輸出「A private package cannot be published.」；去掉它（對照）則流程一路走到連線服務器才失敗 — 結論：`publish_to: none` 確實讓實際發佈被拒絕，但 `flutter pub publish --dry-run` 仍會執行並做驗證（本 repo 目前只會因缺少 `CHANGELOG.md` 而回報未滿足）。因此 `publish:dry` 系列仍可運作，是否移除成為一個需要使用者重新決定的事項（見 Q2）。
- **[Q2]** 維持移除 `publish:dry`、`publish:dry:windows` 與 `scripts/publish.sh` — 理由：使用者在得知「`--dry-run` 不被 `publish_to: none` 拒絕、仍能驗證套件內容」後仍選擇維持；repo 明定不發佈，發佈相關工具不留。
- **[Q2]** 更正 issue #2 內文中「`--dry-run` 同樣被拒」那一句 — 理由：該句不符事實；使用者同意現在更正（對外寫入）。

## Deviations
- **計畫初稿對 pub 行為的預期有誤，驗證時發現並更正**：初稿（含 `project.md`、計畫與 issue #2 內文）寫「`publish_to: none` 之後 `flutter pub publish --dry-run` 同樣被拒」。實測 `--dry-run` 不受影響、仍會跑完驗證；被拒絕的是**實際發佈**（輸出 `A private package cannot be published.`）。
- **使用者的範圍選擇是在錯誤說法下做的**：「全部發佈相關」是以「`--dry-run` 也被拒絕」為由推薦的。發現後已向使用者揭露並重新請示（新增 Q2），使用者在知情後仍選擇維持移除；issue #2 內文經同意更正。
- **新增 Q2**（計畫原只有 Q1）；除此之外檔案與範圍皆與計畫一致。
- **驗證方式**：實際發佈是否被拒絕，以一個與本專案無關的臨時空套件、不可達的 `PUB_HOSTED_URL` 與關閉的 stdin 安全測試，**未在本 repo 執行任何真正的發佈**；測完臨時檔已刪除。
- **既有問題（與本計畫無關，未處理）**：`.github/instructions/general.instructions.md` 同一段的 `npm run build`／`watch` 仍寫 `flutter_inappwebview_platform_interface`（舊目錄），其餘 `.github/**` 上游文件維持前一份計畫 Q9 的「另案」；`wiki-lint` 仍有 31 項硬閘違規（舊格式，前後數量不變）；`example/test/` 的 4 個 UI 測試失敗。
- **Wiki／README 修剪**：檢查 `.kn-project/wiki`（8 頁）、`README.md`、`AGENTS.md`，沒有任何過時內容（README 的「不發佈到 pub.dev」與 `npm run build` 仍然正確），故無 wiki 變動、無 `## Wiki Changes`。

## Impact Files
- `pubspec.yaml:4` — 新增 `publish_to: none`（位於 `version` 之後，比照 `dev_packages/generators/pubspec.yaml:4`）
- `package.json:14-17` — `scripts` 區塊結尾；移除 `publish:dry`、`publish:dry:windows`、`publish`、`publish:windows` 四條與其上方分隔空行，並修正前一條的尾逗號
- `scripts/publish.sh` — 刪除（全 repo 無其他引用）
- `.kn-project/project.md:26-29` — 改寫保留鐵則中「不發佈 pub.dev」一條
- `.github/instructions/general.instructions.md:159` — 刪除指向 `npm run publish:dry` 的一行
