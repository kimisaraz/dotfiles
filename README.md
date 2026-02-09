# dotfiles

個人用の設定ファイル管理リポジトリ

## 構成

- `emacs.d/` - Emacs Preludeベースの設定
  - `personal/` - 個人設定
  - `vendor/` - カスタムパッケージ
- `emacs.d_old/` - Prelude移行前の設定（参照用）
- `config/karabiner/` - Karabiner-Elements設定
  - `karabiner.json` - キーバインド設定

## セットアップ

### 新規環境

```bash
# ghqでクローン
ghq get kimisaraz/dotfiles

# インストールスクリプトを実行
~/works/github.com/kimisaraz/dotfiles/install.sh
```

### 手動セットアップ

```bash
# シンボリックリンクを作成
ln -s ~/works/github.com/kimisaraz/dotfiles/emacs.d ~/.emacs.d
ln -s ~/works/github.com/kimisaraz/dotfiles/config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```

## Preludeの更新を取り込む

```bash
cd ~/works/github.com/kimisaraz/dotfiles
git fetch upstream
git merge upstream/master
# コンフリクトがあれば解決
git push origin master
```

## リモートリポジトリ

- `origin`: kimisaraz/dotfiles（個人設定）
- `upstream`: bbatsov/prelude（Prelude本体）

## メンテナンス

### 新しい設定ファイルを追加

```bash
cd ~/works/github.com/kimisaraz/dotfiles
# personal/配下に設定ファイルを追加
git add emacs.d/personal/
git commit -m "Add new configuration"
git push
```
