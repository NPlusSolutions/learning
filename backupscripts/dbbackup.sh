THEDB="yourdatabasecode"
THEDBUSER="yourdatabaseusername"
THEDBPW="yourdatabasepassword"
THEDATE=`date +%d%m%y%H%M`

# export database
mysqldump -u $THEDBUSER -p${THEDBPW} $THEDB | gzip > /root/mybackups/dbbackup_${THEDB}_${THEDATE}.bak.gz

# remove backups older than 5 days
find /root/mybackups/db* -mtime +5 -exec rm {} \;

# sync to amazon
/usr/local/bin/aws s3 sync /root/mybackups s3://yourbucketname/backups