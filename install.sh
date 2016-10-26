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

ssh $1@$2 << EOF
mkdir -p ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/authorized_keys
EOF

cat ~/.ssh/id_rsa.pub | ssh $1@$2 "cat >> .ssh/authorized_keys"

#ssh -l $1 $2 << EOF
#echo $(whoami) "All=(ALL) NOPASSWD: ALL" | ssh -l $1 $2 "sudo cat >> /etc/sudoers"
#echo "To Automate our script you need to insert below command in sudoers file."
#echo "<your username> ALL=(ALL) NOPASSWD: ALL"

#echo "Do you wish to change the sudoers script to make your script automated?"
#select yn in "Yes" "No"; do
#case $yn in
#Yes ) sudo visudo; break;;
#No ) break;;
#esac
#done
#EOF
echo "============================================================================"
echo "|| To Automate our script you need to insert below command in sudoers file.||"
echo "============================================================================"
echo "|| <your username> ALL=(ALL) NOPASSWD: ALL                                ||"
echo "============================================================================"
ssh -t $1@$2 'sudo visudo'
#ssh -l $1 $2 << 'EOF'
#    sudo visudo
#EOF

#ssh -l $1 $2 << EOF
#while true; do
#read -p "Do you wish to change the sudoers script to make your script automated [Y/N]?" yn
#case $yn in
#[Yy]* ) sudo visudo; break;;
#[Nn]* ) break;;
#* ) echo "Please answer yes or no.";;
#esac
#done
#EOF
#IF condition for automation

#echo "Change sudoers file to make automation in sudo command"
#sudo visudo


echo "Initial Server Setup done Now you Can run wordpress_server command to setup wordpress file on your server"

fi