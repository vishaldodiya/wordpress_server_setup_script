# wordpress_server_setup_script

wordpress_server is smart command that deploy wordpress files on user specified ubuntu server. It will check on the server for prerequisite like, LAMP modules which include Apache, Mysql and PHP. If this modeules are not installed on server than wordpress_server will install this modules on that server.

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
#### or

```
download zip file and unzip it.
```

### Step 2: move to wordpress_server_setup_script folder and run below command many time server ask for password, enter your server user password 

```
$ sh install.sh <server username> <server ip>
```
### Step 3: ssh public key setup


#### you will now see below line
```
Enter file in which to save the key (/home/username/.ssh/id_rsa): 
```
#### for sake of simplicity leave it blank, press enter
#### then for
```
Enter passphrase (empty for no passphrase): 
```
#### press Enter
#### for
```
Enter same passphrase again: 
```
#### press Enter
#### you will see pattern like below
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
#### you will see below pattern and redirected to enter password or vi editor
```
============================================================================
|| To Automate our script you need to insert below command in sudoers file.||
============================================================================
|| <your username> ALL=(ALL) NOPASSWD: ALL                                ||
============================================================================
```
#### This is for granting permission to execute command on server without entering sudo password. It will make an entry of user which grant permission to that user. I have used a visudo editor because it is safe to use if some error occur it will not let you save the file. So enter below line carefully at the end of the file..
```
<your username> ALL=(ALL) NOPASSWD: ALL  
```
#### Initial server setup has been done

### Step 4: After Successfully setting up installation file run command

```
$ wordpress_server <server username> <server ip> <domain name(example.com)>
```
check for Apache2, if not installed then install it.
check fot PHP, if not installed then install it