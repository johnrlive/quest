# Local Setup

## Step 1: (git) Clone repo

```
git clone https://github.com/johnrlive/quest.git && cd quest
```

## Step 2: (iac) - Run Terraform

Note to you must add variables

```
sh ./terraform-deploy.sh
```

# Log into new Servers to setup

## Step 1: (ssh) Login into the 2 servers that were create by Terraform I added minimum of two ec2 instances for redundancy

```
ssh -i "~/.ssh/devops-east2.pem" ec2-user@ec2-IP-0.us-east-2.compute.amazonaws.com
ssh -i "~/.ssh/devops-east2.pem" ec2-user@ec2-IP-1.us-east-2.compute.amazonaws.com
```

## Step 2: (git) - Install git & Clone app in ec2 instance

```
sudo yum update -y && sudo yum install git -y && git clone https://github.com/johnrlive/quest.git && cd quest
```

## Step 3: (app) - Run a fresh installation of the Node App with Docker & Docker Compose

```
sh ./ec2-deploy.sh
exit
```

## Step 4: - SSH back into server and run docker-compose

```
ssh -i "~/.ssh/devops-east2.pem" ec2-user@ec2-IP-0.us-east-2.compute.amazonaws.com
docker-compose build && docker-compose up -d
```

```
ssh -i "~/.ssh/devops-east2.pem" ec2-user@ec2-IP-1.us-east-2.compute.amazonaws.com
docker-compose build && docker-compose up -d
```

# TODO:

- [ ] Use Terraform - to Create new dedicated VPC instead of using default-vpc

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

- Run docker-compose Run containers in the background with detached mode

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
