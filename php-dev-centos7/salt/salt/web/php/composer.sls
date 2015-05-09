{% set settings = salt['pillar.get']('composer', {}) %}
{% set composer_path = settings.get('install_dir', '/usr/bin') %}
{% set composer_name = settings.get('filename', 'composer.phar') %}

curl:
  pkg:
    - name: curl
    - installed

composer:
  cmd.run: 
    - name: curl -sS https://getcomposer.org/installer | php -- --install-dir={{ composer_path }} --filename={{ composer_name }}
    - unless: test -f {{ composer_path }}/{{ composer_name }}
    - require:
      - pkg: php
      - pkg: curl
