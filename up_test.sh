ID=$(docker container ls | grep ubuntu-server | cut -d" " -f1)
echo "* Saving container state (ubuntu-server) as a new image (ubuntu-server-wordpress:latest)"
docker commit $ID ubuntu-server-wordpress:latest
echo "* Build new image (wordpress:latest) from (ubuntu-server-wordpress:latest)"
docker stop wordpress
docker rm wordpress
docker build -t wordpress:latest - < Dockerfile.test
echo "* Deploying wordpress:latest"
docker run --name wordpress -p 80:80 -d wordpress:latest
