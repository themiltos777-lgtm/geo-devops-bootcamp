#!/usr/bin/env bash

FILE="test.txt"

if [ -f "$FILE" ]; then
    echo "Datei existiert."
else
    echo "Datei existiert nicht."
fi
