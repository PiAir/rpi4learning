export $(cat .env | xargs)
cp /home/pi/docker/moodle/xapi-h5p/js/xapi-stmt-dispatcher-template.js /home/pi/docker/moodle/xapi-h5p/js/xapi-stmt-dispatcher.js
sed -i 's|{LRS_URL}|'"$LRS_URL"'|' /home/pi/docker/moodle/xapi-h5p/js/xapi-stmt-dispatcher.js
sed -i 's|{LRS_USERNAME_PASSWORD}|'"$LRS_USERNAME:$LRS_PASSWORD"'|' /home/pi/docker/moodle/xapi-h5p/js/xapi-stmt-dispatcher.js
