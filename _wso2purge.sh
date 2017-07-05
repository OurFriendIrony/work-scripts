echo '>>> Stop all Containers <<<'
docker stop $(docker ps -a -q)
echo '>>> Clean all Containers <<<'
docker ps -a -q -f status=exited | xargs -r docker rm -v 
docker ps -a -q -f status=created | xargs -r docker rm -v
docker images -f "dangling=true" -q | xargs -r docker rmi
echo '>>> Purge /home/docker /home/mysql <<<'
sudo rm -rf /home/docker /home/mysql
echo '>>> Starting MySql container for first time... please wait... <<<'
docker run --name wso2-mysql --net wso2_nw -v /home/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -d mysql:5.6
sleep 10
echo '>>> YOU NOW NEED TO START UP the following <<<'
echo ' - docker.greg'
echo ' - docker.das'
echo '>>> AND THEN YOU ARE ALL CLEANED UP <<<'
