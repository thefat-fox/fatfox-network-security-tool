#!/bin/bash

echo "[+] Installing FatFox dependencies..."

sudo apt update

sudo apt install -y \
nmap \
nikto \
traceroute \
exploitdb \
whois \
dnsutils

echo "[+] Installing recon tools..."

go install github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install github.com/tomnomnom/assetfinder@latest

echo "[+] Setup directories..."

mkdir -p reports
mkdir -p recon
mkdir -p output

chmod +x fatfox.sh
chmod +x modules/*.sh

echo ""
echo "[✔] FatFox Installation Complete"
echo "Run with:"
echo "./fatfox.sh"
