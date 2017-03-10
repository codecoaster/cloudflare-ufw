#!/bin/bash
wget https://www.cloudflare.com/ips-v4 
wget https://www.cloudflare.com/ips-v6 
for cfip in `cat ips-v4`; do ufw allow from $cfip to any port 80 proto tcp; done
for cfip in `cat ips-v6`; do ufw allow from $cfip to any port 80 proto tcp; done
for cfip in `cat ips-v4`; do ufw allow from $cfip to any port 443 proto tcp; done
for cfip in `cat ips-v6`; do ufw allow from $cfip to any port 443 proto tcp; done
ufw reload
ufw status
