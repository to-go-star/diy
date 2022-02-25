#bin/bash!
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"
chattr -i /etc/resolv.conf
chmod 777 /etc/resolv.conf
echo -e "nameserver 1.1.1.1\nnameserver 8.8.8.8" > /etc/resolv.conf
echo -e "listen-address=127.0.0.1\nresolv-file=/etc/resolv.dnsmasqtx.conf\naddn-hosts=/etc/dnsmasqtx.hosts\nstrict-orde" > /etc/dnsmasq.d/custom_netflix.conf
echo "nameserver 127.0.0.1\nnameserver 8.8.8.8" > /etc/resolv.dnsmasqtx.conf
echo "127.0.0.1 test.test.cn"  > /etc/dnsmasqtx.hosts
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
       echo "$ip  akadns.net\n$ip  akam.net\n$ip  akamai.com\n$ip  akamai.net\n$ip  akamaiedge.net\n$ip  akamaihd.net\n$ip  akamaistream.net\n$ip  akamaitech.net\n$ip  akamaitechnologies.com\n$ip  akamaitechnologies.fr\n$ip  akamaized.net\n$ip  edgekey.net\n$ip  edgesuite.net\n$ip  srip.net\n$ip  footprint.net\n$ip  level3.net\n$ip  llnwd.net\n$ip  edgecastcdn.net\n$ip  cloudfront.net\n$ip  netflix.com\n$ip  netflix.net\n$ip  nflximg.net\n$ip  nflxvideo.net\n$ip  nflxso.net\n$ip  nflxext.com\n$ip  hulu.com\n$ip  huluim.com\n$ip  hbonow.com\n$ip  hbogo.com\n$ip  hbo.com\n$ip  amazon.com\n$ip  amazon.co.uk\n$ip  amazonvideo.com\n$ip  crackle.com\n$ip  pandora.com\n$ip  vudu.com\n$ip  blinkbox.com\n$ip  abc.com\n$ip  fox.com\n$ip  theplatform.com\n$ip  nbc.com\n$ip  nbcuni.com\n$ip  ip2location.com\n$ip  pbs.org\n$ip  warnerbros.com\n$ip  southpark.cc.com\n$ip  cbs.com\n$ip  brightcove.com\n$ip  cwtv.com\n$ip  spike.com\n$ip  go.com\n$ip  mtv.com\n$ip  mtvnservices.com\n$ip  playstation.net\n$ip  uplynk.com\n$ip  maxmind.com\n$ip  disney.com\n$ip  disneyjunior.com\n$ip  xboxlive.com\n$ip  lovefilm.com\n$ip  turner.com\n$ip  amctv.com\n$ip  sho.com\n$ip  mog.com\n$ip  wdtvlive.com\n$ip  beinsportsconnect.tv\n$ip  beinsportsconnect.net\n$ip  fig.bbc.co.uk\n$ip  open.live.bbc.co.uk\n$ip  sa.bbc.co.uk\n$ip  www.bbc.co.uk\n$ip  crunchyroll.com\n$ip  ifconfig.co\n$ip  omtrdc.net\n$ip  sling.com\n$ip  movetv.com\n$ip  happyon.jp\n$ip  abema.tv\n$ip  hulu.jp\n$ip  optus.com.au\n$ip  optusnet.com.au\n$ip  gamer.com.tw\n$ip  bahamut.com.tw\n$ip  hinet.net
"  > /etc/dnsmasqtx.hosts
       
        /etc/init.d/dnsmasq restart
        
        sleep 2
    else  
        echo -e "当前IP:$ip 解锁奈飞正常$(date)"
        sleep 180


    fi
done
