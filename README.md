# dotfiles

個人用の設定ファイル管理リポジトリ

## 構成

[GNU Stow](https://www.gnu.org/software/stow/) で管理している。
各パッケージ配下は `$HOME` からの相対パスと同じ構造になっている。

- `common/` - 全環境共通のパッケージ
  - `emacs/` - Emacs Preludeベースの設定（`~/.emacs.d`）
    - `.emacs.d/personal/` - 個人設定
    - `.emacs.d/vendor/` - カスタムパッケージ
  - `ghostty/` - Ghostty設定（`~/.config/ghostty/config`）
  - `pandoc/` - pandocテンプレート（`~/.local/share/pandoc/templates`）
- `macos/` - macOS専用のパッケージ
  - `karabiner/` - Karabiner-Elements設定（`~/.config/karabiner` をディレクトリごとリンク）
    - `karabiner.json` 単体をリンクすると変更が検知されないため、[公式の推奨](https://karabiner-elements.pqrs.org/docs/manual/misc/configuration-file-path/)に従う
    - 自動バックアップなどの `karabiner.json` 以外のファイルは `.gitignore` で除外している
- `omarchy/` - Omarchy Linux専用のパッケージ
- `emacs.d_old/` - Prelude移行前の設定（参照用、stow対象外）

## セットアップ

### 新規環境

```bash
# stowをインストール
brew install stow          # macOS
sudo pacman -S stow        # Omarchy

# ghqでクローン
ghq get kimisaraz/dotfiles

# インストールスクリプトを実行（common/ と OS に応じたディレクトリを stow する）
~/works/github.com/kimisaraz/dotfiles/install.sh
```

macOS で Karabiner-Elements をインストール済みの場合は `~/.config/karabiner` が実ディレクトリとして存在し、
stow が衝突で止まるか、ディレクトリではなくファイル単位のリンクになる。事前に退避してから実行し、実行後に Karabiner を再起動する。

```bash
mv ~/.config/karabiner ~/.config/karabiner.backup-$(date +%Y%m%d)
~/works/github.com/kimisaraz/dotfiles/install.sh
launchctl kickstart -k gui/$(id -u)/org.pqrs.service.agent.Karabiner-Console-User-Server
```

### 手動セットアップ

```bash
cd ~/works/github.com/kimisaraz/dotfiles
stow -d common -t ~ emacs ghostty pandoc
stow -d macos -t ~ karabiner
```

### パッケージを追加する

```bash
cd ~/works/github.com/kimisaraz/dotfiles
# 例: Omarchy の ~/.config/hypr/bindings.conf を管理対象にする
mkdir -p omarchy/hypr/.config/hypr
# 既存ファイルをリポジトリへ取り込んでリンクする（取り込み後に git diff で確認する）
touch omarchy/hypr/.config/hypr/bindings.conf
stow -d omarchy -t ~ --adopt hypr
```

既存の実ファイルがあると stow は衝突エラーで止まる。
`--adopt` は既存ファイルでリポジトリ側の内容を上書きするので注意。

## Preludeの更新を取り込む

Preludeは upstream をマージせずコピーで取り込んだため、共通の祖先が記録されていない。
初回のみ、取り込み元のコミット（`62f7af5`）を取り込み済みとして記録してからマージする。

```bash
cd ~/works/github.com/kimisaraz/dotfiles
git fetch upstream
# 初回のみ: 取り込み元のコミットを内容を変えずにマージ済みとして記録する
git merge -s ours --allow-unrelated-histories -m "Record Prelude 62f7af5 as merge base" 62f7af5
```

```bash
cd ~/works/github.com/kimisaraz/dotfiles
git fetch upstream
# Preludeは common/emacs/.emacs.d 配下に置いているので subtree 指定でマージする
git merge -X subtree=common/emacs/.emacs.d upstream/master
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
git add common/emacs/.emacs.d/personal/
git commit -m "Add new configuration"
git push
```
