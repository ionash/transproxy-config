#/bin/bash

export http_proxy=http://localhost:8080 # squid4
export https_proxy=$http_proxy
# exclude private IPs
export no_proxy=127.0.0.0/8,::1,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,fd00::/8

# TODO: when accessing to the Internet from docker build environment, PREROUTING seems to be needed
sudo iptables -t nat -I PREROUTING -p tcp --dport 22 -j REDIRECT --to-ports 3128   # tcp
sudo iptables -t nat -I PREROUTING -p tcp --dport 5000 -j REDIRECT --to-ports 3128 # tcp
sudo iptables -t nat -I PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3129   # http
sudo iptables -t nat -I PREROUTING -p tcp --dport 443 -j REDIRECT --to-ports 3130  # https

sudo iptables -t nat -I OUTPUT -p tcp --dport 22 -j REDIRECT --to-ports 3128   # tcp
sudo iptables -t nat -I OUTPUT -p tcp --dport 5000 -j REDIRECT --to-ports 3128 # tcp
sudo iptables -t nat -I OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 3129   # http
sudo iptables -t nat -I OUTPUT -p tcp --dport 443 -j REDIRECT --to-ports 3130  # https

transproxy -disable-iptables #-dns-over-https-enabled
