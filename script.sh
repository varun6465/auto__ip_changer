#!/bin/bash
echo "127.0.0.1:9050"
lightgreen='\e[1;32m'
echo -e "$lightgreen" ""
while true; do
sudo service tor restart  
#it automatically restarts the tor service in the tetminal
sleep 1
#the above sleep period is the time to get the new ip addr i would recommend 15 for using dark net
date +%T
#here is the actuall code goes down below
curl --socks5 127.0.0.1:9050 https://check.torproject.org |& grep -Po "(?<=strong>)[\d\.]+(?=</strong)"|sed 's/^/IP Changed with────────────────────█──<><><>───[ /g'|sed 's/$/ ]/g'
done
