# --- 説明 --- #
# .bashrc
# bashに依存する対話モードの時に読み込まれるファイル

# --- 見出し --- #
# 検証用
# 対話モードチェック
# エイリアス設定ファイルチェック
# 対話モードで使う設定

## -- 検証用 -- ##
###  .bashrcが実行されているか確認する
# echo "Read .bashrc";

## -- 対話モードチェック -- ##
### オプションで-iを使う場合(対話モード)に読み込まれる
case $- in
*i*) ;;
*) return ;;
esac

## -- エイリアス設定ファイルチェック -- ##
### .bash_aliasの存在チェック
if [ -L ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

## -- 対話モードで使う設定 -- ##
shopt -s histappend                 # シェル終了時、HISTFILEの設定値分、ファイルの最後に追加する

#### コマンド実行履歴の環境変数 ####
### コマンド実行履歴を保存する場所 デフォルトは~/.bash_history
HISTFILESIZE=20000                  # ファイルに記録する最大行数
HISTCONTROL=erasedups               # 全履歴で重複があった場合はそのコマンドを削除する
HISTSIZE=100000                     # シェル終了時までに保存される実行コマンドの最大値
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S ' # YY/M/D/HH/MM/SS

#### プロンプトの設定 ####
readonly COMMAND_HISTORY='\!'
readonly WORKER='\u'
readonly WORKING_DIRECTORY='\W'
readonly BOLD_YELLOW='\[\e[1;33m\]'
readonly END='\[\e[m\]'
export PS1="[${COMMAND_HISTORY} ${WORKER} ${BOLD_YELLOW}${WORKING_DIRECTORY}${END}]@$ "

### lesspipeが実行できる場合
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

### dircolorsファイルが実行可能の場合は以下のエイリアスが利用できる
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

### TERM 下記条件の文字列が含まれていた場合
#### ターミナル固有設定は`$TERM`の値で判断する
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;; # カラー端末対応だった場合
esac

### --- 未検証 --- ###

#uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
#if [ -n "$force_color_prompt" ]; then
#    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
# We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
#	color_prompt=yes
#    else
#	color_prompt=
#    fi
#fi
#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#  *)
#    ;;
#esac
# enable color support of ls and also add handy aliases
#

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
##--------------------------------##

### 対話的に扱うエイリアス
alias cp='cp -i' ## cp
alias mv='mv -i' ## mv
alias rm='rm -i' ## rm

# SDKMAN
export JAVA_HOME=$HOME/.sdkman/candidates/java/current # SDKMANでJAVA_HOMEを設定している
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
