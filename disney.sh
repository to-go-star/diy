#bin/bash!
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

input=y
while [[ "$input" == "y" ]]
do
   restwo=$(curl  --user-agent "${UA_Browser}" -fsL --write-out %{http_code} --output /dev/null -s --max-time 5 -X POST "https://global.edge.bamgrid.com/devices" -H "authorization: Bearer ZGlzbmV5JmJyb3dzZXImMS4wLjA.Cu56AgSfBTDag5NiRA81oLHkDZfu5L3CKadnefEAY84" 2>&1)
 if [[ "$restwo" != "403" ]]; then
        echo -e "$restwo,DISNEY IP is OK!$(date)"
        sleep 600           
 else
       echo -e "$result,$restwo,IP废了,切换中!!!$(date)"
       systemctl restart wg-quick@wgcf
       sleep 3
  fi
done
