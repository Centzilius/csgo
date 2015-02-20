#!/bin/bash

if [ -z $CSGO_MAP ]
	CSGO_MAP="de_dust2"
fi

/home/steam/srcds_run -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active +map $CSGO_MAP
