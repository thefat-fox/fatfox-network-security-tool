#!/bin/bash

echo ""
echo "===== FATFOX RECON ENGINE ====="
echo ""

read -p "Enter Target Domain/IP: " target

mkdir -p ../reports/$target

echo "[1/4] Host discovery..."
nmap -sn $target > ../reports/$target/host_scan.txt

echo "[2/4] Port scan..."
nmap --top-ports 1000 $target > ../reports/$target/port_scan.txt

echo "[3/4] Service detection..."
nmap -sV $target > ../reports/$target/service_scan.txt

echo "[4/4] Vulnerability scan..."
nmap --script vuln $target > ../reports/$target/vuln_scan.txt

echo ""
echo "Recon complete"
echo "Reports saved in reports/$target"

read -p "Press Enter..."
