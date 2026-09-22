#!/usr/bin/env bash

set -euo pipefail
ERRORS=0

show_header() {
	echo "=== SYSTEM REPORT ==="
	echo "Datum: $(date)"
	echo "User: $(whoami)"
	echo "Host: $(hostname)"
	echo
}

show_system_info() {
	echo "=== SYSTEM INFO ==="
	echo "Kernel: $(uname -r)"
	
	if  [ -f /etc/os-release ]; then
		grep "^PRETTY_NAME=" /etc/os-release
	fi

	echo
}

show_disk_usage() {
	echo "=== DISK USAGE ==="
	df -h /
	DISK_USAGE=$(df -P / | tail -n 1 | awk '{print $5}' | tr -d '%')
	echo "$DISK_USAGE"
}

check_disk_usage() {
    echo "=== DISK CHECK ==="

    DISK_USAGE=$(df -P / | tail -n 1 | awk '{print $5}' | tr -d '%')

    echo "Belegt: ${DISK_USAGE}%"

    if [ "$DISK_USAGE" -ge 80 ]; then
        echo "WARNUNG: Festplatte ist stark belegt."
    else
        echo "Festplatte: OK"
    fi

    echo
}

show_memory() {
	echo "=== MEMORY ==="
	free -h
	echo
}

show_top_processes() {
	echo "=== TOP MEMORY PROCESSES ==="
    	ps aux --sort=-%mem | head -n 6
	echo "=== SORT BY CPU ==="
	ps aux --sort=-%cpu | head    
	echo
}

check_service() {
	SERVICE="$1"

    	echo "Prüfe Dienst: $SERVICE"

    	if systemctl list-unit-files | grep -q "^${SERVICE}.service"; then
        	if systemctl is-active --quiet "$SERVICE"; then
            		echo "$SERVICE: OK"
        	else
            		echo "$SERVICE: NICHT AKTIV"
			ERRORS=$((ERROR+1))
        	fi
    		
	else
        	echo "$SERVICE: nicht installiert"
    	fi

    	echo
}

show_summary() {
	echo "=== SUMMARY ==="
	
	if [ "$ERRORS" -eq 0 ]; then
		echo "Keine kritischen Fehler gefunden."
		exit 0
	else
		echo "$ERRORS Problem gefunden."
		exit 1
	fi
}

show_header
show_system_info
show_disk_usage
check_disk_usage
show_memory
show_top_processes
check_service cron
check_service ssh
check_service postgresql
show_summary
