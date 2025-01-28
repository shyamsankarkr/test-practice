DATE=$(date +%F)
SCRIPTNAME=$0
LOGFILE=/tmp/$SCRIPTNAME-$DATE.log
USERId=$(id -u)

VALIDATE(){
if [ $1 -ne 0 ]
then
  echo "error in installation"
  exit 1
else 
  echo "$2 successfully installed"
fi
}

if [ $USERId -ne 0 ]
then
   echo "run it with sudo access"
   exit 1
fi
 
apt install ansible -y &>>$LOGFILE

VALIDATE $? "ansible"
