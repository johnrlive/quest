# Local Setup

## Step 1: (git) Clone repo

```
git clone git@github.com:johnrlive/quest.git && cd quest
```

## Step 2: (iac) - Run Terraform

Note to you must add variables

```
sh ./terraform-deploy.sh
```

# Server Setup

## Step 1: (ssh) Login into the server that was create by Terraform

```
ssh -i "~/.ssh/devops-east2.pem" ec2-user@ec2-IP.us-east-2.compute.amazonaws.com
```

## Step 2: (git) - Install git & Clone app in ec2 instance

```
sudo yum install git -y
git clone https://github.com/johnrlive/quest.git && cd quest
```

## Step 3: (app) - Run a fresh installation of the Node App with Docker & Docker Compose

```
sh ./ec2-deploy.sh
```

# TODO:

- [ ] Use Terraform - to Create new VPC

- [ ] Use Terraform - to Create 2 new subnets

- [ ] Domain changes - Move dns services from Cloudflare to Route53

- [ ] Use Terraform - to create cname rearc.johnrlive.com to ALB DNS record

- [ ] Use Terraform - to create ACM instead of manually via console

- [ ] Use Terraform - to create Route53 cnames for domain ACM validation

### docker-compose tasks:

- Build docker containers

```
docker-compose build
```

- Run docker-compose Run containers in the background with dettached mode

```
docker-compose up -d
```

- Stop docker compose

```
docker-compose down
```

- Rebuild docker images & run with docker compose

```
sh compose-rebuild.sh
```
