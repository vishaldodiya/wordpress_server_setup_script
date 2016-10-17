#Need to access server through SSH
if ssh $1@$2;
then
    
else
    echo "Server Can't be reached'"
fi

#echo $message
#check for apache, PHP, mysql, or nginx installed or not 