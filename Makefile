
help:
	@echo 'there is no tips (yet)'

pull:
	@git pull

aptupgrade:
	@apt update && apt upgrade

pre-install:
	@apt install -y neovim tmux zsh mc tree

install:
	@apt install -y strongswan

replace-configs:
	@cp -vrf ./rootpath/* /

net-route-configure:
	@iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
	@echo 1 > /proc/sys/net/ipv4/ip_forward
	@echo "uncomment <net.ipv4.ip_forward=1> in /etc/sysctl.conf"

status:
	@systemctl status strongswan-starter
restart:
	@systemctl restart strongswan-starter
stop:
	@systemctl stop strongswan-starter

mega-upgrade: pull replace-configs edit

edit:
	@nvim /etc/ipsec.conf
edit-secrets:
	@nvim /etc/ipsec.secrets
