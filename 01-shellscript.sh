#!/bin/bash

DATE=$(date +%F)
SCRIPTNAME=$(basename $0)
LOGFILE="/tmp/$SCRIPTNAME-$DATE.log"
USERId=$(id -u)
R="\e[31m"

VALIDATE(){
  if [ $1 -ne 0 ]; then
    echo -e "${R}Error in installation"
    exit 1
  else
    echo "$2 successfully installed"
  fi
}

if [ $USERId -ne 0 ]; then
  echo "Run it with sudo access"
  exit 1
fi

# Suppress all apt output including progress
DEBIAN_FRONTEND=noninteractive apt install ansible -y -qq &>>$LOGFILE

VALIDATE $? "ansible"
