if test -f .ssh/authorized_keys;
then
    echo 'authorized key exist'
else 
    mkdir .ssh
    touch .ssh/authorized_keys
fi