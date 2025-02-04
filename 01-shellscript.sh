#!/bin/bash

DATE=$(date +%F)
SCRIPTNAME=$0
LOGFILE="/tmp/$SCRIPTNAME-$DATE.log"
USERId=$(id -u)
R="\e[31m"
Y="\e[33m"
N="\e[0m"
G="\e[32m"





VALIDATE(){
  if [ $1 -ne 0 ] 
  then
    echo -e "$R Error in installation of $2"
    exit 1
  else
    echo "$2 successfully installed"
  fi
}

if [ $USERId -ne 0 ]
then
  echo "Run it with sudo access"
  exit 1
fi

apt install git -y &>>$LOGFILE

VALIDATE $? "ansible"
