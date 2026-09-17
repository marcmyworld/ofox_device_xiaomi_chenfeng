#!/system/bin/sh

DEBUG=0
[ "$DEBUG" = "1" ] && set -o xtrace;

LOGMSG() {
	echo "I:$@" >> /tmp/recovery.log
}

SCRIPT_NAME="$(basename "$0")"

LOGMSG "---$SCRIPT_NAME start---"

/sbin/prune_historic_logs.sh 10

LOGMSG "---$SCRIPT_NAME end---"
exit 0
