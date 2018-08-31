read -p "Enter Directory:" direc
cd $direc
read -p "Enter DB User Name:" user
read -p "Enter DB Password:" pass
read -p "Enter DB Name:" db
mysqldump -u $user --password=$pass $db > "$user.sql"
echo("Database Back created: $User.sql ")
git init
git add .
git commit -m "all files"
read -p "Enter repository: " repo
git remote add origin $repo
git push origin master


