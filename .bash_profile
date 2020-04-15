#  --- 説明 --- #
#  .bash_profile
#  ログインシェルとしてbashが設定されている場合に読み込まれるファイル
#  記載は下記の種類に絞る
#  ここでは、.profileと.bashrcの存在確認のみを行う

#  --- 見出し --- #
#  検証用
#  設定ファイルチェック

##  -- 検証用 -- ##
#  .bash_profileが実行されているか確認する
#  echo "read .bash_profile";

##  -- 設定ファイルチェック -- ##
#  .profile
if [ -L "$HOME/.profile" ]; then
  . "$HOME/.profile"
fi

#  .bashrc
if [ -L "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
