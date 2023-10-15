#!/bin/bash
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'
red='\033[0;31m'
green=[${green}OK${plain}] 
yellow=[${yellow}Info${plain}] 
red=[${red}Error${plain}] 

unlock(){
if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum install bind-utils
    echo y | yum install -y dnsmasq
elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
    apt-get update
    apt-get install dnsutils
    apt install -y dnsmasq
elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
    apt-get update
    apt-get install dnsutils
    apt install -y dnsmasq
else
    echo "This script only supports CentOS, Ubuntu and Debian."
    exit 1
fi

if [ $? -eq 0 ]; then
	systemctl enable dnsmasq
	chattr -i /etc/resolv.conf
	
	if [ ! -f '/etc/resolv.conf.bak' ];then
		cp -f /etc/resolv.conf /etc/resolv.conf.bak
	fi
	rm -f /etc/resolv.conf
	echo "nameserver 127.0.0.1" > /etc/resolv.conf
	chattr +i /etc/resolv.conf
	cat > /etc/dnsmasq.d/unlock.conf <<EOF
domain-needed
bogus-priv
no-resolv
no-poll
all-servers
server=8.8.8.8
server=1.1.1.1
cache-size=2048
local-ttl=60
interface=*
address=/akadns.net/$1
address=/akam.net/$1
address=/akamai.com/$1
address=/akamai.net/$1
address=/akamaiedge.net/$1
address=/akamaihd.net/$1
address=/akamaistream.net/$1
address=/akamaitech.net/$1
address=/akamaitechnologies.com/$1
address=/akamaitechnologies.fr/$1
address=/akamaized.net/$1
address=/edgekey.net/$1
address=/edgesuite.net/$1
address=/srip.net/$1
address=/footprint.net/$1
address=/level3.net/$1
address=/llnwd.net/$1
address=/edgecastcdn.net/$1
address=/cloudfront.net/$1
address=/netflix.com/$1
address=/netflix.net/$1
address=/nflximg.com/$1
address=/nflximg.net/$1
address=/nflxvideo.net/$1
address=/nflxso.net/$1
address=/nflxext.com/$1
address=/hulu.com/$1
address=/huluim.com/$1
address=/hbonow.com/$1
address=/hbogo.com/$1
address=/hbo.com/$1
address=/amazon.com/$1
address=/amazon.co.uk/$1
address=/amazonvideo.com/$1
address=/crackle.com/$1
address=/pandora.com/$1
address=/vudu.com/$1
address=/blinkbox.com/$1
address=/abc.com/$1
address=/fox.com/$1
address=/theplatform.com/$1
address=/nbc.com/$1
address=/nbcuni.com/$1
address=/ip2location.com/$1
address=/pbs.org/$1
address=/warnerbros.com/$1
address=/southpark.cc.com/$1
address=/cbs.com/$1
address=/brightcove.com/$1
address=/cwtv.com/$1
address=/spike.com/$1
address=/go.com/$1
address=/mtv.com/$1
address=/mtvnservices.com/$1
address=/playstation.net/$1
address=/uplynk.com/$1
address=/maxmind.com/$1
address=/disney.com/$1
address=/disneyjunior.com/$1
address=/adobedtm.com/$1
address=/bam.nr-data.net/$1
address=/bamgrid.com/$1
address=/braze.com/$1
address=/cdn.optimizely.com/$1
address=/cdn.registerdisney.go.com/$1
address=/cws.conviva.com/$1
address=/d9.flashtalking.com/$1
address=/disney-plus.net/$1
address=/disney-portal.my.onetrust.com/$1
address=/disney.demdex.net/$1
address=/disney.my.sentry.io/$1
address=/disneyplus.bn5x.net/$1
address=/disneyplus.com/$1
address=/disneyplus.com.ssl.sc.omtrdc.net/$1
address=/disneystreaming.com/$1
address=/dssott.com/$1
address=/execute-api.us-east-1.amazonaws.com/$1
address=/js-agent.newrelic.com/$1
address=/xboxlive.com/$1
address=/lovefilm.com/$1
address=/turner.com/$1
address=/amctv.com/$1
address=/sho.com/$1
address=/mog.com/$1
address=/wdtvlive.com/$1
address=/beinsportsconnect.tv/$1
address=/beinsportsconnect.net/$1
address=/fig.bbc.co.uk/$1
address=/open.live.bbc.co.uk/$1
address=/sa.bbc.co.uk/$1
address=/www.bbc.co.uk/$1
address=/crunchyroll.com/$1
address=/ifconfig.co/$1
address=/omtrdc.net/$1
address=/sling.com/$1
address=/movetv.com/$1
address=/happyon.jp/$1
address=/abema.tv/$1
address=/hulu.jp/$1
address=/optus.com.au/$1
address=/optusnet.com.au/$1
address=/gamer.com.tw/$1
address=/bahamut.com.tw/$1
address=/hinet.net/$1
address=/dmm.com/$1
address=/dmm.co.jp/$1
address=/dmm-extension.com/$1
address=/dmmapis.com/$1
address=/api-p.videomarket.jp/$1
address=/saima.zlzd.xyz/$1
address=/fast.com/$2
address=/netflix.ca/$2
address=/netflixinvestor.com/$2
address=/netflixtechblog.com/$2
address=/nflxsearch.net/$2
address=/hotstar.com/$2
address=/akadns.net/$2
address=/akam.net/$2
address=/akamai.com/$2
address=/akamai.net/$2
address=/akamaiedge.net/$2
address=/akamaihd.net/$2
address=/akamaistream.net/$2
address=/akamaitech.net/$2
address=/akamaitechnologies.com/$2
address=/akamaitechnologies.fr/$2
address=/akamaized.net/$2
address=/edgekey.net/$2
address=/edgesuite.net/$2
address=/srip.net/$2
address=/footprint.net/$2
address=/level3.net/$2
address=/llnwd.net/$2
address=/edgecastcdn.net/$2
address=/cloudfront.net/$2
address=/netflix.com/$2
address=/netflix.net/$2
address=/nflximg.com/$2
address=/nflximg.net/$2
address=/nflxvideo.net/$2
address=/nflxso.net/$2
address=/nflxext.com/$2
address=/hulu.com/$2
address=/huluim.com/$2
address=/hbonow.com/$2
address=/hbogo.com/$2
address=/hbo.com/$2
address=/amazon.com/$2
address=/amazon.co.uk/$2
address=/amazonvideo.com/$2
address=/crackle.com/$2
address=/pandora.com/$2
address=/vudu.com/$2
address=/blinkbox.com/$2
address=/abc.com/$2
address=/fox.com/$2
address=/theplatform.com/$2
address=/nbc.com/$2
address=/nbcuni.com/$2
address=/ip2location.com/$2
address=/pbs.org/$2
address=/warnerbros.com/$2
address=/southpark.cc.com/$2
address=/cbs.com/$2
address=/brightcove.com/$2
address=/cwtv.com/$2
address=/spike.com/$2
address=/go.com/$2
address=/mtv.com/$2
address=/mtvnservices.com/$2
address=/playstation.net/$2
address=/uplynk.com/$2
address=/maxmind.com/$2
address=/disney.com/$2
address=/disneyjunior.com/$2
address=/adobedtm.com/$2
address=/bam.nr-data.net/$2
address=/bamgrid.com/$2
address=/braze.com/$2
address=/cdn.optimizely.com/$2
address=/cdn.registerdisney.go.com/$2
address=/cws.conviva.com/$2
address=/d9.flashtalking.com/$2
address=/disney-plus.net/$2
address=/disney-portal.my.onetrust.com/$2
address=/disney.demdex.net/$2
address=/disney.my.sentry.io/$2
address=/disneyplus.bn5x.net/$2
address=/disneyplus.com/$2
address=/disneyplus.com.ssl.sc.omtrdc.net/$2
address=/disneystreaming.com/$2
address=/dssott.com/$2
address=/execute-api.us-east-1.amazonaws.com/$2
address=/js-agent.newrelic.com/$2
address=/xboxlive.com/$2
address=/lovefilm.com/$2
address=/turner.com/$2
address=/amctv.com/$2
address=/sho.com/$2
address=/mog.com/$2
address=/wdtvlive.com/$2
address=/beinsportsconnect.tv/$2
address=/beinsportsconnect.net/$2
address=/fig.bbc.co.uk/$2
address=/open.live.bbc.co.uk/$2
address=/sa.bbc.co.uk/$2
address=/www.bbc.co.uk/$2
address=/crunchyroll.com/$2
address=/ifconfig.co/$2
address=/omtrdc.net/$2
address=/sling.com/$2
address=/movetv.com/$2
address=/happyon.jp/$2
address=/abema.tv/$2
address=/hulu.jp/$2
address=/optus.com.au/$2
address=/optusnet.com.au/$2
address=/gamer.com.tw/$2
address=/bahamut.com.tw/$2
address=/hinet.net/$2
address=/dmm.com/$2
address=/dmm.co.jp/$2
address=/dmm-extension.com/$2
address=/dmmapis.com/$2
address=/api-p.videomarket.jp/$2
address=/saima.zlzd.xyz/$2
address=/fast.com/$2
address=/netflix.ca/$2
address=/netflixinvestor.com/$2
address=/netflixtechblog.com/$2
address=/nflxsearch.net/$2
address=/hotstar.com/$2
EOF

    systemctl restart dnsmasq
    echo -e "${green} dnsmasq启动成功"
    echo ""
    echo -e "${yellow} 系统当前DNS（显示为127.0.0.1是正常）"
    echo "---------------------"
    cat /etc/resolv.conf
    echo ""
    echo -e "${yellow} DNS备份文件 /etc/resolv.conf.bak"
    echo "---------------------"
    cat /etc/resolv.conf.bak
    echo ""
    echo -e "${yellow} ping netflix.com为你落地机的ip说明解锁成功"
    echo -e "${yellow} 需要重启你的ss/v2/trojan等代理服务解锁才会生效"
else
    echo -e "${red} dnsmasq安装失败, 请检查仓库状况"
fi
}

re_dns(){
if [ -f '/etc/resolv.conf.bak' ];then
	echo -e "${yellow} 检测到DNS备份文件，从备份文件恢复系统DNS设置..."
	chattr -i /etc/resolv.conf
	rm -f /etc/resolv.conf
	cp -f /etc/resolv.conf.bak /etc/resolv.conf
else
	echo -e "${yellow} 没有备份DNS文件，使用通用DNS"
	chattr -i /etc/resolv.conf
	cat > /etc/resolv.conf <<EOF
nameserver 8.8.8.8
nameserver 1.1.1.1
EOF
fi
	echo -e "${yellow} 禁用dnsmasq服务..."
	systemctl stop dnsmasq
	systemctl disable dnsmasq
	echo -e "${green} 完成，查看当前系统DNS（不是127.0.0.1说明成功）"
	echo "---------------------"
	cat /etc/resolv.conf
}

case "$1" in
"")
echo -e "${yellow} 当前系统DNS"
echo "---------------------"
cat /etc/resolv.conf
;;

"r")
re_dns
;;

#else
*)
unlock $1 $2
;;
esac
