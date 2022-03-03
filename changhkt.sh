#bin/bash!
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

input=y
while [[ "$input" == "y" ]]
do
    result=$(curl --user-agent "${UA_Browser}" -fsL --write-out %{http_code} --output /dev/null --max-time 10 "https://www.netflix.com/title/70143836" 2>&1)
    if [[ "$result" != "200" ]];then
        echo -e "解锁掉了。开始切换IP！！时间：$(date)"
        interface_name="$(ip -4 route | awk -F' ' '/default/{print $5}')"
        mac="$(echo 00:60:2f:`openssl rand -hex 3 | sed 's/\(..\)/\1:/g; s/.$//'`)"
        ifconfig ${interface_name} hw ether ${mac}
        dhclient -r -v ${interface_name}
        rm -rf /var/lib/dhcp/dhclient.leases
        dhclient -v ${interface_name}
        ifdown ${interface_name} && ifup ${interface_name}
        sleep 5
        ip=$(curl -sSL -4 "http://ipv4.ip.sb" 2>&1)
        until [[ "$ip" != "" ]]
    do        
        ip=$(curl -sSL -4 "http://ipv4.ip.sb" 2>&1)
        echo -e "获取IP中"
    done
        echo -e "切换到新IP：$ip，开始复写规则"
       echo -e "domain-needed\nbogus-priv\nno-resolv\nno-poll\nall-servers\nserver=8.8.8.8\nserver=1.1.1.1\nserver=208.67.222.222\nserver=4.2.2.1\ncache-size=2048\nlocal-ttl=60\ninterface=*\naddress=/akadns.net/$ip\naddress=/akam.net/$ip\naddress=/akamai.com/$ip\naddress=/akamai.net/$ip\naddress=/akamaiedge.net/$ip\naddress=/akamaihd.net/$ip\naddress=/akamaistream.net/$ip\naddress=/akamaitech.net/$ip\naddress=/akamaitechnologies.com/$ip\naddress=/akamaitechnologies.fr/$ip\naddress=/akamaized.net/$ip\naddress=/edgekey.net/$ip\naddress=/edgesuite.net/$ip\naddress=/srip.net/$ip\naddress=/level3.net/$ip\naddress=/llnwd.net/$ip\naddress=/edgecastcdn.net/$ip\naddress=/cloudfront.net/$ip\naddress=/netflix.com/$ip\naddress=/netflix.net/$ip\naddress=/nflximg.net/$ip\naddress=/nflxvideo.net/$ip\naddress=/nflxso.net/$ip\naddress=/nflxext.com/$ip\naddress=/oculus.com/$ip\naddress=/ip2location.com/$ip\naddress=/warnerbros.com/$ip\naddress=/southpark.cc.com/$ip\naddress=/brightcove.com/$ip\naddress=/uplynk.com/$ip\naddress=/maxmind.com/$ip\naddress=/braze.com/$ip\naddress=/disney.com/$ip\naddress=/disneyjunior.com/$ip\naddress=/disney-plus.net/$ip\naddress=/disneyplus.com/$ip\naddress=/dssott.com/$ip\naddress=/cdn.registerdisney.go.com/$ip\naddress=/global.edge.bamgrid.com/$ip\naddress=/bamgrid.com/$ip\naddress=/registerdisney.go.com/$ip\naddress=/disneyplus.com.ssl.sc.omtrdc.net/$ip\naddress=/dssott.com.akamaized.net/$ip\naddress=/braze.com/$ip\naddress=/cws.conviva.com/$ip\naddress=/execute-api.us-east-1.amazonaws.com/$ip\naddress=/go-mpulse.net/$ip\naddress=/disneynow.com/$ip\naddress=/search-api-disney.bamgrid.com/$ip\naddress=/d9.flashtalking.com/$ip\naddress=/disney-portal.my.onetrust.com/$ip\naddress=/disneyplus.bn5x.net/$ip\naddress=/adobedtm.com/$ip\naddress=/optimizely.com/$ip\naddress=/disneystreaming.com/$ip\naddress=/com.disney.disneyplus/$ip\naddress=/go-disneyworldgo.com/$ip\naddress=/go.com/$ip\naddress=/thestationbymaker.com/$ip\naddress=/thisispolaris.com/$ip\naddress=/watchdisneyfe.com/$ip
