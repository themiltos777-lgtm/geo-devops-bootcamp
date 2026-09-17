#!/usr/bin/env bash

echo "=== Benutzer ==="
whoami

echo
echo "=== Prozesse ==="
ps aux | head -n 10

echo
echo "=== Speicher ==="
free -h

echo
echo "=== Festplatte ==="
df -h
