#!/usr/bin/env bash

DIR="$HOME/geo-devops-bootcamp"

if [ -d "$DIR" ]; then
    echo "Bootcamp-Verzeichnis existiert."
else
    echo "Bootcamp-Verzeichnis fehlt."
fi
