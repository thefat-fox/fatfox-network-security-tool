#!/bin/bash

echo ""
echo "===== FATFOX NETWORK MAPPER ====="
echo ""

read -p "Enter Network Range (example 192.168.1.0/24): " network

mkdir -p ../reports/network_map

echo "[+] Discovering devices..."

nmap -sn $network -oN ../reports/network_map/hosts.txt

echo ""
echo "[+] Device List"
grep "Nmap scan report" ../reports/network_map/hosts.txt

echo ""
read -p "Press Enter..."
