#!/usr/bin/env bash

read -p "Aktion (start/stop/status): " ACTION

case "$ACTION" in
    start)
        echo "Dienst würde gestartet werden."
        ;;
    stop)
        echo "Dienst würde gestoppt werden."
        ;;
    status)
        echo "Status würde geprüft werden."
        ;;
    *)
        echo "Unbekannte Aktion."
        ;;
esac
