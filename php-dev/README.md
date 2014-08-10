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

Vagrant will mount a "www" directory located next to the Vagrantfile to the default document root of "/var/www/html" on the guest. This directory will be created on the host if it does not already exist.
