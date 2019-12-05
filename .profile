# --- 説明 --- #
# .profile
# ログイン時に読み込まれる設定ファイル
# 直接ホームディレクトリに置かずに、シンボリックリンクで配置する
# 記載は下記の種類に絞る

# --- 見出し --- #
# 検証用
# 起動シェル分岐
# PATH変数
# 環境変数

## -- 検証用 -- ##
#echo "read .profile"; # .profileが実行されているか確認する

## --- 起動シェル分岐 --- ##
# if running bash
# if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#	. "$HOME/.bashrc"
#    fi
# fi

## --- PATH変数 --- ##

### ホームディレクトリにbinディレクトリがあったら設定
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

### .localディレクトリにbinディレクトリがあったら設定
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

## --- 環境変数 --- ##
export GPG_TTY=$(tty) # Gitで利用するGPG key
