#!/bin/bash

# Description
# How to Use
# Author

# Usage
function usage {
    cat <<EOF
$(basename ${0}) is a tool for ...

Usage:
    $(basename ${0}) [command] [<options>]

Options:
    --version, -v     print $(basename ${0}) version
    --help, -h        print this
EOF
}

# err
err() {
  echo "[$(date +'%Y-%m-%dT%H:%M:%S%z')]: $@" >&2
}

## resource 
### 文字列変数を宣言する際には，引用符でくくること。
### $varではなく，可読性と保守性とバグ防止のため，常に${var}とすること。

### 1. 存在チェック
# 実行済みを証明するファイルがある場合は処理を中止する。
## lock="/tmp/target"

# if [ -f ${lock} ]; then
#  echo "this script done."
#    ls -l ${lock}
#  exit
# fi

### 2. 作業場所の作成
# [ -d ${workingSpace} ] || mkdir -p ${workingSpace}
# [ -d ${workingSpace} ] || mkdir -p ${workingSpace}

### 3. 実行内容
# 3.1. ファイルスキャン
# for xxx in $(ls -1 /tmp/target/files | grep "taragetWord" )
# do 
# process 
# done

### 4. 実行済ファイルを作成
# touch /tmp/target

# 途中のコマンドの結果で処理を抜ける場合
#if [ $? = 0 ]
#then
#  echo "success"
#else
#  echo "fail"
#fi



