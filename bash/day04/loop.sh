#!/usr/bin/env bash

for SERVICE in cron ssh docker; do
    echo "Prüfe: $SERVICE"
done

for FILE in *.sh; do
    echo "Gefunden: $FILE"
done
