#!/bin/bash

echo ""
read -p "Enter Target Network (example: 192.168.1.0/24): " target

mkdir -p ../reports

echo ""
echo "[+] Running host discovery..."

nmap -sn $target -oN ../reports/host_discovery.txt

echo ""
echo "[✔] Scan complete."
echo "[✔] Results saved to reports/host_discovery.txt"

read -p "Press Enter to return to menu..."
