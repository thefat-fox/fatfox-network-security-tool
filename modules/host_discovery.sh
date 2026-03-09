#!/bin/bash

echo ""
echo "[+] Host Discovery Module"
echo ""

read -p "Enter Target Network (example: 192.168.1.0/24): " target

mkdir -p ../reports

echo ""
echo "[+] Running host discovery on $target..."
echo ""

nmap -sn -T4 $target -oN ../reports/host_discovery.txt

echo ""
echo "[✔] Scan finished."
echo "[✔] Results saved to reports/host_discovery.txt"

read -p "Press Enter to return to menu..."
