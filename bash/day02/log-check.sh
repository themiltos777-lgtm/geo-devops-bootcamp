#!/usr/bin/env bash

echo "=== Server Errors ==="
grep "ERROR" server.log

echo
echo "=== Database Errors ==="
grep "ERROR" database.log
