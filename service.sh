#!/system/bin/sh

MODPATH=/data/adb/modules/gsm_faker

# wait for boot complete
while [ "$(getprop sys.boot_completed)" != 1 ]; do
    sleep 1
done

. $MODPATH/apply.sh
crond -c $MODPATH/cron
