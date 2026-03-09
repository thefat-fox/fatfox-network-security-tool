#!/bin/bash

# ==========================================
# FatFox IP Intelligence Module
# ==========================================

echo "[+] Gathering IP intelligence..."

# Check if TARGET is set
if [ -z "$TARGET" ]
then
    echo "[!] TARGET not set. Use 'Set Target' in main menu first."
    exit 1
fi

# Create output folder if needed
mkdir -p output/$TARGET

echo "[+] Querying IP information..."

curl -s ipinfo.io/$TARGET > output/$TARGET/ipinfo.txt

echo "[+] IP Information:"

cat output/$TARGET/ipinfo.txt

echo ""
echo "[+] Results saved to:"
echo "output/$TARGET/ipinfo.txt"
