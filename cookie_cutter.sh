#! /bin/bash

echo "arg1=project arg2=first arg3=last arg4=year arg5=licence arg6=cit"

echo "Is the current directory where you would like your project files?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) break;;
        No ) read -p 'Enter the full path of the desired directory: ' directory; cd $directory; break;;
    esac
done

#variables
project_name=$1
first_name=$2
last_name=$3
year=$4
licence=$5
cit=$6
#date=$(date %Y-%m-%d)
date=`date +%Y-%m-%d:%H:%M:%S`


#create new directory
git init $project_name

#navigate to the new directory
cd $project_name

#.gitignore
touch .gitignore

#create READ.ME
printf '# %s
## by %s %s
### %d' $project_name $first_name $last_name $year > README.md

#create LICENSE.md
cat $licence > LICENSE.md

#create CITATION.md
cat $cit > CITATION.md

#create directories
mkdir data
mkdir doc
mkdir results
mkdir src
mkdir from_joe

#Stage the project
git add .
git commit -m $date

dir

#You will have to manually push to Github
# created by Ted Thompson, November 2017
