#Need to access server through SSH
if ssh $1@$2;
then
    echo "hwllo"
else
    echo "na"
fi

#echo $message
#check for apache, PHP, mysql, or nginx installed or not 