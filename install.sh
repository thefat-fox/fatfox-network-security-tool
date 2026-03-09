#!/bin/bash

echo "[+] Installing FatFox dependencies..."

sudo apt update

sudo apt install -y \
nmap \
nikto \
curl \
jq \
dnsutils \
whois \
traceroute \
exploitdb

echo "[+] Installing recon tools..."

if ! command -v subfinder &> /dev/null
then
go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
fi

if ! command -v assetfinder &> /dev/null
then
go install github.com/tomnomnom/assetfinder@latest
fi

echo "[+] Creating directories..."

mkdir -p reports
mkdir -p recon
mkdir -p output

chmod +x fatfox.sh
chmod +x modules/*.sh

echo ""
echo "[✔] FatFox installation complete"
echo "Run the tool with:"
echo ""
echo "bash fatfox.sh"
