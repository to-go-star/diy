#bin/bash!
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

input=y
while [[ "$input" == "y" ]]
do

 PreAssertion=$(curl  --user-agent "${UA_Browser}" -s --max-time 5 -X POST "https://global.edge.bamgrid.com/devices" -H "authorization: Bearer ZGlzbmV5JmJyb3dzZXImMS4wLjA.Cu56AgSfBTDag5NiRA81oLHkDZfu5L3CKadnefEAY84" -H "content-type: application/json; charset=UTF-8" -d '{"deviceFamily":"browser","applicationRuntime":"chrome","deviceProfile":"windows","attributes":{}}' 2>&1)
 if   [[ "$PreAssertion" != "403" ]]; then
        echo -e "线路通的开始下一步$(date)"
 else
       echo -e "线路不通,IP废了,切换中!!!$(date)"
       systemctl restart wg-quick@wgcf
 fi
 assertion=$(echo $PreAssertion | python3 -m json.tool 2> /dev/null | grep assertion | cut -f4 -d'"')
 PreDisneyCookie=$(curl -s --max-time 5 "https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/cookies" | sed -n '1p')
 disneycookie=$(echo $PreDisneyCookie | sed "s/DISNEYASSERTION/${assertion}/g")
 TokenContent=$(curl  --user-agent "${UA_Browser}" -s --max-time 5 -X POST "https://global.edge.bamgrid.com/token" -H "authorization: Bearer ZGlzbmV5JmJyb3dzZXImMS4wLjA.Cu56AgSfBTDag5NiRA81oLHkDZfu5L3CKadnefEAY84" -d "$disneycookie")
 fakecontent=$(curl -s --max-time 5 "https://raw.githubusercontent.com/lmc999/RegionRestrictionCheck/main/cookies" | sed -n '8p')
 refreshToken=$(echo $TokenContent | python3 -m json.tool 2> /dev/null | grep 'refresh_token' | awk '{print $2}' | cut -f2 -d'"')
 disneycontent=$(echo $fakecontent | sed "s/ILOVEDISNEY/${refreshToken}/g")
 tmpresult=$(curl --user-agent "${UA_Browser}" -X POST -sSL --max-time 5 "https://disney.api.edge.bamgrid.com/graph/v1/device/graphql" -H "authorization: ZGlzbmV5JmJyb3dzZXImMS4wLjA.Cu56AgSfBTDag5NiRA81oLHkDZfu5L3CKadnefEAY84" -d "$disneycontent" 2>&1)
 previewcheck=$(curl -s -o /dev/null -L --max-time 5 -w '%{url_effective}\n' "https://disneyplus.com" | grep preview)
 isUnabailable=$(echo $previewcheck | grep 'unavailable')
 region=$(echo $tmpresult | python3 -m json.tool 2> /dev/null | grep 'countryCode' | cut -f4 -d'"')
 inSupportedLocation=$(echo $tmpresult | python3 -m json.tool 2> /dev/null | grep 'inSupportedLocation' | awk '{print $2}' | cut -f1 -d',')
if [[ "$region" = "SG" ]]&&[[ "$inSupportedLocation" = "true" ]]; then
        echo -e "$region,DISNEY IP is OK!$(date)"
        sleep 300           
 else
       echo -e "$region $inSupportedLocation IP废了,切换中!!!$(date)"
       systemctl restart wg-quick@wgcf
       sleep 3   
  fi
done
