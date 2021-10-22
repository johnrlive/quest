#!/bin/bash
# echo "========================== YUM UPDATE & DEPS ===="
# sudo yum update -y
# sudo yum install -y git
#cd ~ && git clone https://github.com/johnrlive/quest.git && cd quest


echo "========================== INSTALL - Docker CE =============="
sudo amazon-linux-extras install docker -y
sudo service docker start
# make the default user the owner of the service
# skipping calling with sudo all the time
sudo usermod -a -G docker ec2-user


echo "========================== Make Docker auto-start ====="
sudo chkconfig docker on


echo "========================== INSTALL - Docker Compose ====="
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version


echo "========== Run command below in bash: ==================="
echo "docker-compose build && docker-compose up -d"
echo "if docker-compuse does not run reset session log out & in"
echo "========================================================="
# ========================== Resets - ec2-user session ====
source ~/.bashrc
source ~/.bash_profile
exec $SHELL


#echo "========================== BUILD & RUN - docker-compose detached ====="
#docker-compose build && docker-compose up -d
