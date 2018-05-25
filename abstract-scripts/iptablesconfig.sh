# Script to configure iptables in the Abstractmusic server
# Copyright (C) 2018 Ander Areitio, Leire Barainka and Borja Turiel for the Abstract Music Project - All Rights Reserved
# Permission to copy and modify is granted under the MIT license
# Revisions:
# V1.0 -> Configuration of iptables to only allow 80, 443 and 22332 ports

#Config taken from:
#https://mikeeverhart.net/2015/04/how-to-use-iptables-to-block-all-ssh-traffic-port-22-except-for-your-ip/
#Allowing apt-get taken from:
#https://serverfault.com/questions/752691/iptables-apt-get-and-wget-not-working


#Check if user is root

rootcheck () {
    if [ $(id -u) != "0" ]
    then
        sudo "$0" "$@"
        exit $?
    fi
}

#Install iptables if not installed

apt install iptables -y

#Remove all past iptables policies

iptables -F

#1. Add the following rule for each IP address that you want to whitelist:

#iptables -A INPUT -p tcp -s 85.85.186.64 --dport 22332 -j ACCEPT

#1.1. Or allow a hole network

#iptables -A INPUT -p tcp -s 10.22.0.0/24 --dport 22332 -j ACCEPT

#2. Next, add a rule to block all other IPs:
#iptables -A INPUT -p tcp --dport 22332 -j DROP

#Permit OUTPUT packages to return as INPUT, so you can run apt update

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

#DROP shows filtered, REJECT closed
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22332 -j ACCEPT

iptables -A INPUT -j DROP

	
#3. Save your new rules so they persist after reboot:

iptables-save

