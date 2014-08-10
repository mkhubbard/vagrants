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

### Usage ###

	vagrant up

### Notes

If "VAGRANT_PHP_DEV_WWW" is defined in the environment this path will be mounted to the document root for the default site. Otherwise a "www" directory next to the Vagrantfile will be used and created if necessary.
