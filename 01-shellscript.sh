#!/bin/bash

DATE=$(date +%F)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
USERId=$(id -u)
R="\e[31m"

VALIDATE() {
  if [ $1 -ne 0 ]; then
    echo "error in installation"
    exit 1
  else 
    echo "$2 successfully installed"
  fi
}

if [ $USERId -ne 0 ]; then
  echo "run it with sudo access"
  exit 1
fi

# Install ansible and suppress logs in terminal
apt install ansible -y &>/dev/null

VALIDATE $? "ansible"
