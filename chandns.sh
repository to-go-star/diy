#bin/bash!
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

input=y
while [[ "$input" == "y" ]]
do
    result=$(curl --user-agent "${UA_Browser}" -fsL --write-out %{http_code} --output /dev/null --max-time 10 "https://www.netflix.com/title/70143836" 2>&1)
    if [[ "$result" != "200" ]];then
        echo -e "解锁掉了。开始切换IP$(date)"
        curl -sL https://api.pqs.pw/ipch/txu8np7ip7
        newip=$(curl -sSL -4 "https://api.ip.sb/geoip" 2>&1)
        ip=$(echo $newip | python3 -m json.tool 2> /dev/null | grep ip | cut -f4 -d'"')
        echo -e "切换到新IP：$ip，开始复写规则"
       echo -e "domain-needed\nbogus-priv\nno-resolv\nno-poll\nall-servers\nserver=8.8.8.8\nserver=1.1.1.1\nserver=208.67.222.222\nserver=4.2.2.1\ncache-size=2048\nlocal-ttl=60\ninterface=*\naddress=/akadns.net/$ip\naddress=/akam.net/$ip\naddress=/akamai.com/$ip\naddress=/akamai.net/$ip\naddress=/akamaiedge.net/$ip\naddress=/akamaihd.net/$ip\naddress=/akamaistream.net/$ip\naddress=/akamaitech.net/$ip\naddress=/akamaitechnologies.com/$ip\naddress=/akamaitechnologies.fr/$ip\naddress=/akamaized.net/$ip\naddress=/edgekey.net/$ip\naddress=/edgesuite.net/$ip\naddress=/srip.net/$ip\naddress=/footprint.net/$ip\naddress=/level3.net/$ip\naddress=/llnwd.net/$ip\naddress=/edgecastcdn.net/$ip\naddress=/cloudfront.net/$ip\naddress=/netflix.com/$ip\naddress=/netflix.net/$ip\naddress=/nflximg.net/$ip\naddress=/nflxvideo.net/$ip\naddress=/nflxso.net/$ip\naddress=/nflxext.com/$ip\naddress=/hulu.com/$ip\naddress=/huluim.com/$ip\naddress=/hbonow.com/$ip\naddress=/hbogo.com/$ip\naddress=/hbo.com/$ip\naddress=/amazon.com/$ip\naddress=/amazon.co.uk/$ip\naddress=/amazonvideo.com/$ip\naddress=/crackle.com/$ip\naddress=/pandora.com/$ip\naddress=/vudu.com/$ip\naddress=/blinkbox.com/$ip\naddress=/abc.com/$ip\naddress=/fox.com/$ip\naddress=/theplatform.com/$ip\naddress=/nbc.com/$ip\naddress=/nbcuni.com/$ip\naddress=/ip2location.com/$ip\naddress=/pbs.org/$ip\naddress=/warnerbros.com/$ip\naddress=/southpark.cc.com/$ip\naddress=/cbs.com/$ip\naddress=/brightcove.com/$ip\naddress=/cwtv.com/$ip\naddress=/spike.com/$ip\naddress=/go.com/$ip\naddress=/mtv.com/$ip\naddress=/mtvnservices.com/$ip\naddress=/playstation.net/$ip\naddress=/uplynk.com/$ip\naddress=/maxmind.com/$ip\naddress=/disney.com/$ip\naddress=/disneyjunior.com/$ip\naddress=/xboxlive.com/$ip\naddress=/lovefilm.com/$ip\naddress=/turner.com/$ip\naddress=/amctv.com/$ip\naddress=/sho.com/$ip\naddress=/mog.com/$ip\naddress=/wdtvlive.com/$ip\naddress=/beinsportsconnect.tv/$ip\naddress=/beinsportsconnect.net/$ip\naddress=/fig.bbc.co.uk/$ip\naddress=/open.live.bbc.co.uk/$ip\naddress=/sa.bbc.co.uk/$ip\naddress=/www.bbc.co.uk/$ip\naddress=/crunchyroll.com/$ip\naddress=/ifconfig.co/$ip\naddress=/omtrdc.net/$ip\naddress=/sling.com/$ip\naddress=/movetv.com/$ip\naddress=/happyon.jp/$ip\naddress=/abema.tv/$ip\naddress=/hulu.jp/$ip\naddress=/optus.com.au/$ip\naddress=/optusnet.com.au/$ip\naddress=/gamer.com.tw/$ip\naddress=/bahamut.com.tw/$ip\naddress=/hinet.net/$ip
"  > /etc/dnsmasq.d/custom_netflix.conf
       
        /etc/init.d/dnsmasq restart
        
        sleep 2
    else  
        echo -e "当前IP:$ip 解锁奈飞正常$(date)"
        sleep 180


    fi
done
