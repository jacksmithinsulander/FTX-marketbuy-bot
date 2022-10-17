#!/bin/bash

#make sure to fetch prices at 00.00 UTC, since thats the timeline FTX goes by. I will use a cronjob for this

priceDRGN=$(curl -X 'GET' 'https://api.coingecko.com/api/v3/simple/price?ids=dragonchain&vs_currencies=usd&include_24hr_change=true' -H 'accept: application/json' | sed -r 's/^[^:]*:(.*)$/\1/' | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tail -n +2)

priceLEO=$(curl -X 'GET' 'https://api.coingecko.com/api/v3/simple/price?ids=leo-token&vs_currencies=usd&include_24hr_change=true' -H 'accept: application/json' | sed -r 's/^[^:]*:(.*)$/\1/' | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tail -n +2)

priceSXP=$(curl -X 'GET' 'https://api.coingecko.com/api/v3/simple/price?ids=swipe&vs_currencies=usd&include_24hr_change=true' -H 'accept: application/json' | sed -r 's/^[^:]*:(.*)$/\1/' | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tail -n +2)

priceTRYB=$(curl -X 'GET' 'https://api.coingecko.com/api/v3/simple/price?ids=bilira&vs_currencies=usd&include_24hr_change=true' -H 'accept: application/json' | sed -r 's/^[^:]*:(.*)$/\1/' | awk -F"[,:}]" '{for(i=1;i<=NF;i++){if($i~/'$KEY'\042/){print $(i+1)}}}' | tail -n +2)

resultDRGN=$( awk "BEGIN { print int (100*$priceDRGN)}" )

resultLEO=$( awk "BEGIN { print int (100*$priceLEO)}" )

resultSXP=$( awk "BEGIN { print int (100*$priceSXP)}" )

resultTRYB=$( awk "BEGIN { print int (100*$priceTRYB)}" )

echo "$resultDRGN $resultLEO $resultSXP $resultTRYB" | gforth 

