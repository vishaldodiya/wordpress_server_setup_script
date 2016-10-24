sudo cp wordpress_server /bin/wordpress_server
sudo cp setup_script.sh /bin/setup_script.sh

sudo chmod +x /bin/wordpress_server

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

#IF condition for automation

echo "Change sudoers file to make automation in sudo command"
sudo visudo


echo "Initial Server Setup done Now you Can run wordpress_server command to setup wordpress file on your server"


