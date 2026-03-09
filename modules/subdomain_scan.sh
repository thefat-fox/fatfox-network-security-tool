#!/bin/bash

echo "[+] Subdomain discovery..."

subfinder -d $TARGET -o output/scans/$TARGET/subdomains.txt

assetfinder $TARGET >> output/scans/$TARGET/subdomains.txt
