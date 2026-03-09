#!/bin/bash

read -p "Enter Target IP or URL: " target

mkdir -p reports/$target

echo "[+] Running Nikto web scan..."

nikto -h $target -output reports/$target/nikto.txt

echo ""
echo "[+] Web scan saved to:"
echo "reports/$target/nikto.txt"

read -p "Press Enter..."
