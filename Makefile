
help:
	@cat Makefile

.configure:
	@sudo apt update
	@sudo apt install -y strongswan

replace-configs:
	@sudo cp -vrf ./rootpath/* /

net-route-configure:
	#@sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
	#@sudo echo 1 > /proc/sys/net/ipv4/ip_forward
	#@echo "uncomment <net.ipv4.ip_forward=1> in /etc/sysctl.conf"
journal:
	@sudo journalctl -xeu strongswan-starter

status:
	@sudo systemctl status strongswan-starter
restart:
	@sudo systemctl restart strongswan-starter
stop:
	@sudo systemctl stop strongswan-starter

mega-upgrade: pull replace-configs edit

pull:
	@git pull

edit:
	@sudo nvim /etc/ipsec.conf
edit-secrets:
	@sudo nvim /etc/ipsec.secrets

