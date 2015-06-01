php-dev
=======

Vagrant file for provisioning a PHP development server. 

### Software ###

 * [CentOS 6.6](https://atlas.hashicorp.com/mhubbard/boxes/centos6)
 * [Salt](http://saltstack.com)
 * [Git](http://git-scm.com)
 * [Apache](http://httpd.apache.org/)
 * [PHP](http://php.net)
 * [PEAR](http://pear.php.net)
 * [Composer](http://getcomposer.org)
 * [MySQL](http://www.mysql.com/) 

### Networking ###

Port 8000 is forwarded from the host machine to port 80 on the guest machine. Local port forwarding
rules may be put in place to redirect local traffic on the host if desired. 

Example port forward for Linux using iptables:

    iptables -t nat -I OUTPUT --src 0/0 --dst 127.0.0.1 -p tcp --dport 80 -j REDIRECT --to-ports 8000

Example port forward for Windows:
    
    netsh interface portproxy add v4tov4 listenport=80 listenaddress=127.0.0.1 connectport=8000 connectaddress=127.0.0.1

### Document Root ###
    
The default site document root is accessible over SFTP using the following credentials:

    Username: www
    Password: www
