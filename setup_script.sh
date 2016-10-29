#apache=$(apt-cache policy apache2 | grep "Installed" | awk -F' ' '{print $2}')

#if test "$apache" != "(none)";
#then 
#    echo "Apache2 is already installed"
#else
#    sudo apt install -y apache2
#fi

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

sudo mkdir -p /var/www/$1
    
#sudo touch /var/www/$1/public_html/index.html
sudo touch /etc/nginx/sites-available/$1

sudo chmod 775 /etc/nginx/sites-available/$1
sudo chown -R www-data:www-data /etc/nginx/sites-available/$1

#sudo printf "<html>
#    <head>
#        <title>
#            Welcome hosted!
#        </title>
#    </head>
#                    
#    <body>
#        <h1>It Worked!!! :) :)</h1>
#    </body>
#</html>" > /var/www/$1/public_html/index.html

sudo printf " server {
        listen   80; 
        #listen   [::]:80 default ipv6only=on;

        root /var/www/$1;
        index index.html index.htm index.php;

        server_name $1;
}" > /etc/nginx/sites-available/$1

#make symbolic link between sites-available and sites-enabled example.com file

sudo ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/example.com


sudo rm /etc/nginx/sites-enabled/default

#install wordpress on server

wget -c http://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz

sudo rsync -av wordpress/* /var/www/$1/

sudo touch /var/www/$1/wp-config.php

#granting permission
sudo chown -R www-data:www-data /var/www/$1/
sudo chmod -R 775 /var/www/$1/

#Adding Entry of /etc/hosts

sudo sed -i -e '1 i\127.0.0.1      '$1 /etc/hosts
#sudo sed -i -e 's/localhost/'$1'/' /etc/hosts

#Setting up database configuration

sudo cp /var/www/$1/wp-config-sample.php /var/www/$1/wp-config.php

sudo sed -i -e 's/database_name_here/'$1'_db/g' /var/www/$1/wp-config.php
sudo sed -i -e 's/username_here/root/g' /var/www/$1/wp-config.php
sudo sed -i -e 's/password_here//g' /var/www/$1/wp-config.php
sudo sed -i -e 's/localhost/'$1'/9' /var/www/$1/wp-config.php

#nginx service restart

sudo service nginx restart

#Removing temporary files

sudo rm ~/latest.tar.gz

sudo rm -r ~/wordpress

echo "+==================================================================+"
echo "||         Your Wordpress files are settled up                    ||"
echo "||you can now open your website to check server is working or not ||"
echo "+==================================================================+"
echo "||                           THANK YOU                            ||"
echo "+==================================================================+"


    
