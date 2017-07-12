#!/bin/bash

# Load Aliases
shopt -s expand_aliases
source ~/.bash_aliases

# Get Sudo
if [ $EUID != 0 ]; then
  sudo "$0" "$@"
  exit $?
fi

# Purge
echo '>>> Stopping all containers <<<'
docker rm -f $(docker ps -a -q) > /etc/null
docker.clean > /etc/null
echo '>>> Purge /home/docker /home/mysql <<<'
rm -rf /home/docker /home/mysql
echo '>>> Start Registry [docker.mysql] - Please wait 10 seconds... <<<'
docker.mysql > /etc/null
sleep 10
echo '>>> Init Registry [docker.greg] - Please wait 60 seconds... <<<'
docker pull 10.6.96.172:443/wso2/greg-5.0.0 > /etc/null 
docker run -it --name greg-5.0.0 -p 9449:9449 -p 9769:9769 --net wso2_nw -v /home/docker/greg-5.0.0/data:/opt/wso2greg-5.0.0/repository -d 10.6.96.172:443/wso2/greg-5.0.0 > /etc/null
sleep 60
echo '>>> Init Registry [docker.das] - Please wait 30 seconds... <<<'
docker pull 10.6.96.172:443/wso2/das-3.0.0 > /etc/null
docker run -it --name das-3.0.0 -p 9445:9445 -p 9765:9765 -p 7713:7713 -p 8245:8245 -p 8282:8282 -p 9162:9162 --net wso2_nw -v /home/docker/das-3.0.0/data:/opt/wso2das-3.0.0/repository -d 10.6.96.172:443/wso2/das-3.0.0 > /etc/null
sleep 30
echo '>>> Cleaning up <<<'
docker rm -f $(docker ps -a -q) > /etc/null
docker.clean > /etc/null
echo '>>> You can now start your wso2 environment as you normally would <<<'

