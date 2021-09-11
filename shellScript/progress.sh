progress() {
 _bar=$1; _bar=${_bar:=.}
 while :
 do
  jobs %1 > /dev/null 2>&1
  [ $? = 0 ] || break
  echo -n ${_bar}
  sleep 0.1
 done;
}

usage() {
    echo "usage: $0 [command]";exit;
}

[ $# = 0 ] && usage

"$@" &
progress
