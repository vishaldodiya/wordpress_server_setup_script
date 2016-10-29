# wordpress_server_setup_script

wordpress_server is smart command that deploy wordpress files on user specified ubuntu server. It will deploy your wordpress data of website on Nginx server.It will check on the server for prerequisite like, LAMP modules which include Mysql and PHP & Nginx. If this modeules are not installed on server than wordpress_server will install this modules on that server.

## Getting Started

To setup your wordpress files on wordpress server you need one Linux or Unix system. Because SSH only work on linux and unix platform.

## Prerequisites

There are prerequisites OPEN-SSH, but it will get installed during setup of command.
you can manually install with below command
```
sudo apt install -y openssh-client
```

## Installing

A step by step example will lead to environment setup of this command

### Step 1: Clone repository or download zip file

```
git clone https://github.com/vishaldodiya/wordpress_server_setup_script.git
```
or

```
download zip file and unzip it.
```

### Step 2: move to wordpress_server_setup_script folder and run below command, many time script will ask for password, enter your server user password. 

```
$ sh install.sh <server username> <server ip>
```
### Step 3: ssh public key setup


you will now see below line
```
Enter file in which to save the key (/home/username/.ssh/id_rsa): 
```
for sake of simplicity leave it blank, press enter
then for
```
Enter passphrase (empty for no passphrase): 
```
press Enter
for
```
Enter same passphrase again: 
```
press Enter
you will see pattern like below
```
The key's randomart image is:
+---[RSA 2048]----+
|   . ..o+o..+  o.|
|    =  +. .o.+  o|
|   + .o..o  o...+|
|  . . o+.+   ...*|
|  .o .o S   . .++|
|.ooo.. o     +.+E|
|..+..         = .|
|..               |
|o                |
+----[SHA256]-----+
```
you will see below pattern and redirected to enter password or vi editor
```
============================================================================
|| To Automate our script you need to insert below command in sudoers file.||
============================================================================
|| <your username> ALL=(ALL) NOPASSWD: ALL                                ||
============================================================================
```
This is for granting permission to execute command on server without entering sudo password. It will make an entry of user which grant permission to that user. I have used a visudo editor because it is safe to use if some error occur it will not let you save the file. So enter below line carefully at the end of the file..
```
<your username> ALL=(ALL) NOPASSWD: ALL  
```
press
```
1.ctrl + x
2.'y' to save and 'n' to discard
3.Enter
```
Initial server setup has been done

### Step 4: After Successfully setting up installation file, run below command

```
$ wordpress_server <server username> <server ip> <domain name(example.com)>
```
#### process

* check for PHP, if not then will get installed.
* check for mysql-server, if not then will get installed.
* check for nginx, if not then will get installed.
* make directory of domain name in /var/www/ (e.g /var/www/example.com) and needed permission granted here I have granted full permission
* make configuration file in Nginx server and make necessary changes in file.
* It will now download wordpress latest file using wget and then extract it and move the file to /var/www/example.com/
* Update hosts file, make entry of domain name with localhost ip in /etc/hosts/ file. (e.g 127.0.0.1     example.com)
* Restart Nginx
* clean up temporary file.
* you are ready to go. you can now open your domain name.

## File structure

```
.
.
├── install.sh
├── LICENSE
├── README.md
├── setup_script.sh
├── wordpress_server
├── wordpress_server.1.gz
```

## Built with

* [PHP](https://www.php.net/) - for web development.
* [Mysql](http://www.mysql.com/) - for database.
* [Nginx](https://www.nginx.com/) - for Server.Rapid server deployment and accelerates content and application delivery.
* [Wordpress](https://wordpress.com/) - for wordpress files.
* [SSH](https://www.ssh.com/) - for secure communication between client and server.

## Authors

* **Vishal Dodiya** - *Whole smart work* - [Profile](https://github.com/vishaldodiya)

## License

This project is licensed under the MIT License - see the [LICENSE.md](https://github.com/vishaldodiya/wordpress_server_setup_script/blob/master/LICENSE) file for details

