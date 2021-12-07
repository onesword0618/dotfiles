#!/bin/bash
## SLACK BOT REPORT
set -eu

SOURCE_ROOT="/Users/user-name/Desktop/tmp/mnt"
TARGET_SOURCE_ROOT="/Users/user-name/Desktop/tmp/mnt_s"
EXCLUDE="branch"

## Pick up Organization Name
FIND_COMMAND=`find ${SOURCE_ROOT} -mindepth 1 -maxdepth 1 -type d \! name ${EXCLUDE}`
## WebHook
URL='https://hooks.slack.com/services/XXXX/YYYY/ZZZZ'

## Target Slack Channel
CHANNEL=${CHANNEL:-'#channel-name'}
BOTNAME=${BOTNAME:-'bot-name'}
EMOJI=${EMOJI:-':robot_face:'}
HEAD=${HEAD:-"*[header]*\n"}
MESSAGE="COPY REPORT"

## Main Process
payload="payload={
 \"channel\": \"${CHANNEL}\",
 \"username\": \"${BOTNAME}\",
 \"icon_emoji\": \"${EMOJI}\",
 \"text\": \"${HEAD}${MESSAGE}\"
}"

REPORT_COMMAND="curl -s -S -X POST --data-urlencode "${payload}" ${URL} > /dev/null"
echo "file copy start."
for TARGET in $FIND_COMMAND; do
  SOURCE="${SOURCE_ROOT}/${TARGET##*/}/optional/resource"
  TARGET="${TARGET_SOURCE_ROOT}/s/${TARGET##*/}/optional/target/resource"
  COPY_COMMAND="cp -af ${SOURCE}/* ${TARGET}/"

  if [ ! -d ${SOURCE} ]; then
    echo "no such directory."
    continue
  fi

  if [ ! -d ${TARGET} ]; then
    mkdir -p ${TARGET}
  fi

  if ! $COPY_COMMAND ; then
    $REPORT_COMMAND
    exit 1
  fi
done
echo "file copy done."
