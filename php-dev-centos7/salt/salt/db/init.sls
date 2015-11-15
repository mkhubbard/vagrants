{% set postgresql = pillar['postgresql'] %}
{% set pkgver = pillar['postgresql']['version']['major']|string + pillar['postgresql']['version']['minor']|string %}
{% set binver = pillar['postgresql']['version']['major']|string + '.' + pillar['postgresql']['version']['minor']|string %}


postgresql.repository:
  pkg.installed:
    - sources: 
      - pgdg-centos{{ pkgver }}: {{ postgresql.repository.package }}
    - require_in:
      - pkg: postgresql.packages

postgresql.packages:
  pkg.installed:
    - pkgs:
      - postgresql{{ pkgver }}
      - postgresql{{ pkgver }}-contrib
      - postgresql{{ pkgver }}-devel
      - postgresql{{ pkgver }}-server
    - require:
      - pkg: postgresql.repository
      
pg-initdb:
  cmd.wait:
  - name: /usr/pgsql-{{ binver }}/bin/initdb -D /var/lib/pgsql/{{ binver }}/data -E UTF8 --locale C 
  - user: postgres
  - watch: 
    - pkg: postgresql.packages
  - unless: ls /var/lib/pgsql/{{ binver }}/data/base      
  
postgresql-conf:
  file.replace:
    - name: /var/lib/pgsql/{{ binver }}/data/postgresql.conf  
    - pattern: "#listen_addresses = 'localhost'"
    - repl: "listen_addresses = '*'" 
  
postgresql-hba:
  file.line:
    - name: /var/lib/pgsql/{{ binver }}/data/pg_hba.conf  
    - mode: insert
    - location: end
    - content: "host all all all trust"
  
postgresql-hba-owner:  
  file.managed:
    - name: /var/lib/pgsql/{{ binver }}/data/pg_hba.conf      
    - user: postgres
    - group: postgres
  
postgresql-{{ binver }}:
  service:
    - running
    - enable: true
    - require:
      - file: /var/lib/pgsql/{{ binver }}/data/postgresql.conf
      - file: /var/lib/pgsql/{{ binver }}/data/pg_hba.conf  