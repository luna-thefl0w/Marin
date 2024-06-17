function main() {
	ui_print " ###########################"
	awk '{print}' ${MODPATH}/banner
	ui_print " "
	ui_print " ###########################"
	ui_print " "
	ui_print " - disabling logs for apps, don't worry it'll place stuffs to disable new"
	ui_print "  apps logging stuffs on every reboot..."
	ui_print " "
	COUNT=0
	FUCKED_COUNT=0
	for i in $(pm list packages | cut -d ':' -f2); do 
		su -c cmd package log-visibility --disable $i &>/dev/null
		if [ "$?" -le "0" ]; then
			COUNT=$(($COUNT + 1))
		else 
			FUCKED_COUNT=$(($FUCKED_COUNT + 1))
		fi
	done
	ui_print " - Number of completed actions : $COUNT"
	ui_print " "
	if [ "$FUCKED_COUNT" -gt "1" ]; then
		ui_print " - Number of failed actions : $FUCKED_COUNT"
		ui_print ""
	fi
	if [ "$FUCKED_COUNT" -gt "1" ]; then
		ui_print " - Don't worry, this thing is sometimes common, just ignore lol"
		ui_print " "
	fi
	ui_print " - Besure to Join @thefl0w_lore for more."
}

if $BOOTMODE; then
	main
else
	about "- please run this via magisk manager bitch:)"
fi