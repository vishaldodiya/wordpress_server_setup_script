if [ -z "$1" -o -z "$2" ]
then
    echo "Enter valid Argument"
    echo "Enter command in specified format: sh install.sh <username> <ip address>"
else

sudo cp wordpress_server /bin/wordpress_server
sudo cp setup_script.sh /usr/local/bin/setup_script.sh

sudo chmod +x /bin/wordpress_server

sudo mv wordpress_server.1.gz /usr/share/man/man1/

sudo apt install openssh-client

ssh-keygen -t rsa
ssh-add

ssh $1@$2 << EOF
mkdir -p ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
EOF

cat ~/.ssh/id_rsa.pub | ssh $1@$2 "cat >> .ssh/authorized_keys"

#echo $(whoami) "All=(ALL) NOPASSWD: ALL" | ssh -l $1 $2 "sudo cat >> /etc/sudoers"
ssh -l $1 $2 << EOF
while tr ue; do
    read -p "Do you wish to change the sudoers script to make your script automated [Y/N]?" yn
    case $yn in
        [Yy]* ) sudo visudo;break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
EOF
#IF condition for automation

#echo "Change sudoers file to make automation in sudo command"
#sudo visudo


echo "Initial Server Setup done Now you Can run wordpress_server command to setup wordpress file on your server"

fi