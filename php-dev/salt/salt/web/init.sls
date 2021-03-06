{% from "web/map.jinja" import apache with context %}

include:
  - apache.debian_full
  - apache.rewrite
  - apache.php5    
  - php
  - php.gd
  - php.intl
  - php.json
  - php.mysql
  - php.pear
  - .php.composer
  
apache-default-site:
  file.managed:
    - template: jinja
    - name: {{ apache.vhostdir }}/{{ apache.default_site_conf }}
    - source: salt://web/apache/vhost-default.conf

www:
  user.present:
    - name: www
    - password: $6$88GZVBQI$l64Dgta1ozVd34tWfcGLK6rt47qDdlBivDI1HTRcjUpR4dwDl8RPaeuUDuu8VxPcaM5OBkRDv3dbN2nzhfBRG/    
    - shell: /bin/bash
    - home: {{ apache.default_site_root }}
    - createhome: false
    - groups:
      - {{ apache.group }}
   
web-root-permissions:
  file.directory:
    - name: {{ apache.default_site_root }}
    - user: www-data
    - group: www-data
    - mode: 2775
    - makedirs: True
   
extend:
  apache-restart:
    module:
      - watch:
        - file: apache-default-site
        - pkg: php*   
