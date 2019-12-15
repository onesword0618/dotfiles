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

# --- エイリアス --- #
## 関数呼び出し
alias cd=cdPwdLs

## ls
alias ls='ls -aF --color=auto'
