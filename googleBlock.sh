#!/bin/bash

# A script that blocks ever google resource in `arr`
# for a more detailed description checkout the README.md
# https://github.com/benzammour/scripts/

## initialize array
declare -a arr=(
	"google.de" 
	"google.com" 
	"fonts.google.com" 
	"benzammour.com"
)

> output

## loop through all domain names
for i in "${arr[@]}"
do
	# get all IPs of above domains and filter duplicates
	ip=$(ping -c 1 $i | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])' | uniq )

	whois $ip >> output
	echo -e "--- \t --- \t --- \t --- \t --- \t --- \t --- \t --- \t --- \t --- \t --- \t --- \t" >> output
done
