#Need to access server through SSH
if ssh $1@$2;
then
    apache=$(apt-chace policy apache2 | grep "Installed" | awk -F' ' '{print $2}')
    
    if $apache != "(none)";
    then 
        echo "Apache2 is already installed"
    else
        sudo apt install apache2
    fi

    php=$(apt-cache policy php | grep "Installed" | awk -F' ' '{print $2}')

    if $php != "(none)";
    then
        echo "Php is already installed"
    else
        sudo apt install php
    fi

    mysql=$(apt-cache policy mysql | grep "Installed" | awk -F' ' '{print $2}')

    if $mysql != "(none)";
    then 
        echo "Mysql is already installed"
    else
        sudo apt install mysql-server
    fi
    
    echo -n "Enter your Domain name"
    read domain

else
    echo "Server Can't be reached'"
fi

#echo $message
#check for apache, PHP, mysql, or nginx installed or not 