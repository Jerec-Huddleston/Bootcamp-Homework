#!/bin/bash
while read line
do
 deal_date=$(echo $line | awk '{print $1}')
 deal_time=$(echo $line | awk '{print $2}') 
 deal_output=$(sed s/:00:00\ // ${deal_date}_Dealer_schedule | grep $deal_time | awk '{print $1,$4,$5}')
 printf "$deal_date $deal_output\n"
done < Player_Analysis_Times
