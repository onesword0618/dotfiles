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
### pwd で出力した結果に色を追加する
function pwdColor() {
    PWD=$(pwd)
    PWD_COLOR='\e[32m'
    END_PWD_COLOR='\e[m\n'
    printf "${PWD_COLOR} ${PWD} ${END_PWD_COLOR}"
}

### 設定ファイルの再読込を行う
function reloadDotfiles() {
    source $HOME/.profile &&
        source $HOME/.bash_profile &&
        source $HOME/.bashrc &&
        source $HOME/.bash_aliases &&
        echo "Reloaded"
}

### ホームディレクトリのサイズを算出する
function homeDirSize() {
    du -h ~ | tail -n 1
}
### ディレクトリの移動をした結果出力
function cdPwdLs() {
    cd $1
    pwdColor
    ls -aF --color=auto
}
### apt の最新化作業
function updateApt() {
    sudo apt update &&
        sudo apt full-upgrade -y &&
        sudo apt autoremove -y &&
        sudo apt clean -y
}

## --- エイリアス --- ##
### 関数呼び出し
alias homesize=homeDirSize
alias cd=cdPwdLs
alias s=updateApt
alias reload=reloadDotfiles

### apt
alias upd='sudo apt update'
alias upg='sudo apt upgrade -y'
alias rem='sudo apt remove -y'

### ls ... list segments
#### man ls
alias ls='ls -AF --color=auto'
alias la='ls -AlF --color=auto'
alias lsr='ls -Rh'
alias lg='ls -gnot'
alias lm='ls -m'        ### Display comma

### mkdir ... make directories
#### man mkdir
alias mkdir='mkdir -pv' ### make parent dir and  print a message

### cat ... concatenate files and print on the standard output
#### man cat
alias cat='cat -n' ### Display number

### less ... opposite of more
#### man less
alias less='less -X'

### wc ... print newline, word, and byte counts for each file
#### man wc
alias wc='wc -lwc' ### line word byte

### head ... output the first part of files
#### man head
alias head='head -v'

### tail ... output the last part of files
#### man tail
alias tail='tail -v'
alias track='tail -vf' ### stop ctrl +c

### Application ShortCut
alias q='exit' ### exit
alias v='vim'
alias vi='vim'   ### vi -> vim
alias ..='cd ..' ### ..
alias c='clear'  ### clear
alias e='echo'
alias xo=xdg-open
