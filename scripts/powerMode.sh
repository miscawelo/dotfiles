#!/usr/bin/bash

asusctl profile -n
profile=$(asusctl profile -p | cut -d ' ' -f4)

notify-send "$profile profile is active"

if [[ $profile  == "Performance" ]]; then 
	corectrl -m Eco
	corectrl -m Performance
else 
	corectrl -m Performance
	corectrl -m Eco
fi
