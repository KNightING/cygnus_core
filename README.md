# cygnus_core

Cygnus 框架（Nuxt 網頁 + Flutter 殼）的 WebView 核心套件：提供 inline WebView、headless WebView 與 in-app browser，涵蓋 Android、iOS、macOS、Windows、Linux 與 Web。

本套件源自 [flutter_inappwebview](https://github.com/pichillilorenzo/flutter_inappwebview)（Apache-2.0），出處與變更見 [NOTICE](NOTICE)。

> **現況（版本 0.0.0）**：原本分散在 8 個套件的程式碼已合併為這一個套件。**Dart 公開 API 已改為 `Cygnus` 風格命名**（例如 `InAppWebView` → `CygnusWebView`，對照見 [doc/dart-rename-map.md](doc/dart-rename-map.md)）；原生端、channel 與 JS 橋接也已改為 Cygnus 風格（channel 前綴 `com.github.knighting.cygnus/`、JS 全域 `window.cygnus`，對照見 [doc/native-rename-map.md](doc/native-rename-map.md)），Android 原生端已全數改寫為 Kotlin，命名空間為 `com.github.knighting.cygnus.core`。各 API 的用法可參考 [inappwebview.dev](https://inappwebview.dev/docs/intro/)，類別名請依對照表換算。

## 平台需求

| 平台 | 需求 |
| :--- | :--- |
| Dart／Flutter | Dart `^3.8.0`、Flutter `>=3.32.0` |
| Android | `minSdk 24` |
| iOS | 15.0 以上 |
| macOS | 12.0 以上 |
| Windows | `PATH` 中需有 [NuGet CLI](https://learn.microsoft.com/en-us/nuget/install-nuget-client-tools?tabs=windows#nugetexe-cli) |
| Linux | 需 WPE 2.0 WebKit，見 [doc/linux-wpe-backend.md](doc/linux-wpe-backend.md) |
| Web | 見下方「Web 使用端設定」 |

## 安裝

本套件不發佈到 pub.dev，以 git 依賴引用：

```yaml
dependencies:
  cygnus_core:
    git:
      url: https://github.com/KNightING/cygnus_core.git
      ref: main # 建議鎖定 tag 或 commit
```

```dart
import 'package:cygnus_core/cygnus_core.dart';
```

各平台的環境設定（Android、iOS、macOS、Windows）請參考 [inappwebview.dev 的安裝說明](https://inappwebview.dev/docs/intro/)，流程與來源套件相同。

### Web 使用端設定

資產路徑隨套件名稱改變。`index.html` 若載入 `web_support.js`，路徑應為：

```
assets/packages/cygnus_core/assets/web/web_support.js
```

（舊的 `assets/packages/flutter_inappwebview_web/assets/web/web_support.js` 不再存在。）

## 目錄結構

```
lib/                  Dart：cygnus_core.dart 為唯一入口
  src/platform_interface/   平台介面與型別（含 build_runner 產生的 *.g.dart）
  src/platforms/<平台>/     各平台的 Dart 實作
android/ ios/ macos/ windows/ linux/   各平台原生程式碼
example/              範例與整合測試
dev_packages/         產生器（generators）與其註解套件
web_support/          Web 端 JS 橋接（TypeScript，建置為 lib/assets/web/web_support.js）
test_node_server/     整合測試用的 Node 伺服器
doc/                  Linux WPE 說明與上游 CHANGELOG
```

## 開發

```bash
# 重新產生 *.g.dart（改動 platform_interface 內帶註解的型別後）
npm run build

# 範例 App
cd example && flutter run

# 整合測試（需先設定 Node 測試伺服器，見 scripts/test.sh）
scripts/test.sh
```

`web_support/` 需要 Node.js：在該資料夾 `npm ci` 後執行 `npm run build`，輸出到 `lib/assets/web/web_support.js`。

## 授權

Apache License 2.0，見 [LICENSE](LICENSE) 與 [NOTICE](NOTICE)。
