#Need to access server through SSH
if ssh $1@$2;
then

    #checking for apache2

    apache=$(apt-chace policy apache2 | grep "Installed" | awk -F' ' '{print $2}')
    
    if $apache != "(none)";
    then 
        echo "Apache2 is already installed"
    else
        sudo apt install apache2
    fi

    #checking for PHP

    php=$(apt-cache policy php | grep "Installed" | awk -F' ' '{print $2}')

    if $php != "(none)";
    then
        echo "Php is already installed"
    else
        sudo apt install php
    fi

    #checking for mysql

    mysql=$(apt-cache policy mysql | grep "Installed" | awk -F' ' '{print $2}')

    if $mysql != "(none)";
    then 
        echo "Mysql is already installed"
    else
        sudo apt install mysql-server
    fi

    #checking for Nginx

    nginx=$(apt-cache policy nginx | grep "Installed" | awk -F' ' '{print $2}')

    if $nginx != "(none)";
    then 
        echo "Nginx is already installed"
    else
        sudo apt-get update
        sudo apt-get install nginx
    fi



    #reading Domain name
    
    echo -n "Enter your Domain name"
    read domain

    #host domain on server

    #install wordpress on server




else
    echo "Server Can't be reached'"
fi

#echo $message
#check for apache, PHP, mysql, or nginx installed or not 