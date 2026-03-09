#!/bin/bash

echo "[+] WHOIS lookup..."

whois $TARGET > output/$TARGET/whois.txt
