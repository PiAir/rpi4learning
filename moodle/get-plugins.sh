wget https://moodle.org/plugins/download.php/24030/mod_hvp_moodle310_2021043000.zip
unzip *.zip
mv hvp mod/hvp
rm *.zip
wget https://github.com/trax-project/moodle-trax-logs/archive/refs/tags/v0.20.zip
unzip *.zip
mv moodle-trax-logs-0.20 mod/trax
rm *.zip
