#!/bin/sh

#  Wifi Strength Lister.sh
#  
#
#  Created by Anton Hibl on 3/2/21.
#  

airport -s | tail -n +1 | sed 's/ [a-z0-9][a-z0-9]:/,&:/g' | sed 's/ -/, -/g' | cut -d ',' -f1,3 | sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//' | grep -v "SSID" | sed 's/ /,/g' | cut -d ',' -f1,2 | sort -t ',' -k 2
