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

##--- aliaseで扱う関数 -- ##
function pwdColor() {
    readonly PWD=$(pwd)
    readonly PWD_COLOR='\e[32m'
    readonly END_PWD_COLOR='\e[m\n'
    printf "${PWD_COLOR} ${PWD} ${END_PWD_COLOR}"
}

### ディレクトリの移動をした結果出力
function cdPwdLs() {
    cd $1
    pwdColor
    ls -aF --color=auto
}
### apt の最新化作業
function updateApt() {
    sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean
}

## --- エイリアス --- ##
### 関数呼び出し
alias cd=cdPwdLs
alias s=updateApt
alias ls='ls -aF --color=auto' ### ls
alias ..='cd ..'               ### ..
alias vi='vim'                 ### vi -> vim
alias c='clear'                ### clear

### apt
alias upd='sudo apt update'
alias upg='sudo apt upgrade -y'
alias rem='sudo apt remove -y'
alias q='exit' ### exit

### Application ShortCut
alias v='vim'
