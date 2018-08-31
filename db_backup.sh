read -p "Enter Directory:" direc
cd $direc
WPDBNAME=`cat wp-config.php | grep DB_NAME | cut -d \' -f 4`
WPDBUSER=`cat wp-config.php | grep DB_USER | cut -d \' -f 4`
WPDBPASS=`cat wp-config.php | grep DB_PASSWORD | cut -d \' -f 4`
mysqldump -u $WPDBUSER --password=$WPDBPASS $WPDBNAME > "$WPDBNAME .sql"

git init
git add .
git commit -m "all files"
read -p "Enter repository: " repo
git remote add origin $repo
git push origin master
