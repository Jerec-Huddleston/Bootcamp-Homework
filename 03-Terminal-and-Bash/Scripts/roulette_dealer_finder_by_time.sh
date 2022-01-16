#!/bin/bash
# $1: 4 digit date ie: 0310
# $2: 2 digit time + AM/PM ie: 01PM
sed s/:00:00\ // $1_Dealer_schedule | grep -i $2 | awk '{print $4,$5}'
