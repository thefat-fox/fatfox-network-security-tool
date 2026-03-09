#!/bin/bash

echo ""
echo "=================================="
echo "      FATFOX TARGET INTELLIGENCE"
echo "=================================="
echo ""

read -p "Enter Target IP or Domain: " target

mkdir -p ../reports/$target

echo ""
echo "[+] Analyzing target..."
echo ""

# Detect private IP
if [[ $target == 192.168.* || $target == 10.* || $target == 172.* ]]; then

echo "[!] Private IP detected"
echo ""

echo "[+] Collecting local network intelligence..."
echo ""

# Run Nmap OS detection
nmap -O $target > /tmp/fatfox_local_scan.txt

# MAC Address
mac=$(grep "MAC Address" /tmp/fatfox_local_scan.txt | awk '{print $3}')

# Vendor
vendor=$(grep "MAC Address" /tmp/fatfox_local_scan.txt | cut -d "(" -f2 | cut -d ")" -f1)

# OS Guess
os=$(grep "OS details" /tmp/fatfox_local_scan.txt | cut -d ":" -f2)

echo "IP Address : $target"
echo "MAC Address: $mac"
echo "Vendor     : $vendor"
echo "OS Guess   : $os"

echo ""

# Basic device guess
if echo "$vendor" | grep -i "intel"; then
device="Laptop / PC"
elif echo "$vendor" | grep -i "samsung"; then
device="Mobile Device"
elif echo "$vendor" | grep -i "apple"; then
device="Apple Device"
elif echo "$vendor" | grep -i "tp-link"; then
device="Router"
else
device="Unknown Device"
fi

echo "Device Type: $device"

echo ""

echo "Saving report..."

cp /tmp/fatfox_local_scan.txt ../reports/$target/local_intelligence.txt

echo "[✔] Report saved to reports/$target/local_intelligence.txt"

else

echo "[+] Public IP detected"
echo ""

data=$(curl -s https://ipinfo.io/$target/json)

ip=$(echo $data | jq -r '.ip')
city=$(echo $data | jq -r '.city')
country=$(echo $data | jq -r '.country')
org=$(echo $data | jq -r '.org')

echo "IP Address : $ip"
echo "City       : $city"
echo "Country    : $country"
echo "ISP        : $org"

echo "$data" > ../reports/$target/ip_intelligence.json

echo "[✔] Report saved to reports/$target/ip_intelligence.json"

fi

echo ""
read -p "Press Enter to return to menu..."
