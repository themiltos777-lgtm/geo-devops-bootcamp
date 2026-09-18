#!/usr/bin/env bash

if systemctl is-active --quiet cron; then
    echo "cron läuft."
else
    echo "cron läuft nicht."
fi
