#!/bin/bash
# $1: 4 digit date ie: 0310
# $2: 2 digit time + AM/PM ie: 01PM
# $3: Game 1 = Black Jack 2= Roulette 3= Texas Hold em

deal_dt=$(sed s/:00:00\ // $1_Dealer_schedule | grep -i $2)

if [ $3 == 1 ]
then
	printf "Black Jack Dealer: "
	echo $deal_dt | awk '{print $2,$3}'
elif [ $3 == 2 ]
then
	printf "Roulette Dealer: "
	echo $deal_dt | awk '{print $4,$5}'
elif [ $3 == 3 ]
then
	printf "Texas Hold'em Dealer: "
	echo $deal_dt | awk '{print $6,$7}'
else
	printf "invalid game input\n"
fi
