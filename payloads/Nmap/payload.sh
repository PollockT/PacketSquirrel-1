#!/bin/bash

# Nmap for the Packet Squirrel
# Author: Trigat.com

# Initialize by turning Purple
LED M SOLID
sleep 5

NETMODE NAT

# Sleep long enough to grab IP in NAT mode
sleep 40

##### OPTIONS

EXTPATH="/mnt/loot/nmap"
LOG="nmap_$(date +%Y-%m-%d-%H-%M)"

#####

mkdir -p $EXTPATH

# Grab the network you are in
my_net=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}')

# Don't scan the local Packet Squirrel network
rem_string="172.16.32.0/24"
foo=${my_net#"$rem_string"}
foo=${foo%"$rem_string"}

sleep 2

LED Y SOLID
# Turn Yellow when running
nmap -oN $EXTPATH/$LOG -F -T 4 $foo

# Turn Green when finished
LED FINISH

##### GUIDE
#
# Use Ethernet Out port on Packet Squirrel when connecting to target router or switch.
#
# USB drive must be plugged into Packet Squirrel.
#
# Directory /mnt/loot/nmap will be created.
# Nmap log will be save to /mnt/loot/nmap.
#
# LED COLOR MEANING
#
# PURPLE - Initializing and getting IP
# YELLOW - Running Nmap scan
# GREEN  - Complete
#
#####