"  > /etc/dnsmasq.d/custom_netflix.conf
       python /root/DDNS/run.py -c /root/DDNS/config.json
       systemctl restart dnsmasq      
       sleep 2
    else 
        ip=$(curl -sSL -4 "http://ipv4.ip.sb" 2>&1)
        echo -e "当前IP:$ip 解锁奈飞正常！！ 时间：$(date)"
       echo -e "domain-needed\nbogus-priv\nno-resolv\nno-poll\nall-servers\nserver=8.8.8.8\nserver=1.1.1.1\nserver=208.67.222.222\nserver=4.2.2.1\ncache-size=2048\nlocal-ttl=60\ninterface=*\naddress=/akadns.net/$ip\naddress=/akam.net/$ip\naddress=/akamai.com/$ip\naddress=/akamai.net/$ip\naddress=/akamaiedge.net/$ip\naddress=/akamaihd.net/$ip\naddress=/akamaistream.net/$ip\naddress=/akamaitech.net/$ip\naddress=/akamaitechnologies.com/$ip\naddress=/akamaitechnologies.fr/$ip\naddress=/akamaized.net/$ip\naddress=/edgekey.net/$ip\naddress=/edgesuite.net/$ip\naddress=/srip.net/$ip\naddress=/level3.net/$ip\naddress=/llnwd.net/$ip\naddress=/edgecastcdn.net/$ip\naddress=/cloudfront.net/$ip\naddress=/netflix.com/$ip\naddress=/netflix.net/$ip\naddress=/nflximg.net/$ip\naddress=/nflxvideo.net/$ip\naddress=/nflxso.net/$ip\naddress=/nflxext.com/$ip\naddress=/oculus.com/$ip\naddress=/ip2location.com/$ip\naddress=/warnerbros.com/$ip\naddress=/southpark.cc.com/$ip\naddress=/brightcove.com/$ip\naddress=/uplynk.com/$ip\naddress=/maxmind.com/$ip\naddress=/braze.com/$ip\naddress=/disney.com/$ip\naddress=/disneyjunior.com/$ip\naddress=/disney-plus.net/$ip\naddress=/disneyplus.com/$ip\naddress=/dssott.com/$ip\naddress=/cdn.registerdisney.go.com/$ip\naddress=/global.edge.bamgrid.com/$ip\naddress=/bamgrid.com/$ip\naddress=/registerdisney.go.com/$ip\naddress=/disneyplus.com.ssl.sc.omtrdc.net/$ip\naddress=/dssott.com.akamaized.net/$ip\naddress=/braze.com/$ip\naddress=/cws.conviva.com/$ip\naddress=/execute-api.us-east-1.amazonaws.com/$ip\naddress=/go-mpulse.net/$ip\naddress=/disneynow.com/$ip\naddress=/search-api-disney.bamgrid.com/$ip\naddress=/d9.flashtalking.com/$ip\naddress=/disney-portal.my.onetrust.com/$ip\naddress=/disneyplus.bn5x.net/$ip\naddress=/adobedtm.com/$ip\naddress=/optimizely.com/$ip\naddress=/disneystreaming.com/$ip\naddress=/com.disney.disneyplus/$ip\naddress=/go-disneyworldgo.com/$ip\naddress=/go.com/$ip\naddress=/thestationbymaker.com/$ip\naddress=/thisispolaris.com/$ip\naddress=/watchdisneyfe.com/$ip
"  > /etc/dnsmasq.d/custom_netflix.conf
       python /root/DDNS/run.py -c /root/DDNS/config.json
       systemctl restart dnsmasq  
       sleep 180
    fi
done
