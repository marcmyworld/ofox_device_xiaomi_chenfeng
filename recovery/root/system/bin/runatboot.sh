#!/system/bin/sh

DEBUG=0
[ "$DEBUG" = "1" ] && set -o xtrace;

LOGMSG() {
	echo "I:$@" >> /tmp/recovery.log
}

SCRIPT_NAME="$(basename "$0")"

LOGMSG "---$SCRIPT_NAME start---"

rebind_touch() {
	(
		# Wait for the OrangeFox splash logo to dismiss and decryption/main screen to appear
		MAX_WAIT=50
		while [ $MAX_WAIT -gt 0 ]; do
			if grep -qE "Set page: '(decrypt|main)" /tmp/recovery.log 2>/dev/null; then
				break
			fi
			sleep 0.1
			MAX_WAIT=$((MAX_WAIT - 1))
		done

		TCM_DIR="/sys/devices/platform/synaptics_tcm.0/subsystem/drivers/synaptics_tcm"
		[ ! -d "$TCM_DIR" ] && TCM_DIR="/sys/bus/platform/drivers/synaptics_tcm"

		if [ -d "$TCM_DIR" ]; then
			LOGMSG "Rebinding Synaptics TCM touch driver..."
			echo "synaptics_tcm.0" > "$TCM_DIR/unbind"
			echo "synaptics_tcm.0" > "$TCM_DIR/bind"
			LOGMSG "Synaptics TCM touch driver rebound successfully"
		fi
	) &
}

rebind_touch

/sbin/prune_historic_logs.sh 10

LOGMSG "---$SCRIPT_NAME end---"
exit 0
