#!/bin/bash
# Initial local docker container test

# build
docker build . -t johnrlive/node-quest

# run
docker run -p 3000:3000 -d johnrlive/node-quest

# list docker image
docker images

# Get container ID
docker ps

# Print app output
docker logs <container id>

# Enter the container in bash
docker exec -it <container id> /bin/bash
