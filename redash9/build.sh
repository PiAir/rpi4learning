wget https://github.com/getredash/redash/archive/refs/tags/v9.0.0-beta.zip
unzip *.zip
rm *.zip
mv redash-9.0.0-beta app

docker build -t rpi4learningbox/redash:9.0.0-beta.b42121 app
docker build -t rpi4learningbox/redash-nginx:1.20.0 nginx