help:
	@less Makefile

.configure:
	@sudo apt update
	@sudo apt install -y strongswan
	@sudo apt install -y libcharon-extra-plugins
	@sudo apt install -y libcharon-extauth-plugins
	@sudo apt install -y libstrongswan-extra-plugins

edit:
	@sudo editor /etc/ipsec.conf
edit.secrets:
	@sudo editor /etc/ipsec.secrets

journal:
	@sudo journalctl -xeu strongswan-starter
status:
	@sudo systemctl status strongswan-starter
restart:
	@sudo systemctl restart strongswan-starter
stop:
	@sudo systemctl stop strongswan-starter
