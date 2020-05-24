FROM arm32v7/ubuntu:latest AS builder

MAINTAINER Andrey Andreev <boompyz@gmail.com>

WORKDIR /opt

RUN apt-get update && apt-get install -y unzip curl

RUN curl -L https://github.com/Pryaxis/TShock/releases/download/v4.4.0-pre7/TShock.4.4.0.Pre-release.7.Entangled.for.Terraria.1.4.0.4.zip -o terraria-server.zip \
 	&& mkdir terraria \
	&& unzip terraria-server.zip -d terraria/

FROM mono:latest

WORKDIR /opt/terraria

COPY --from=builder /opt/terraria .

VOLUME ["/Worlds"]
EXPOSE 7777

# Env variables
# PLAYERS <number>
# PASSWORD <password>
# WORLD <path to world, usually /Worlds/world.wld>
# SIZE <1 Small, 2 Medium, 3 Large>
# WORLD_NAME <name>
# -secure ?
# -SEED <seed>

CMD printf "players=$PLAYERS\npassword=$PASSWORD\nworld=$WORLD\nautocreate=$SIZE\nworldname=$WORLD_NAME\n" > serverconfig && mono ./TerrariaServer.exe -config serverconfig
