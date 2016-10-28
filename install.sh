if [ -z "$1" -o -z "$2" ]
then
    echo "Enter valid Argument"
    echo "Enter command in specified format: sh install.sh <username> <ip address>"
else

sudo cp wordpress_server /bin/wordpress_server
sudo cp setup_script.sh /usr/local/bin/setup_script.sh

sudo chmod +x /bin/wordpress_server

sudo cp wordpress_server.1.gz /usr/share/man/man1/

sudo apt install -y openssh-client

ssh-keygen -t rsa
ssh-add

uname=$(whoami)

ssh $1@$2 << EOF
mkdir -p ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
EOF

cat ~/.ssh/id_rsa.pub | ssh $1@$2 "cat >> .ssh/authorized_keys; sudo adduser $uname www-data"


echo "+===========================================================================+"
echo "|| To Automate our script you need to insert below command in sudoers file.||"
echo "+===========================================================================+"
echo "|| <your username> ALL=(ALL) NOPASSWD: ALL                                 ||"
echo "+===========================================================================+"
ssh -t $1@$2 'sudo visudo'


echo "\n\n"
echo "Initial Server Setup done Now you Can run wordpress_server command to setup wordpress file on your server"
echo "\n"
echo "You can now run wordpress_server command globally"
echo "\n"
echo "Example: $ wordpress_server <username> <ip adress> <example.com(domain name)>"

fi