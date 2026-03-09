#!/bin/bash

# ==========================================
# FatFox Service Detection Module
# Uses Nmap to detect running services
# ==========================================

echo "[+] Starting service detection scan..."

# Check if TARGET is set
if [ -z "$TARGET" ]
then
    echo "[!] TARGET not set. Please set target first from main menu."
    exit 1
fi

# Create output directory if not exists
mkdir -p output/$TARGET

# Run service detection
echo "[+] Running Nmap service/version detection..."

nmap -sV -T4 $TARGET -oN output/$TARGET/service_scan.txt

echo "[+] Service scan completed."

# Show detected services
echo ""
echo "[+] Detected Services:"
grep "open" output/$TARGET/service_scan.txt

echo ""
echo "[+] Results saved to:"
echo "output/$TARGET/service_scan.txt"
