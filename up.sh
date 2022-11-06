docker stop ubuntu-server
docker rm ubuntu-server
docker run --name ubuntu-server -p 23:22 -d ubuntu-server
