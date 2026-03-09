#!/bin/bash

read -p "Enter Target IP: " target

mkdir -p reports/$target

echo "[+] Running Nmap vulnerability scripts..."

nmap --script vuln $target -oN reports/$target/vuln_scan.txt

echo ""
echo "[+] Vulnerability scan saved to:"
echo "reports/$target/vuln_scan.txt"

read -p "Press Enter..."
