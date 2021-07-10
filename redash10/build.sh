wget https://github.com/getredash/redash/archive/refs/tags/v10.0.0-beta.zip
unzip *.zip
rm *.zip
mv redash-10.0.0-beta app
cp Dockerfile app/Dockerfile
# cp requirements.txt app/requirements.txt
# cp requirements_all_ds.txt app/requirements_all_ds.txt

docker build -t rpi4learningbox/redash:10.0.0-beta.b49597 app
docker build -t rpi4learningbox/redash-nginx:1.20.0 nginx

# rm -r app
