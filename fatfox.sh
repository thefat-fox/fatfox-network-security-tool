#!/bin/bash

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

while true
do

clear

# Banner
if [ -f config/banner.txt ]; then
    cat config/banner.txt
else
    echo "======================================"
    echo "        FATFOX NETWORK TOOL"
    echo "======================================"
fi

echo ""
echo -e "${CYAN}========== MENU ==========${NC}"
echo ""
echo "1 Host Discovery"
echo "2 Port Scan"
echo "3 Service Scan"
echo "4 Vulnerability Scan"
echo "5 Web Scan"
echo "6 Subdomain Recon"
echo "7 Exploit Suggestions"
echo "8 Target Intelligence"
echo "9 Exit"
echo ""

read -p "Select: " option

case $option in

1)
echo ""
echo "[+] Running Host Discovery..."
bash modules/host_discovery.sh
;;

2)
echo ""
echo "[+] Running Port Scan..."
bash modules/port_scan.sh
;;

3)
echo ""
echo "[+] Running Service Scan..."
bash modules/service_scan.sh
;;

4)
echo ""
echo "[+] Running Vulnerability Scan..."
bash modules/vuln_scan.sh
;;

5)
echo ""
echo "[+] Running Web Scan..."
bash modules/web_scan.sh
;;

6)
echo ""
echo "[+] Running Subdomain Recon..."
bash modules/subdomain_scan.sh
;;

7)
echo ""
echo "[+] Searching Exploit Suggestions..."
bash modules/exploit_suggest.sh
;;

8)
echo ""
echo "[+] Gathering Target Intelligence..."
bash modules/ip_info.sh
;;

9)
echo ""
echo -e "${GREEN}Exiting FatFox...${NC}"
exit
;;

*)
echo ""
echo -e "${RED}Invalid option. Try again.${NC}"
sleep 2
;;

esac

done
