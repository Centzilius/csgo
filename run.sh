#!/bin/bash

if [ -z $CSGO_MAP ]
	CSGO_MAP="de_dust2"
fi

if [ -z $CSGO_MAXPLAYERS ]
	CSGO_MAXPLAYERS=12
fi

/home/steam/csgosrcds_run -game csgo +map $CSGO_MAP +maxplayers $CSGO_MAXPLAYERS -autoupdate
