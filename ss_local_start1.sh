#!/bin/bash
#	to open the sslocal for vpn
nohup /usr/bin/sslocal -c ./shadowsocks_local.json  -d start &
#nohup  sslocal -c ./shadowsocks_local.json  -d start &
