{% set apache  = salt['pillar.get']('apache', {}) %}

include:
  - apache.debian_full
  - apache.rewrite
  - apache.php5    
  - php
  - php.gd
  - php.json
  - php.mysql
  - php.pear
  - .php.composer

{% if grains['os_family']=="Debian" %}  
apache-default-site:
  file.managed:
    - template: jinja
    - name: {{ apache.get('vhostdir', '/etc/apache2/sites-available') }}/{{ apache.get('default', '{}').get('name', '000-default.conf') }}
    - source: salt://web/apache/vhost-default.conf
{% endif %}    
  
extend:
  apache-restart:
    module:
      - watch:
        - file: apache-default-site
        - pkg: php*        
