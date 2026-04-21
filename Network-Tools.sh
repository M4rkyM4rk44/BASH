#!/usr/bin/env bash

BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
PINK="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
NORMAL="\033[0;39m"

while true
do
	# Menu
    clear
	echo "Select an option:"
	echo ""
	echo "0) Exit Script"
	echo "1) Ping"
	echo "2) DNS Lookup"
    echo "3) Reverse DNS Lookup"
    echo "4) DNS to IP"
    echo "5) IP to DNS"
    echo "6) Traceroute"
    echo "7) Flush DNS Cache"
    echo "8) Get Local IP"
    echo "9) Get Public IP"
    echo "10) Get Public IP Location"
    echo "11) Whois Lookup"
	echo ""

	read -p "Option: " n
    case $n in
        0)
            clear
			exit
			;;
        1)
            clear
            echo "=====Ping====="
            echo ""
            read -p "Please enter an IP or Domain address: " i
            read -p "How many times would you like to ping: " t
            clear
            ping -c $t $i
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        2)
            clear
            echo "=====DNS Lookup====="
            echo ""
            read -p "Please enter a Domain address: " d
            echo ""
            echo "Default = Press Enter"
            echo "List of Text Records = txt"
            echo "List of Mail Servers = mx"
            echo "List of DNS Servers = ns"
            echo "List of IPV4 = a"
            echo "List of IPV6 = aaaa"
            echo "List of SOA = soa"
            echo ""
            read -p "Please enter your choice: " c
            clear
            echo "=====DNS Lookup====="
            echo ""
            printf "Results for $GREEN $d $NORMAL\n"
            echo ""
            nslookup -type=$c $d | awk 'NR > 5' | awk '1;/Authoritative answers can be found from:/{exit}' | sed '$ d'
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        3)
            clear
            echo "=====Reverse DNS Lookup====="
            echo ""
            read -p "Please enter an IP address: " i
            clear
            nslookup $i
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        4)
            clear
            echo "=====DNS to IP====="
            echo ""
            read -p "Please enter a Domain address: " d
            dig=$(dig $d A +short)
            #host -t a $d
            echo ""
            echo "IP: " $dig
            #host $i
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        5)
            clear
            echo "=====IP to DNS====="
            echo ""
            read -p "Please enter an IP address: " i
            d=$(dig -x $i +short)
            echo ""
            echo "DNS: " $d
            #host $i
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        6)
            clear
            sudo apt install traceroute -y
            clear
            echo "=====DNS Lookup====="
            echo ""
            read -p "Please enter a Domain address: " d
            echo ""
            traceroute $d
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        7)
            clear
            echo "=====Flush DNS Cache====="
            echo ""
            sudo resolvectl flush-caches
            echo "DNS Cache Flushed..."
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        8)
            clear
            echo "=====Get Local IP====="
            echo ""
            echo "Local IP is: $(hostname -I)"
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        9)
            clear
            echo "=====Get Public IP====="
            echo ""
            p=$(curl -s https://icanhazip.com)
            echo "Public IP is: " $p
            #curl https://ipinfo.io/ip # Option 2
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        10)
            clear
            echo "=====Get Public IP Location====="
            echo ""
            #sudo apt install geoip-bin -y # Option 2
            #clear # Option 2
            read -p "Please enter a Public IP address: " i
            clear
            #geolookup $i # Option 2
            curl ipinfo.io/$i
			echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        11)
            sudo apt install whois -y
            clear
            echo "=====Whois Lookup====="
            echo ""
            read -p "Please enter a Domain address: " d
            echo ""
            whois $d | awk '1;/>>>/{exit}' | sed '$ d'
            echo ""
			read -p "Press any key to continue ..."
            break
            ;;
        *)
            clear
            echo ""
			echo "Invalid Option!!"
			echo ""
			read -p "Press any key to continue ..."
            ;;
    esac
done
clear
