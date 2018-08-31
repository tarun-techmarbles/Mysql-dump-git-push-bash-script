read -p "Enter Directory:" direc
cd $direc
read -p "Enter User Name:" user
read -p "Enter Password:" pass
read -p "Enter DB:" db
mysqldump -u $user --password=$pass $db > "$user.sql"
git init
git add .
git commit -m "all files"
read -p "Enter repository: " repo
git remote add origin $repo
git push origin master


