# see: https://github.com/mkhubbard/apache-formula/blob/master/pillar.example
apache:
  vhostdir: /etc/apache2/sites-available
  default: 
    name: 000-default.conf
    path: /srv/www
