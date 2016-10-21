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
        ufw_status=$(sudo ufw status)

        if $ufw_status != "Status: inactive";
        then
            echo "ufw is active"
            nginx_status=$(sudo ufw status | grep "^Nginx HTTP" | awk -F' ' '{print $3}')
            nginx_v6_status=$(sudo ufw status | grep "^Nginx HTTP (v6)" | awk -F' ' '{print $4}')
        
            if $nginx_status = deny || $nginx_v6_status = deny;
            then
                sudo ufw allow 'Nginx HTTP'
            else
                echo "Nginx completely installed"
            fi
            
        else
            sudo ufw enable
            sudo ufw allow 'Nginx HTTP'
        fi
            
    fi



    #reading Domain name
    
    echo -n "Enter your Domain name"
    read domain

    #making domain directory

    sudo mkdir -p /var/www/$domain/public_html
    
    #granting permission

    sudo chown -R www-data:www-data /var/www/$domain/public_html
    sudo chmod -R 755 /var/www/$domain/public_html

    sudo echo "<html>\
                    <head>\
                        <title>\
                            Welcome hosted!\
                        </title>\
                    </head>\
                    
                    <body>\
                        <h1>It Worked!!! :) :)</h1>\
                    </body>\
                </html>" > /var/www/$domain/public_html/index.html

    sudo echo "DocumentRoot /var/www/$domain/public_html\
                ServerName www.$domain\
                ServerAlias $domain\
                ErrorLog \${APACHE_LOG_DIR}/error.log\
                CustomLog \${APACHE_LOG_DIR}/access.log" > /etc/apache2/sites-available/$domain.conf

    sudo a2ensite $domain.conf

    sudo service apache2 restart

    #install wordpress on server

    wget -c http://wordpress.org/latest.tar.gz

    tar -xzvf latest.tar.gz

    sudo rsync -av wordpress/* /var/www/$domain/

    #setting up database

    mysql -u root -p

    CREATE DATABASE $domain\_db;

    
