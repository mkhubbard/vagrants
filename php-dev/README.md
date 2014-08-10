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

The document root for the default site is set to "/srv/www".

By default the Vagrantfile is configured to create (if not present) and mount a "www" directory to "/srv/www" on the guest. You may specify an alternate directory by defining an environemnt variable named "VAGRANT_PHP_DEV_WWW" containing the absolute path of the desired host directory.

Additionally the default host configuration may be altered through the "apache.sls" pillar data in the "salt/pillar" directory.