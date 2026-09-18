#!/usr/bin/env bash

COUNT=1

while [ "$COUNT" -le 5 ]; do
    echo "Durchlauf: $COUNT"
    COUNT=$((COUNT + 1))
done
