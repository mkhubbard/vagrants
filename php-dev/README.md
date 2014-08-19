php-dev
=======

Vagrant file for provisioning a PHP development server. 

### Software ###

 * Ubuntu Server 64-bit 14.04 LTS (https://vagrantcloud.com/ubuntu/trusty64)
 * Salt
 * Git
 * Apache
 * PHP
 * PEAR
 * Composer
 * MySQL

### Notes

The default site document root is accessible over SFTP using the following credentials:

    Username: www
    Password: www

Port 8000 is forwarded from the host machine to port 80 on the guest machine. Local port forwarding
rules may be put in place to redirect local traffic on the host if desired. 

Example port forward for Linux using iptables:

    iptables -t nat -I OUTPUT --src 0/0 --dst 127.0.0.1 -p tcp --dport 80 -j REDIRECT --to-ports 8000
