#!/bin/bash

echo ""
echo "======================================="
echo "        FATFOX RECON ENGINE"
echo "======================================="
echo ""

read -p "Enter Target IP: " target

mkdir -p ../reports/$target

echo ""
echo "[+] Starting full network reconnaissance..."
echo "[+] Target: $target"
echo ""

# Progress bar
progress_bar () {
for i in {1..50}; do
    printf "█"
    sleep 0.05
done
}

echo -n "[+] Initializing scan: "
progress_bar
echo ""

echo ""
echo "[+] Running full port scan..."
echo ""

# Run nmap port scan
nmap --top-ports 1000 -T4 -Pn --stats-every 5s $target -oN ../reports/$target/port_scan.txt

# Extract open ports
open_ports=$(grep open /tmp/fatfox_ports.txt | awk '{print $1}' | cut -d "/" -f1 | tr '\n' ',' | sed 's/,$//')

echo ""
echo "[✔] Open Ports Found:"
grep open /tmp/fatfox_ports.txt
echo ""

if [ -z "$open_ports" ]; then
    echo "[!] No open ports detected."
    read -p "Press Enter..."
    exit
fi

echo "[+] Running service detection..."
echo ""

nmap -sV -p $open_ports $target -oN ../reports/$target/service_scan.txt

echo ""
echo "[✔] Services detected:"
grep open ../reports/$target/service_scan.txt

echo ""

echo "[+] Checking vulnerability scripts..."

nmap --script vuln -p $open_ports $target -oN ../reports/$target/vuln_scan.txt

echo ""
echo "[✔] Vulnerability scan finished."

echo ""
echo "======================================="
echo "        FATFOX SCAN COMPLETE"
echo "======================================="
echo ""

echo "Reports saved in:"
echo "reports/$target"

echo ""
read -p "Press Enter to return to menu..."
