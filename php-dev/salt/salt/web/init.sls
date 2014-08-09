include:
  - apache.debian_full
  - apache.php5  
  - apache.vhosts.standard
  - php
  - php.gd
  - php.json
  - php.mysql

extend:
  apache-restart:
    module:
      - watch:
        - pkg: php*        
