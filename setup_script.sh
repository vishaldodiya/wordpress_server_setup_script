apache=$(apt-cache policy apache2 | grep "Installed" | awk -F' ' '{print $2}')

if test "$apache" != "(none)";
then 
    echo "Apache2 is already installed"
else
    sudo apt install -y apache2
fi

#checking for PHP

php=$(apt-cache policy php | grep "Installed" | awk -F' ' '{print $2}')

if test "$php" != "(none)";
then
    echo "Php is already installed"
else
    sudo apt install -y php
fi

#checking for mysql

mysql=$(apt-cache policy mysql | grep "Installed" | awk -F' ' '{print $2}')

if test "$mysql" != "(none)";
then 
    echo "Mysql is already installed"
else
    sudo apt install -y mysql-server
fi

#checking for Nginx

nginx=$(apt-cache policy nginx | grep "Installed" | awk -F' ' '{print $2}')

if test "$nginx" != "(none)";
then 
    echo "Nginx is already installed"
else
    sudo apt-get update
    sudo apt-get install -y nginx
#    ufw_status=$(sudo ufw status)

#    if test "$ufw_status" != "Status: inactive";
#    then
#        echo "ufw is active"
#        nginx_status=$(sudo ufw status | grep "^Nginx HTTP" | awk -F' ' '{print $3}')
#        nginx_v6_status=$(sudo ufw status | grep "^Nginx HTTP (v6)" | awk -F' ' '{print $4}')
#        
#        if $nginx_status = deny || $nginx_v6_status = deny;
#         then
#              sudo ufw allow 'Nginx HTTP'
#        else
#            echo "Nginx completely installed"
#       fi
#            
#    else
#        sudo ufw enable
#        sudo ufw allow 'Nginx HTTP'
#    fi
            
fi



#reading Domain name
#read -p "Enter your Domain name:" domain    
#echo -n "Enter your Domain name"
#read domain

    #making domain directory

sudo mkdir /var/www/$3/public_html
    
#granting permission

sudo chown www-data:www-data /var/www/$3/public_html
sudo chmod 755 /var/www/$3/public_html

sudo echo "<html>\
               <head>\
                   <title>\
                       Welcome hosted!\
                   </title>\
              </head>\
                    
               <body>\
                  <h1>It Worked!!! :) :)</h1>\
                </body>\
            </html>" > /var/www/$3/public_html/index.html

sudo echo "DocumentRoot /var/www/$3/public_html\
            ServerName www.$3\
            ServerAlias $3\
            ErrorLog \${APACHE_LOG_DIR}/error.log\
            CustomLog \${APACHE_LOG_DIR}/access.log" > /etc/apache2/sites-available/$domain.conf

sudo a2ensite $domain.conf

sudo service apache2 restart

#install wordpress on server

wget -c http://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz

sudo rsync -av wordpress/* /var/www/$3/

#setting up database

mysql -u root -p

CREATE DATABASE $3\_db;

    
