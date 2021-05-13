# export $(cat .env | xargs)
sed -i 's|{LRS_URL}|'"$LRS_URL"'|' /home/pi/docker/moodle/xapi-h5p/js/xapi-stmt-dispatcher.js
sed -i 's|{LRS_USERNAME_PASSWORD}|'"$LRS_USERNAME:$LRS_PASSWORD"'|' /home/pi/docker/moodle/xapi-h5p/js/xapi-stmt-dispatcher.js
