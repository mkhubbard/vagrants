include:
  - apache.debian_full
  - apache.php5  
  - apache.vhosts.standard
  - php
  - php.gd
  - php.json
  - php.mysql
  - .php.composer
  
extend:
  apache-restart:
    module:
      - watch:
        - pkg: php*        
