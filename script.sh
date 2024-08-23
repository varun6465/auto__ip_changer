#!/bin/bash

# Display the initial IP address with a light green color
echo "127.0.0.1:9050"
lightgreen='\e[1;32m'
echo -e "${lightgreen}Initial IP:"

# Loop to restart Tor and check IP address continuously
while true; do
    # Restart the Tor service
    sudo service tor restart
    
    # Wait for a short period to allow Tor to restart
    sleep 15 # Adjust sleep duration as needed

    # Display the current time
    date +%T

    # Check the current IP address using Tor and format the output
    curl --socks5 127.0.0.1:9050 https://check.torproject.org 2>/dev/null | \
    grep -Po "(?<=strong>)[\d\.]+(?=</strong)" | \
    sed 's/^/IP Changed with────────────────────█──<><><>───[ /g' | \
    sed 's/$/ ]/g'

    # Optional: Sleep for a bit before restarting the Tor service again
    sleep 10 # Adjust sleep duration as needed
done
