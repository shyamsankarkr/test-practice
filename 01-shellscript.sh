
USERId=$(id -u)

if [ USERId -ne 0 ]
then
   echo "run it with sudo access"
   exit 1
fi
 
apt install mysql -y

if [ $? -ne 0 ]
then
  echo "error in installation"
  exit 1
else 
  echo "mysql successfully installed"
fi