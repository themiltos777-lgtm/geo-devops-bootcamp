#!/usr/bin/env bash
ERRORS=0
echo PostgreSQL-Version:
psql --version
echo
echo PostgreSQL-Service:
echo
if systemctl is-active --quiet postgresql; then 
	echo "PostgreSQL: OK"
else
	echo "PostgreSQL: Error"
	ERRORS=$((ERRORS + 1))
fi
echo
echo Database geodb:
sudo -u postgres psql -tAc "SELECT 1 FROM pg_database WHERE datname='geodb';"
echo
echo Active connection:
sudo -u postgres psql -tAc "SELECT COUNT(*) FROM pg_stat_activity;"
echo
echo Backup file exists:
echo
BACKUP_FILE="/tmp/geodb.dump"
echo
if [ -f "$BACKUP_FILE" ]; then
	echo "Backup found."
	ls -lh "$BACKUP_FILE"
else
	echo "No backup found."
	ERRORS=$((ERRORS + 1))
fi
echo
echo "=== SUMMARY ==="
echo "DEBUG ERRORS='$ERRORS'"
if [ "$ERRORS" = 0 ]; then
    echo "All checks succeeded."
    exit 0
else
    echo "$ERRORS errors found."
    exit 1
fi
