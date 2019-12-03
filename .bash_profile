# MySetting
if [ -f ~/.bashrc ]; then
       . ~/.bashrc
fi

# define for PS1
green=$'\e[32m'

function newline {
  if [[ -z "${NEWLINE_LOGIN}" ]]; then
    NEWLINE_LOGIN=true
  else
    # http://manpages.ubuntu.com/manpages/bionic/en/man1/printf.1.html
    printf '\n'
  fi
}

# PROMPT_COMMAND 
# 設定すると、コマンド実行する度に優先的に適用される
# https://linuxjm.osdn.jp/html/GNU_bash/man1/bash.1.html
# http://manpages.ubuntu.com/manpages/bionic/ja/man1/man.1.html
# https://manpages.ubuntu.com/manpages/bionic/en/man1/bash.1.html
PROMPT_COMMAND='newline'

export PS1="\[${green}\] \! \t \w \n \$ "
export GPG_TTY=$(tty)
