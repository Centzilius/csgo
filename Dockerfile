FROM ubuntu:14.04

MAINTAINER Hielke Hoeve <hielke.hoeve@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y curl git unzip vim wget lib32gcc1 libstdc++6 libgcc1 lib32z1 lib32ncurses5 lib32bz2-1.0 && \
    apt-get autoremove  && \
    apt-get clean  && \
    rm -rf /var/lib/apt/lists/*

# Download and extract SteamCMD
RUN mkdir -p /home/steam/csgo && \
    cd /home/steam && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

RUN cd /home/steam && \
    ./steamcmd.sh \
      +login anonymous \
      +force_install_dir ./csgo \
      +app_update 740 validate \
      +quit

# Make server port available to host
EXPOSE 27015

#will actually start the server using the given startup ENV params
ADD ./run.sh /home/steam/run.sh
RUN chmod +x /home/steam/run.sh

VOLUME ["/home/steam/csgo/csgo/cfg"]
VOLUME ["/home/steam/csgo/csgo/maps"]

WORKDIR /home/steam
ENTRYPOINT ["/home/steam/run/run.sh"]
