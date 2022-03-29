#bin/bash!
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

input=y
while [[ "$input" == "y" ]]
do
    result1=$(curl --user-agent "${UA_Browser}" -4 -fsL --write-out %{http_code} --output /dev/null --max-time 10 "https://www.netflix.com/title/70143836" 2>&1)
	result2=$(curl --user-agent "${UA_Browser}" -4 -fsL --write-out %{http_code} --output /dev/null --max-time 10 "https://www.netflix.com/title/70143836" 2>&1)
    if [[ "$result1" != "200" ]]&&[[ "$result2" != "200" ]];then
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
       python /root/DDNS/run.py -c /root/DDNS/config.json
       systemctl restart dnsmasq      
       sleep 2
    else 
        ip=$(curl -sSL -4 "http://ipv4.ip.sb" 2>&1)
        echo -e "当前IP:$ip 解锁奈飞正常！！ 时间：$(date)"
       python /root/DDNS/run.py -c /root/DDNS/config.json
       sleep 300 
    fi
done
