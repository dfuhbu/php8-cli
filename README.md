php make.php > DockerfileAutoBuild
docker build -t dfuhbu/php8-cli:0.0.1 -f DockerfileAutoBuild .
docker push dockedfuhbu/php8-cli:0.0.1