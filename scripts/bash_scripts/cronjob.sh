#!/bin/bash
cron_job="16 18 * * * /Users/user/Desktop/CDE/assignments/git/scripts/bash_scripts/transform.sh"
echo "Current working directory: $(pwd)"
# Check if the cron job already exists
(crontab -l | grep -G "$cron_job") || (
    # Add the cron job if it doesn't exist
    (crontab -l; echo "$cron_job") | crontab -
)

echo "Cron job for transform.sh added or updated successfully."
