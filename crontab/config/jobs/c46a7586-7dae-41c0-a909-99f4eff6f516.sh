#!/usr/bin/env bash
set -e

# TODO find workaround
# [error] write /dev/stdout: broken pipe <- when using docker commands
#UUID=$(cat /proc/sys/kernel/random/uuid)
#exec > >(read message; echo "${UUID} $(date -Iseconds) [info] $message" | tee -a /var/log/crontab/jobs.log )
#exec 2> >(read message; echo "${UUID} $(date -Iseconds) [error] $message" | tee -a /var/log/crontab/jobs.log >&2)

echo "Start Cronjob **c46a7586-7dae-41c0-a909-99f4eff6f516** null"

docker exec  moodle php /var/www/html/admin/cli/cron.php
echo "End Cronjob **c46a7586-7dae-41c0-a909-99f4eff6f516** null"
