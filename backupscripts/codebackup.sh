THESITE="yourwebsitecode"
THEDATE=`date +%d%m%y%H%M`

# export code files
tar czf /root/mybackups/sitebackup_${THESITE}_${THEDATE}.tar -C / var/www/html

# remove backups older than 5 days
find /root/mybackups/site* -mtime +5 -exec rm {} \;

# sync to amazon
/usr/local/bin/aws s3 sync /root/mybackups s3://yourbucketname/backups