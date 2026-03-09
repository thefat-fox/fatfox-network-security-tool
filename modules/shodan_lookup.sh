#!/bin/bash

echo ""
echo "===== FATFOX SHODAN INTELLIGENCE ====="
echo ""

read -p "Enter Target IP: " target

read -p "Enter Shodan API Key: " key

curl "https://api.shodan.io/shodan/host/$target?key=$key"
