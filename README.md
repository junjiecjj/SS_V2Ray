# ss_v2ray


########################################shadowsocks      ##########################################

shadowsocks：

其中shadowsocks_server.json是服务端的文件，在/etc/shadowsocks.json下
ss_local_start1.sh和sslocal1.json是客户端的文件，放在同一个文件下


    历史命令，服务器端安装shadowsocks:
   $: wget  --no-check-certificate -O  shadowsocks.sh   https://raw.githubusercontent.com/teddysun/shadowsocks_install/master/shadowsocks.sh
   $:  chmod +x shadowsocks.sh
    $:  sudo ./shadowsocks.sh 2>&1 | tee shadowsocks.log
    $:  su
    $:   ssserver -c /etc/shadowsocks.json -d start


    服务器端启动：
   $:   sudo ssserver -c /etc/shadowsocks.json -d start

    服务器端停止：
   $:   sudo ssserver -c /etc/shadowsocks.json -d stop


    客户端安装shadowsocks:

    客户端启动shadowsocks:
    
    客户端再重新启动shadowsocks之前得把之前的杀掉
    $:     su
    $:     bash    ss_loacl_start.sh

客户端的shadowsocks配置文件在：
                          /文档/翻墙/ss_local_start1.sh     下
                           /文档/翻墙/sslocal1.json              下
                           $:  cd   ~/文档/翻墙/
                           $:sudo  bash  ss_local_start1.sh
                           
服务端的shadowsocks配置文件在:/etc/shadowsocks.json下


###############################################分割线##########################################


################################################v2ray开始###################################################
其中v2ray_config_server.json是服务端的配置文件，在服务端的/etc/v2ray/config.json下
其中v2ray_config_local.json是服务端的配置文件，在客户端/etc/v2ray/config.json下


服务器端安装并启动v2ray:
    方法一：
        首先校准时间
        $: wget https://install.direct/go.sh
        sudo bash go.sh
        安装完成
        启动v2ray
        $:sudo systemctl start v2ray
    方法二：
        $:bash <(curl -L -s https:/install.direct/go.sh)
        运行 service v2ray start启动v2ray进程
        之后可以使用service v2ray start/stop/status/reload/restart/force-reload控制v2ray的运行

    以上需要管理员权限
    安装完后服务端会存在以下文件：
    1、/usr/bin/v2ray/v2ray：v2ray程序
    2、/usr/bin/v2ray/v2ctl：v2ray工具
    3、/etc/v2ray/config.json：配置文件
    4、/usr/bin/v2ray/geoip.dat：IP数据文件
    5、/usr/bin/v2ray/geosite.dat：域名数据文件

    运行脚本位于系统的以下位置：
    1、/etc/systemd/system/v2ray.service.Systemd
    2、/etc/init.d/v2ray:SysV

客户端：
    客户端安装v2ray:
    客户端启动v2ray:




客户端和服务端的v2ray的配置文件都在：/etc/v2ray/config.json下
###############################   v2ray配置   结束####################################
