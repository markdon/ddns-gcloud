docker stop ddns
docker rm ddns
docker build -t ddns .
docker run -d --name=ddns --restart=always ddns