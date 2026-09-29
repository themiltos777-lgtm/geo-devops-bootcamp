#!/usr/bin/env bash

ERRORS=0

echo "=== HEALTH CHECK ==="

echo "Datum:"
date
echo
echo "Host:"
hostname
echo
echo "User:"
whoami
echo
echo "Kernel:"
uname -r
echo
echo "RAM:"
free -h
echo
echo "Diskusage:"
df -h
echo
echo "Cronjobs:"
if systemctl is-active --quiet cron; then
	echo "Cron: OK"
else
	echo "Cron: NICHT Aktiv"
	ERRORS=$((ERRORS + 1))
fi
echo
echo "HighRamUsage:"
ps aux --sort=-%mem | head -n 6
echo
if [ "$ERRORS" -eq 0 ]; then
	echo "Systemcheck erfolgreich."
	exit 0
else
	echo "$ERRORS Fehler gefunden."
	exit 1
fi
echo
