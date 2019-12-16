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
    ls -aF --color=auto
}

## apt の最新化作業
function s() {
    sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt clean
}

# --- エイリアス --- #
## 関数呼び出し
alias cd=cdPwdLs
alias stap=s


## ls
alias ls='ls -aF --color=auto'

## ..
alias ..='cd ..'

## vi -> vim
alias vi='vim'

## clear
alias c='clear'

## apt
alias upd='sudo apt update'
alias upg='sudo apt upgrade -y'
alias rem='sudo apt remove -y'

## exit
alias q='exit'

## Application ShortCut
alias v='vim'
