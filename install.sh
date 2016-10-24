if test $1 = 0 || $2 = 0;[ -z "$1" || -z "$2"]
then
    echo "Enter valid Argument"
    echo "Enter command in specified format: wordpress_server <username> <ip address>"
else

sudo cp wordpress_server /bin/wordpress_server
sudo cp setup_script.sh /bin/setup_script.sh

sudo chmod +x /bin/wordpress_server

sudo tar -czvf wordpress_server.tar.gz wordpress_server.man

sudo mv wordpress_server.tar.gz /usr/share/man/man1/

ssh-keygen -t rsa

if test -f .ssh/authorized_keys;
then
    echo 'authorized key exist'
else 
    mkdir .ssh
    touch .ssh/authorized_keys
fi

cat ~/.ssh/id_rsa.pub | ssh -l $1 $2 "cat >> .ssh/authorized_keys"

#echo $(whoami) "All=(ALL) NOPASSWD: ALL" | ssh -l $1 $2 "sudo cat >> /etc/sudoers"

ssh -l $1@$2

while true; do
    read -p "Do you wish to change the sudoers script to make your script automated?" yn
    case $yn in
        [Yy]* ) echo "Insert <username> ALL=(ALL) NOPASSWD: ALL at the end of the file" 
                sudo visudo; 
                break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
 
#IF condition for automation

#echo "Change sudoers file to make automation in sudo command"
#sudo visudo


echo "Initial Server Setup done Now you Can run wordpress_server command to setup wordpress file on your server"

fi

