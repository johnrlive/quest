#!/bin/bash

echo "======================= REBUILD - docker-compose ====="
cd ~/project/quest
docker-compose down && docker-compose build && docker-compose up -d
