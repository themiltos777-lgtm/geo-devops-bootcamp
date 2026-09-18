#!/usr/bin/env bash

set -euo pipefail

echo "Skript startet."

ls /does-not-exist

echo "Diese Zeile sollte nicht mehr erscheinen."
