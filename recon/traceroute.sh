#!/bin/bash

# ==========================================
# FatFox Network Path Discovery
# ==========================================

echo "[+] Starting traceroute..."

# Check if TARGET is set
if [ -z "$TARGET" ]
then
    echo "[!] TARGET not set. Please set target first."
    exit 1
fi

# Create output folder
mkdir -p output/$TARGET

echo "[+] Tracing network route to $TARGET ..."

traceroute $TARGET > output/$TARGET/traceroute.txt

echo "[+] Traceroute completed."

echo ""
echo "[+] Route to target:"

cat output/$TARGET/traceroute.txt

echo ""
echo "[+] Results saved to:"
echo "output/$TARGET/traceroute.txt"
