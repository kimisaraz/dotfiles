# Karabiner-Elements 設定

## 前提

MacBook USキーボード

## コンセプト

### 既存のキーをできるだけそのまま利用する
- 単体押し・長押しで1つのキーに二重で機能を持たせるようにし、できることを増やす

### 指の負担軽減
- 親指:
  - 左右Commandキーを親指を曲げて押す動作がかなりの指の負担になっているようなので、できるだけCommandキーを押さずに済むようにする
  - SpaceとShiftにCommandキーの機能(Command+英数/かな)を逃がす
  - 長年の癖が抜けないので仕方なくCommandキー単体で英数/かなを送信する機能も残している
- 小指:
  - Emacsで左手小指を酷使するのを避けるため、ReturnにもControl機能を追加
  - Caps Lock(Left Control位置)にもReturn機能を追加し、左右どちらの小指でもControlとReturnを使い分けられるようにする

### Emacs
- Emacs的キーバインディングをできるだけ利用できるようにする


## キーの二重機能 (Dual Function Keys)

- Caps Lock:
  - 単体押し → Return
  - 長押し → Left Control
- Left Control:
  - Caps Lockとして動作(Caps Lockの本来の機能を補完)
- スペース:
  - 単体押し → スペース
  - 長押し → Command
- Return:
  - 単体押し → Return
  - 長押し → Right Control
- 左Shift:
  - 単体押し → 英数
  - 長押し → Shift
- 右Shift:
  - 単体押し → かな
  - 長押し → Shift
- 左Command:
  - 単体押し → 英数
  - 長押し → Command
- 右Command:
  - 単体押し → かな
  - 長押し → Command

単体押し判定タイムアウトは各ルールの `parameters` にある `basic.to_if_alone_timeout_milliseconds` で設定(現在はすべて200ms)
- この時間以内にキーを離すと単体押しと判定、それ以上で長押しとして動作する
- タイムアウト後は単体押しのキーが送信されないことが重要
- Shift / Commandは `basic.to_if_held_down_threshold_milliseconds` (100ms)も設定している


## Emacsキーバインド

特記のないものは「除外アプリケーション」以外の全アプリで有効

### 基本操作
- `Control + g` → Escape(Emacsでのみ無効。ターミナル等では有効)
- `Control + [` → Escape(US/ISO配列。全アプリで有効)
- `Control + ]` → Escape(JIS配列。全アプリで有効)

### カーソル移動
- `Control + b` → ←
- `Control + f` → →
- `Control + n` → ↓
- `Control + p` → ↑
- `Control + a` → `Command + ←`(行頭)
- `Control + e` → `Command + →`(行末)

`Shift` を併用すると選択になる(例: `Control + Shift + f` → `Shift + →`)。

### 編集
- `Control + d` → 前方削除
- `Control + h` → 後方削除
- `Control + k` → `Shift + Command + →`, `Command + x`(行末まで切り取ってクリップボードに入れる)
- `Control + y` → `Command + v`(クリップボードから貼り付け)
- `Control + m` → Return(除外アプリも含め全アプリで有効)
- `Control + i` → Tab

`Control + k` / `Control + y` の注意:
- macOS標準のkillバッファではなくクリップボードを使うため、`Control + k` のたびにクリップボードが上書きされる
- 行末で `Control + k` を押しても改行は削除されない(行が連結されない)

### ページ移動
- `Control + v` → Page Down
- `Option + v` → Page Up

Page Down / Page Upはスクロールするだけで、カーソルは移動しない。

### 単語移動
- `Option + b` → `Option + ←`(単語単位で左)
- `Option + f` → `Option + →`(単語単位で右)
- `Option + d` → `Option + Delete`(単語削除)

### C-x キーストローク(無効化中)
- `Control + x, Control + c` → Command + q(終了)
- `Control + x, Control + f` → Command + o(開く)
- `Control + x, Control + s` → Command + s(保存)

### アプリ別の例外
Office(Excel / PowerPoint / Word)とEclipseは公式ルールの個別定義が優先される:
- Office: `Control + a` → Home、`Control + e` → End、`Control + k` → `Shift + End`, Delete(クリップボードには入らない)
- Eclipse: `Control + a` → `Command + ←`、`Control + e` → `Command + →`

## 除外アプリケーション

以下のアプリではEmacsキーバインドは無効化(アプリ自身がControlキーを使うため、そのまま渡す)：
- Emacs / Aquamacs / Conkeror
- ターミナル(Terminal, iTerm2, Hyper, Alacritty, kitty, Ghostty)
- リモートデスクトップ(Microsoft Remote Desktop, TeamViewer, VNC Viewer, Citrix等)
- 仮想マシン(VMware, Parallels, VirtualBox, UTM等)
- X11 / XQuartz
- Vim(MacVim, VimR)
- Sublime Text
- VSCode(下記の専用ルールで個別に設定)

## VSCode専用設定

VSCodeは除外アプリケーションに含めた上で、専用ルールで以下のみ変換している:
- `Control + b/f/n/p/a/e/d/h/i/m/v`, `Control + [` / `Control + ]` → 上記と同じ
- `Control + k` / `Control + y` は変換しない(VSCode標準の動作のまま)
  - Karabinerで変換すると、選択なしの `Command + x` が行全体を切り取る、内蔵ターミナルのシェル操作が壊れる等の弊害がある
- `Option + b/f/d/v` は変換しない(専用ルールが無効化されているため)

## 検討中の項目

### Control + g → Escape
- 現在: 有効
- 検討: 無効化を検討中(EmacsでControl+gを使える方が有意義かもしれない)

### VSCode専用設定
- 必要ないかもしれない

## 注意事項

### 設定変更後の反映

シンボリックリンクを使用しているため、karabiner.jsonを編集後、変更が自動反映されないかもしれない。

**設定変更後の手順:**
1. karabiner.jsonを編集・保存
2. メニューバーのKarabinerアイコンをクリック
3. 「Restart Karabiner-Elements」を選択
