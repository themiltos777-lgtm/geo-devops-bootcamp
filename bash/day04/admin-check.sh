#!/usr/bin/env bash

set -euo pipefail

echo "=== SYSTEM CHECK ==="

echo "User:"
whoami

echo

echo "Hostname:"
hostname

echo

echo "Datum:"
date

echo

echo "Festplatte:"
df -h

echo

echo "RAM:"
free -h

echo

if systemctl is-active --quiet cron; then
    echo "cron: OK"
else
    echo "cron: NICHT AKTIV"
fi


if systemctl is-active --quiet cron; then
    echo "cron: OK"
    exit 0
else
    echo "cron: FEHLER"
    exit 1
fi
