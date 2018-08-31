TAR_SITES=false 
sitedir=(/var/www/html/ /var/www/aws.trendingnow.us/) 
domains=( trendingnow.us aws.trendingnow.us ) 
sqldbs=( wp_trendingnow wp_aws_trendingnow ) 
opath=$HOME/backup/mysql/ 
bkpsitepath=$HOME/backup/site/
mysqlhost=localhost 
username=root 
password=toor
suffix=$(date +%m-%d-%Y) 
FIND_PATH="$(which find)"
 for (( i = 0; i < ${#domains[@]}; i++)) do
        cpath=$opath${domains[$i]}
        sitepath=$bkpsitepath${domains[$i]}
        if [ -d $cpath ]
        then
                filler="just some action to prevent syntax error"
        else
                echo Creating $cpath
                mkdir -p $cpath
                mkdir -p $sitepath 
fi 
mysqldump -c -h $mysqlhost --user $username --password=$password ${sqldbs[$i]} > ${cpath}/${sqldbs[$i]}_$suffix.sql
 FILENAME=${sqldbs[$i]}_$suffix.tgz 
tar --create --gzip --file=${sitepath}/$FILENAME ${sitedir[$i]}
$FIND_PATH ${cpath}/*.sql -mtime +30
  # Delete dumps older than specified number of days
  $FIND_PATH ${cpath}/*.sql -mtime +30 -exec rm {} +
$FIND_PATH ${sitepath}/*.tgz -mtime +30
  # Delete dumps older than specified number of days
  $FIND_PATH ${sitepath}/*.tgz -mtime +30 -exec rm {} +
done