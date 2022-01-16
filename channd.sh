#bin/bash!
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

input=y
while [[ "$input" == "y" ]]
do
    result=$(curl --user-agent "${UA_Browser}" -fsL --write-out %{http_code} --output /dev/null --max-time 10 "https://www.netflix.com/title/70143836" 2>&1)
    restwo=$(curl  --user-agent "${UA_Browser}" -fsL --write-out %{http_code} --output /dev/null -s --max-time 10 -X POST "https://global.edge.bamgrid.com/devices" -H "authorization: Bearer ZGlzbmV5JmJyb3dzZXImMS4wLjA.Cu56AgSfBTDag5NiRA81oLHkDZfu5L3CKadnefEAY84" 2>&1)
    region=$(curl  --user-agent "${UA_Browser}" -fsL --write-out %{http_code} --output /dev/null -s --max-time 10 -X POST "https://disney.api.edge.bamgrid.com/v1/public/graphql" -H "authorization: Bearer eyJ6aXAiOiJERUYiLCJraWQiOiJ0Vy10M2ZQUTJEN2Q0YlBWTU1rSkd4dkJlZ0ZXQkdXek5KcFFtOGRJMWYwIiwiY3R5IjoiSldUIiwiZW5jIjoiQzIwUCIsImFsZyI6ImRpciJ9..Tph99zxJLwTZC6gV.bluY1YXIuu4Dl9imGc18PmNnOVVJVDRS62Rx7lEEiP0nxWlQV8BJSbkMPgQJSmSnBa7cvhrZosE22VXeABk8d_AvkQLZBSAsemSZ3ybxpDrL9oJdsE90mMjQKWH72v70pVEkc1GSZM5h_QMCCvfM80TmYGiFzxyXblM5X8MbqrdpRbz1ijVuH1w0mpeDXPcj7jcTauS7jvIS6k4FAJBYWXl00xQnmCsJGiYz7kRlWT082ZACQiGWvPGQU-d0ukxP1_D8AQbCBtBy4kgEw8j1RKXKYEOdanz9nNEaqVL5S8zc1KKS7Ijs8GmYJMLnXro3TIbQfhfhllV8cMpfyqZbsPhljNOWCp0uN5zOO2y61thOYNq_FWkMQZ7FQf1bAlopA5F_i5cm6XCOtpeL_au7njgGV834PXobg_Xn15dC3CGYDHot6IVJZ8Dj9CjZ4Q6d3d8XOQrq1-ylNfKWRNjWm1io-tNJ5GbbvVG-He8H3dO8XG-74y36PqszZGdFgBYxXRLjZekaGnq3qYwoVPpmiez8kW6sIG2WfL95jnCRNE7lfGCXFigz-FJFw5NSZNwPGo05oKAyvhne3cbHWlGfl3njfSVFlo2rUybu4Cliw_oZZhcuI8jARHiJa-KoudPm6lvuhJGUPEOgOHukdLxdwQf_t9o-qmLuT6mO7xoktKetbiV3tphFZc885lWedzvsNXO0gjeuUlGVyz3d_Di5w6nAS0ZxW7HyXLLKypyiNV3MjeJmG3eDZDQdlrcRt3wLQ9HqmrjbELGC7y3cot9ru2hX7lIQeO1cO6jX9yxWlHOaPivZVa7sfOw2hz-EzKiLdfGazYmGhmrKBe0XYI_dOgyiQwq7yt0xXQdMZupn5xq0josCD2mXCVGC7OoflOCFP4ukOdS13Vqhrwz2-Fmjdu2J3SDv582KuZJFIVlvFQKrqCndCH0X4lizhq2Qcxl252gX-XmKlM3ji70AD3Dwfx86vRet34dUsXtavq5BxwO2UyseJ-hxpGy-7hKIgeCbDEg1t9NA0qkc6O1CaG6j8yO1NSsr2f915-VKKYN4yWiRdLD8jasaKtKY4g2CBp0X_gdKg4r0jQCwu8JriBWfnWqq3nfCN7JD87KKWyF8_3dfuy0FmAI1Q0CWeMOLkiVX3uZgjT4GeFJ7fhE3j0OaY-Nl1k8XceMwDMjBRFqom6aMPDORmoziYRTano3qs1qx6Eyq7zFAo4iQBM7dCDtLkGKuujNPypRJyxl5JAQf57ljDogw4dbLHMU0nXsELlcu6xP-whJxruXZYwX6gCpEA17xfqxWRmy0QcUBDhXsHNcU27RBslqiaq_lwk5ROm20YuyPyXQLVesIdoDPIt07mvRSm3n6-pXncKN10SRObkKKyTk9zt9S_yAtdbZFgpeTdp2Seh84Ccn07fngcIR42iq2ewmO5woHr91rYSGjklPxKq99TO9-knH8e9_MTnXivwQAh4Q1UxXZ5PNsnWJWwaMOr7QBzsmuVoI7NDPI0Rj9f20IxlwIBFAXFS2PyvLUE95_8xIJeNo8vKOJsHB8WGZO5VHLvMormOlBXw1gYuX4a2wfbzBHP9g-qMosTID6MlSRPiz7ggWGS1jOXvK6hceIrvI5Ro9ZgniHWZI6A6OevBZHxrsyIVHxL_WfWv0zBGChM8tA8rmqFVfu8GdTsuaJSfyYlUVC0B4co9IS0BJYXpVjQjah1BJF8lJqk1ewfXl7USqZFtoXUFoC9PAwYdIOaIOo2U38cXI2w4_l-9dWvhEWRTAZevnDhWcJkQUuqazsRURCLVW9_TV7yTENGUEjl0h4hHG3sDCv9a_Orl6SLfbk1q2N_PQ8Ljp6gnkfHCC6h24JOq6Pl54LrCY3PbPkuXXK0lRszYpXRdJ6lYZR8lKV-v6oBAfr0CAY9no5IxDg3gnE4fKoE1FFjcfCSEsjclzpoZgaAzLBKzL15cl6o7ZppK450sCGQQrSwVCtMcBuF5tayRP8FS0-iHkad0abkW94iUUluPpukl0MNYsM7InBNPI7U1WBEhV2cApn8II-5KGzp7d--ORL3eKPjpKrZoyHXHek0hVsYUsRqo3HfRRle2H-C9nr7zA.Mwu37u7FJLn8NwEJe3Wdnw" 2>&1)
 if [[ "$result" == "200" ]] &&[[ "$region" != "403" ]]&&[[ "$restwo" != "403" ]]; then
        echo -e "$result,$restwo,$region,IP OK!$(date)"
        sleep 600           
 else
       echo -e "$result,$restwo,$region,IP掉了切换中!!!$(date)"
       systemctl restart wg-quick@wgcf
       sleep 3
  fi
done
