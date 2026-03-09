#!/bin/bash

echo ""
echo "===== FATFOX LIVE PORT MONITOR ====="
echo ""

read -p "Enter Target: " target

echo "[+] Monitoring open ports..."

while true
do
nmap --top-ports 100 $target | grep open
sleep 10
done
