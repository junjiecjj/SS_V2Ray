
$: git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

$: wget https://raw.githubusercontent.com/junjiecjj/configure_file/master/vimrc  -O ~/.vimrc

#######################分割线##########################################

shadowsocks：

	其中shadowsocks_server.json是服务端的文件，在/etc/shadowsocks.json下
    
	ss_local_start1.sh和shadowsocks_local.json是客户端的文件，放在同一个文件下

-----------------------------服务端--------------------------------------------

    历史命令，服务器端安装shadowsocks:
    
	方法一：
    
    	34  $: wget --no-check-certificate -O shadowsocks.sh https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh
        
    	35  $: chmod +x shadowsocks.sh
        
    	41  $: sudo ./shadowsocks.sh 2>&1 | tee shadowsocks.log
        
    	43  $: sudo ssserver -c /etc/shadowsocks.json -d start
        
	方法二：
    
	$: sudo apt-get python3-pip
    
	$: sudo pip3 install shadowsocks

    服务器端启动：
    
    	sudo ssserver -c /etc/shadowsocks.json -d start

    服务器端停止：
    
    	sudo ssserver -c /etc/shadowsocks.json -d stop

    服务端其他命令：
    
	卸载：
    
	./shadowsocks.sh uninstall
    
	控制：
    
	sudo /etc/init.d/shadowsocks start      # 启动
    
	sudo /etc/init.d/shadowsocks stop       # 停止
    
	sudo /etc/init.d/shadowsocks restart    # 重启
    
	sudo /etc/init.d/shadowsocks status     # 状态

     服务端的shadowsocks配置文件在:/etc/shadowsocks.json下

-----------------------------客户端--------------------------------

    客户端安装shadowsocks:
    
	$: apt-get install shadowsocks
    
    客户端启动shadowsocks:
    
    	客户端再重新启动shadowsocks之前得把之前的杀掉
        
	$:sudo kill pid
    
    	$:su
        
    	$:bash ss_loacl_start1.sh

    客户端的shadowsocks配置文件在：
    
		/文档/翻墙/陈俊杰/ss_local_start1.sh下
        
		/文档/翻墙/陈俊杰/shadowsocks_local.json下
        
		$:cd   ~/文档/翻墙/陈俊杰/
        
		$:sudo  bash  ss_local_start1.sh  #启动


    前端启动：sudo sslocal -c ~/文档/翻墙/陈俊杰/shadowsocks_local.json
    
    后端启动：sudo sslocal -c ~/文档/翻墙/陈俊杰/shadowsocks_local.json -d start
    
    后端停止：sudo sslocal -c ~/文档/翻墙/陈俊杰/shadowsocks_local.json -d stop
    
    重启(修改配置要重启才生效)：sslocal -c /home/xx/Software/ShadowsocksConfig/shadowsocks.json -d restart
    

    客户端开机自启
    
	以下使用Systemd来实现shadowsocks开机自启。

	sudo vim /etc/systemd/system/shadowsocks.service
    
	在里面填写如下内容：

	[Unit]
    
	Description=Shadowsocks Client Service
    
	After=network.target

	[Service]
    
	Type=simple
    
	User=root
    
	ExecStart=/usr/bin/sslocal -c ~/文档/翻墙/陈俊杰/shadowsocks_local.json

	[Install]
    
	WantedBy=multi-user.target

	把~/文档/翻墙/陈俊杰/shadowsocks_local.json修改为你的shadowsocks.json路径，如：/etc/shadowsocks.json

	配置生效：
    
	systemctl enable /etc/systemd/system/shadowsocks.service

	关闭开机自动启动：
    
	$: systemctl disable myapp.service

	输入管理员密码就可以了。

	现在你可以马上重启试试，或先在后台启动，等下次重启再看看！

------------------------------------------------------------------------------
	解决shadowsocks不能访问谷歌学术的：

		首先，找到最新的 Google IPv6 地址，可以在这里查看：https://raw.githubusercontent.com/lennylxx/ipv6-hosts/master/hosts

		找到 Google 学术对应的 IPv6 地址后，修改服务器的 hosts 文件，vim /etc/hosts，在文件的最后加入如下配置：

		## Scholar 学术搜索
        
		2404:6800:4008:c06::be scholar.google.com
        
		2404:6800:4008:c06::be scholar.google.com.hk
        
		2404:6800:4008:c06::be scholar.google.com.tw
        
		2404:6800:4005:805::200e scholar.google.cn #www.google.cn
        
		然后，重启 shadowsocks 服务端程序：

		/etc/init.d/shadowsocks restart
        
		注：不同的搭建方式可能重启的方式不太一样。我的搭建方式请参考：shadowsocks服务端搭建
        
		之后，就能够正常访问谷歌学术的网站了。

#######################分割线##########################################

########################v2ray安装及其配置###############################

	其中v2ray_config_server.json是服务端的配置文件，在服务端的/etc/v2ray/config.json下
    
	其中v2ray_config_local.json是服务端的配置文件，在客户端/etc/v2ray/config.json下

	服务器端安装并启动v2ray:
    
    		方法一：
            
        	首先校准时间:
            
        	$: wget https://install.direct/go.sh
            
        	$: sudo bash go.sh
            
        	安装完成

    		方法二：
            
        	$:bash <(curl -L -s https://install.direct/go.sh)
    	
		安装完后服务端会存在以下文件：
        
    		1、/usr/bin/v2ray/v2ray：v2ray程序
            
    		2、/usr/bin/v2ray/v2ctl：v2ray工具
            
    		3、/etc/v2ray/config.json：配置文件
            
    		4、/usr/bin/v2ray/geoip.dat：IP数据文件
            
    		5、/usr/bin/v2ray/geosite.dat：域名数据文件        	

		启动v2ray
        
        	$:sudo systemctl start v2ray
            
        	或$:sudo service v2ray start
            
		启动v2ray进程
        
        	之后可以使用sudo service v2ray start/stop/status/reload/restart/force-reload或
            
			sudo systemctl start|restart|stop|status v2ray控制v2ray的运行

    		以上需要管理员权限

    		运行脚本位于系统的以下位置：
            
    		1、/etc/systemd/system/v2ray.service.Systemd
            
    		2、/etc/init.d/v2ray:SysV

	客户端：
    
    		客户端安装v2ray:和服务端一样
            
   		客户端启动v2ray:和服务端一样

	客户端和服务端的v2ray的配置文件都在：/etc/v2ray/config.json下
    
###########v2ray配置结束########################################################
