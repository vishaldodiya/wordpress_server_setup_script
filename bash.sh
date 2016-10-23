#Need to access server through SSH
#if 
ssh -v $1@$2 'bash -s' < setup_script.sh;
#then

    #checking for apache2
#else
#    echo "Server Can't be reached'"
#fi

#echo $message
#check for apache, PHP, mysql, or nginx installed or not 