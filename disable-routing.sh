#/bin/bash

# PREROUTING
sudo iptables -t nat -D PREROUTING 1
sudo iptables -t nat -D PREROUTING 1
sudo iptables -t nat -D PREROUTING 1
sudo iptables -t nat -D PREROUTING 1

# OUTPUT
sudo iptables -t nat -D OUTPUT 1
sudo iptables -t nat -D OUTPUT 1
sudo iptables -t nat -D OUTPUT 1
sudo iptables -t nat -D OUTPUT 1
