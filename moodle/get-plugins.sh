wget --inet4-only https://moodle.org/plugins/download.php/24438/mod_hvp_moodle311_2021061100.zip
unzip *.zip
sudo mv hvp mod/hvp
rm *.zip
wget --inet4-only https://github.com/trax-project/moodle-trax-logs/archive/refs/tags/v0.20.zip
unzip *.zip
sudo mv moodle-trax-logs-0.20 mod/trax
rm *.zip
sudo chown -R www-data:www-data mod
