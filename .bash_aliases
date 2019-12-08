# --- 説明 --- #
# .bash_aliases
# エイリアスの設定はここに記載する

# --- 見出し --- #
# 検証用
# aliaseで扱う関数
# aliase

## -- 検証用 -- ##
###  .bash_aliasesが実行されているか確認する
# echo "read .bash_aliases";

# --- aliaseで扱う関数 -- #
## ディレクトリの移動をした結果出力
function cdPwdLs() {
 cd $1
 pwd
 ls;
}

# --- エイリアス --- #
## 関数呼び出し
alias cd=cdPwdLs

## ls
alias ls='ls -aF --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# alert
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
