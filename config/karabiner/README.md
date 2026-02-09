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

### Emacs
- Emacs的キーバインディングをできるだけ利用できるようにする


## デバイス設定

- **Caps Lock** ⇄ **Left Control** 入れ替え


## キーの二重機能 (Dual Function Keys)

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

単体押し判定タイムアウトは250ms
- この時間以内にキーを離すと単体押しと判定、それ以上で長押しとして動作する
- タイムアウト後は単体押しのキーが送信されないことが重要


## Emacsキーバインド

### 基本操作
- `Control + g` → Escape

### カーソル移動
- `Control + b` → 左
- `Control + f` → 右
- `Control + n` → 下
- `Control + p` → 上
- `Control + a` → 行頭
- `Control + e` → 行末

### 編集
- `Control + d` → 前方削除
- `Control + h` → 後方削除
- `Control + k` → 行末まで削除
- `Control + m` → Return

### ページ移動
- `Control + v` → Page Down
- `Option + v` → Page Up

### 単語移動
- `Option + b` → 単語単位で左
- `Option + f` → 単語単位で右
- `Option + d` → 単語削除

### その他
- `Control + i` → Tab

### C-x キーストローク
- `Control + x, Control + c` → Command + q(終了)
- `Control + x, Control + f` → Command + o(開く)
- `Control + x, Control + s` → Command + s(保存)

## 除外アプリケーション

以下のアプリではEmacsキーバインドは無効化：
- Emacs
- Terminal / iTerm2
- リモートデスクトップ
- 仮想マシン(VMware, Parallels, UTM等)
- Vim

## VSCode専用設定

VSCodeではEmacsキーバインドが有効(Control+keys, Option+keys)

## 検討中の項目

### タイムアウト時間の調整
- 現在: 250ms
- 検討: 最大350ms程度まで上げる余地あり(使用感を試している段階)

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
