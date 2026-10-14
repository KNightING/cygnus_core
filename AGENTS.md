# AI Agents 治理與協作指南 (AGENTS.md)

這個資料夾 `.kn-project` 用於存放由 AI Agents 產生的開發文件，協助追蹤專案進度、設計決策與技術規格。

## 強制技能調度：kn:project:precision-workflow-manager

本專案將 **`kn:project:precision-workflow-manager`** 設為核心治理技能。Agent 在執行**任何**任務時，**必須優先啟動此技能**以進行精準工作流 (Phase 0-5) 管理。**不存在任何規模豁免**：純錯字、純註解、純格式、只改一行的變更同樣要走完 Phase 1 分類與 Phase 2 核准閘，沒有直接動手的捷徑。

### 1. 技能啟動條件 (Skill Activation)
當 Agent 接收到包含以下指令或意圖時，**必須主動讀取並調用** `kn:project:precision-workflow-manager`：
- **關鍵行為 (英文)**：`build`, `create`, `modify`, `fix`, `add`, `implement`, `refactor`, `setup`, `optimize`, `change`, `rework`, `debug`.
- **關鍵行為 (中文)**：新增、增加、建立、實作、開發、撰寫、修改、調整、更新、修正、修復、除錯、重構、優化、設定、改寫、串接、整合、規劃、計畫。
- **中文口語**：如「幫我改一下」「這裡怪怪的」「順便加個…」「幫我看看能不能…」，同樣視為觸發。
- **檔案變更**：涉及 `.dart`, `.java`, `.swift`, `.kt`, `.cc`, `.ts` 等邏輯檔案，或 `.kn-project/` 目錄下的文件。

### 2. 治理審核閘口 (Governance Gates)
啟動技能後，Agent 必須遵循技能規範中的審核點：
- **Phase 2 鎖定**：初始化計畫後，Agent **必須停止**並請求使用者核准任務清單，嚴禁跳過。
- **Phase 5 結案**：任務完成後，Agent **必須請求**歸檔許可，未經同意不得自行清理計畫。

程式碼撰寫另需遵守 `kn:project:code-style` 技能。

---

## ⚠️ 本 repo 特有的三條紅線

1. **這是獨立 repo（非 GitHub fork），源自 `pichillilorenzo/flutter_inappwebview`，且不回貢上游。**
   所有推送與 PR 一律針對 `KNightING/cygnus_core`；不要接 `upstream` remote、不要對上游 repo 發 PR。
   出處與授權見 `NOTICE`，`LICENSE` 與各檔的版權宣告必須原樣保留。
2. **對外名稱分階段調整，未經該階段的計畫核准不得更動。** Dart 類別名已於階段 ② 改為 Cygnus 風格；
   Android Java namespace、channel 前綴（`com.pichillilorenzo/`）、JS 全域名稱（`window.flutter_inappwebview`）在階段 ③ 前不得更動——
   它們由 Dart 與五個原生端共用同一個字串，只改一邊會讓橋接靜默失效。改名須另立計畫並逐端同步。
3. **原生建置識別字必須與套件名 `cygnus_core` 一致，`pluginClass` 不得更動。** podspec、Swift Package、
   CMake 的 `PROJECT_NAME`／`PLUGIN_NAME`／`cygnus_core_bundled_libraries` 與 `include/cygnus_core/`
   是 Flutter 產生 registrant 時依套件名解析的；標頭與函式名則由 `pluginClass` 決定。

## 📂 目錄結構

- `.kn-project/`: AI 治理與知識根目錄。
  - `project.md`: 專案入口 (Portal)，含架構總覽與保留鐵則。
  - `wiki/`: 專案百科 (Graph 關聯系統)，由 `kn:project:wikification` 維護。
  - `plans/`: 進行中計畫（資料夾即索引；各計畫的 `plan.md` 內含 `- Status:` 行作為生命週期唯一真相來源，無獨立索引檔）。
  - `archive/`: 已完成計畫的歷史紀錄；資料夾即索引（檔名 = 時間戳 + 描述），無獨立索引檔。

---
[📈 專案入口](./.kn-project/project.md)
