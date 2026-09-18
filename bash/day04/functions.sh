#!/usr/bin/env bash

show_system_info() {
	echo "Host:"
	hostname

	echo "User:"
	whoami

	echo "Uptime:"
	uptime
}

show_system_info
