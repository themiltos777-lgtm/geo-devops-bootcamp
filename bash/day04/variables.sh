#!/usr/bin/env bash

NAME="Miltos"
PROJECT="Geo DevOps Bootcamp"

echo "Hallo $NAME"
echo "Projekt: $PROJECT"

TODAY=$(date)
HOST=$(hostname)
USER_NAME=$(whoami)

echo "Datum: $TODAY"
echo "Host: $HOST"
echo "User: $USER_NAME"
