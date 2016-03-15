#!/bin/bash

iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 22 -j DROP
iptables -I INPUT -p tcp -s 129.21.0.0/16 --dport 22 -j ACCEPT

iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 8006 -j DROP
iptables -I INPUT -p tcp -s 129.21.0.0/16 --dport 8006 -j ACCEPT

iptables -A INPUT -m set --match-set whitelist src -j ACCEPT
