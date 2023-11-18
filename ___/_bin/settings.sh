
NOW=$(date +"%d-%m-%Y")

NAME="David Landa"
EMAIL="david.landa@protonmail.com" 


git config --global user.name "${NAME}"
git config --global user.email "${EMAIL}" 

if [ ! "`git config user.name`" = "${NAME}" ]; then 
    echo "ERROR `git config user.name`"
fi

if [ ! "`git config user.email`" = "${EMAIL}" ]; then 
    echo "ERROR `git config user.email`"
fi

echo ${NOW}
