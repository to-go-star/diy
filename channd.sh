#bin/bash!
UA_Browser="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Safari/537.36"

input=y
while [[ "$input" == "y" ]]
do
    result=$(curl --user-agent "${UA_Browser}" -fsL --write-out %{http_code} --output /dev/null --max-time 10 "https://www.netflix.com/title/70143836" 2>&1)
    region=$(curl  --user-agent "${UA_Browser}" -fsL --write-out %{http_code} --output /dev/null -s --max-time 10 -X POST "https://disney.api.edge.bamgrid.com/v1/public/graphql" -H "authorization: Bearer eyJ6aXAiOiJERUYiLCJraWQiOiJ0Vy10M2ZQUTJEN2Q0YlBWTU1rSkd4dkJlZ0ZXQkdXek5KcFFtOGRJMWYwIiwiY3R5IjoiSldUIiwiZW5jIjoiQzIwUCIsImFsZyI6ImRpciJ9..7lAN4yxUYNIB3ZB9.W3mW_U9PEUdGvBr2UmS1cqJQ2bhyTwFzftsBmPavcJ2EOQoZTybdxaRmEZfh2-MjCzOQHqcJLmTfE3NQ1zkHVWXgPblhcMgaGbSCbyNzaUbhV4myttaR6kYT9HcVhVeQ_hBqN1w9lEcnl_jxV9s6fxVBWdbQyPDit8ebyzjJ-cCb7nfq4hRg1-SryRs4th1iunpRK3gQNZ4FHWFjIKlQZN4UHGGwquQ_O76XIbobU2NOr6l_jVz7_dIXiK1ffRaK45G_59u4OKBnbPzLMHhf7imO0r94JEB1nOO6-9oklGmZV6eqCbowQYZENVfY7d9HyXnZ88huDG4N-TYHZ1OCIB2ehlR9Ds58tfSkzQ4toBucfQYxaK_bqkB71tNZtKVWcHSDSOJwkOxWT-v0iqK1Cb0CXKtwbOPE6CRLl5y-kAmsF1ZV_1VfSQ6fnWYwDfVJ5w4bDmKImYVN4A_A3woPdkK9MEHHvuiwyb6UmQLwOnQ4l8LrrjAfTXAZXrzf6ERIYed6YCYvIaHWc39qhwMA70cqCfm8J5xBxkmOy6h1RqBImcbHIuLO8mYLuleLE1HOwuIFTQci4XlyT_ozK9pG6FU9rkO8vm3qqYBr814yA3Otacg-cBZAB9_ucLD-0RZG1M7DgNmhzdWU3rkFULvb9cweCOpd9zfs9w0O93Ti_COCgiaiXRJqI9aWb4yL5-o5XLbD-95JwQykKGe-QwVJnBvpDcl1iEiP52nQ_dKIABJi99zqXp75tRWcdaoQd-XBbEmj89rP-Snkq2boXZwO3xRCkXfVnB7HR2H1b9iv9I4vA1vuw8MwvikRY9m_NK-WaA5zfSYrizD4SRhlpR6gzU-4tkutQIb-RuppFQd-KhKokB2ltvOa3nPuMmtHNZuU2h09il4qmfz1hnbwrbfGVOimrQmtWmy9phYkJbwuYsXN5zfVcc1glP4oCmoETPpUpOmxHt9z7nXP7NXY_xLQfcPD8xrZcs-AoDKQwIvbm0YdLSsGanobxcrkRQQIkxGUXsEh6drYR1O8FeAkrgns5VI3klZLs8AA0xhy_I5C6XUflw9si5X113RfYRg52RMG6xYXYBOyQGjj2Kug7eMIt7FEaqsG4qqtYQjHjAA9xfB1NOlYgnppxiWYXOJ66J_vIoJza9spBF3bQ3aNbl_XGqqgruIBXyHs8mQMKrjiZel_ldbQyXKM9OACdNa9ff2r9Zsp4uKklAHcnevz6m2WS9GeljKms2XGhmvF--QV9SHKgx0XtMnz1JkFoscTI35ZRAtuXsbsz6M8xj49QrNNGHuJXDMnW0oX1kuf4lgL8siTLgwFt4nZys6coEfapJ6NhX_95nOqt3XU-a5MT69ltbcqcha54pdcE2XmVgj4TtTDIYQj50We4XN09pJxLCiSp1JLkD8CpYPWLkjkgdPSVCPAGVN1u_U6ywf9k6ZNvvMOcKWFaoh_As0xtGjyyTNpSkAhAUpDQnESsfXA-f3Dtd5he2OYUxDoh_uXghCzj2QRtb1rrkLymJxGf3qrlJL9NMe6mAozJm51qzmwyGSqSjCq5JvdzDdxEwAhy7oTbaYClfud2IQ6MWvF0OmOdwtkDv-rlYMeui1wtql8RSg0mJpdrReTtlHRrgZxLSaZG6Qq3yzpcY8LpRtMNhIoxRD7VuxpojR3kCYlGpgZ5RR3KaJHBpHZznAZagv3BdMJ5wWgc8R1-3bSmD6TxxiPdh7Y-VykQZLHC-oEbJPHZuWVfF_zf9DEznT7K1e-M8L5ryVJlAIhD_I_TNvwNr9zgdbTQA82oU-9waNmNH4bZNhAq3ZLs8Gk80jO4Gmet8a8o_c7fSh4mI6CIWufz47WwD637TO8Ztebm-Y-4mn_TlO2GT8KkecCeez6Bax_2D_jDISnrgYKhtxM1vDgoWrCKtcYewkYbkGSRKTnQ_WBod7Br-icJf2CFo2H2BfsiepazBqq-njv8SfNgq6YCvo7Z_pppZLEnsf__XbZCcnKjztNduJw5GTnABDVTNXrkW1u7bVttgvc6Z-JL8bRUAF7OgL0YMdRIrWys9AUU6hddME_VXWawfNKmTy4H7OnO6A2EYMFGBdwpA1LZrjBa9Fx.aS-tZSMrflF2ITl3xZRVQA" 2>&1)
 if [[ "$result" == "200" ]] &&[[ "$region" != "403" ]]; then
        echo -e "$result,$region,IP OK!$(date)"
        sleep 600           
 else
       echo -e "$result,$region,IP掉了切换中!!!$(date)"
       systemctl restart wg-quick@wgcf
       sleep 3
  fi
done
