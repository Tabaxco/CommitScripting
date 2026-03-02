#!/bin/bash

read -p $'\e[1mEnter the desired path (default: current directory): \e[0m' path
path=${path:-$PWD}


if [ ! -d "$path" ]; then
    echo -e "\e[1;31mDirectory '$path' not found!\e[0m"  
    exit 1
fi


echo -e "\e[1mChosen path:\e[0m $path"
echo


echo -e "\e[1mFiles:\e[0m"
ls "$path"
echo

read -p $'\e[1mFiles to commit (default: all): \e[0m' what_commit
what_commit=${what_commit:-.}


echo -e "\e[1mStaging:\e[0m $what_commit"
echo

echo -e "\e[1mWhat did you do?\e[0m"

options=("feat" "fix" "docs"  "refactor" "style")

select opt in "${options[@]}"
do
	case $opt in
		"feat") TYPE="feat"; break;;
		"fix") TYPE="fix"; break;;
		"docs") TYPE="docs"; break;;
		"refactor") TYPE="refactor"; break;;
		"style") TYPE="style"; break;;
		*) echo "Invalid option"; exit;;
	esac

done

echo

read -p $'\e[1mWrite your commit message:\e[0m ' commit_message
commit_message=${commit_message:-"This is the standard message of my committing script!"}


echo -e "\e[1mMessage:\e[0m $commit_message"
echo

echo -e "\e[1mDo you want to push it?"
finaloptions=("yes" "no")
select fopt in "${finaloptions[@]}"
do
	case $fopt in 
		"yes") TYPE="yes"; break;;
		"no") git add $what_commit && git commit -m "$TYPE: $commit_message" && echo &&  echo "Files committed" && exit
	esac
done

echo 

cd "$path" || exit 1
git add $what_commit || exit 1

echo "Pushing files"

git commit -m "$TYPE: $commit_message" || exit 1
git push

echo
echo "Files successfully pushed to GitHub!"
