echo '>>> Start Status <<<'
docker ps --format "table {{.Image}}\t{{.ID}}\t{{.Names}}\t{{.Command}}\t{{.Status}}"
echo '>>> Stop all Containers <<<'
docker stop $(docker ps -a -q)
echo '>>> Clean all Containers <<<'
docker ps -a -q -f status=exited | xargs -r docker rm -v 
docker ps -a -q -f status=created | xargs -r docker rm -v
docker images -f "dangling=true" -q | xargs -r docker rmi
echo '>>> End Status <<<'
docker ps --format "table {{.Image}}\t{{.ID}}\t{{.Names}}\t{{.Command}}\t{{.Status}}"

