This is a docker image for running a Terraria server using TSchock.

Example:
```
docker run -it --name terraria \
	-e PLAYERS=8 \
	-e  WORLD="/Worlds/KonoSuba.wld" \
	-e SIZE=1 \
	-e WORLD_NAME="KonoSuba" \
	-p 7777:7777 \
	boompyz/terraria
```
