
help:
	@echo 'there is no tips (yet)'

pull:
	@git pull

aptupgrade:
	@sudo apt update && apt upgrade

pre-install:
	@sudo apt install -y neovim tmux mc
pre-install-2: pre-install
	@sudo apt install -y zsh tree

install:
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

edit:
	@sudo nvim /etc/ipsec.conf
edit-secrets:
	@sudo nvim /etc/ipsec.secrets

