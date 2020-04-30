#  --- 説明 --- #
#  .bashrc
#   bashに依存する対話モードの時に読み込まれるファイル

#  --- 見出し --- #
#  検証用
#  対話モードチェック
#  エイリアス設定ファイルチェック
#  対話モードで使う設定

##  -- 検証用 -- ##
#  .bashrcが実行されているか確認する
#  echo "Read .bashrc";

##  -- 対話モードチェック -- ##
#  オプションで-iを使う場合(対話モード)に読み込まれる
case $- in
  *i*) ;;
  *) return ;;
esac

##  -- エイリアス設定ファイルチェック -- ##
#  .bash_aliasの存在チェック
if [ -L ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

##  -- 対話モードで使う設定 -- ##

#  シェル終了時、HISTFILEの設定値分、ファイルの最後に追加する
shopt -s histappend

###  コマンド実行履歴の環境変数
#  コマンド実行履歴を保存する場所 デフォルトは~/.bash_history

#  ファイルに記録する最大行数
HISTFILESIZE=20000
#  全履歴で重複があった場合はそのコマンドを削除する
HISTCONTROL=erasedups
#  シェル終了時までに保存される実行コマンドの最大値
HISTSIZE=100000
#  YY/M/D/HH/MM/SS
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S '

###  プロンプトの設定
  COMMAND_HISTORY='\!'
  WORKER='\u'
  WORKING_DIRECTORY='\W'
  BOLD_YELLOW='\[\e[1;33m\]'
  END='\[\e[m\]'
export PS1="[${COMMAND_HISTORY} ${WORKER} ${BOLD_YELLOW}${WORKING_DIRECTORY}${END}]@$ "

###  lesspipeが実行できる場合
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

###  dircolorsファイルが実行可能の場合は以下のエイリアスが利用できる
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

###  対話的に扱うエイリアス
##  cp
alias cp='cp -i'
##  mv
alias mv='mv -iv'
##  rm
alias rm='rm -i'

#  SDKMAN
export JAVA_HOME=$HOME/.sdkman/candidates/java/current # SDKMANでJAVA_HOMEを設定している
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

