{% from "web/map.jinja" import php with context %}

phalcon.packages:
  pkg.installed:
    - pkgs:
      - {{ php.php_devel }}
      - {{ php.pcre_devel }} 
      - gcc 
      - make

phalcon.source:
  git.latest:
    - name: git://github.com/phalcon/cphalcon.git
    - rev: phalcon-v2.0.8
    - target: /usr/local/src/cphalcon
    - require:
      - pkg: git
      
phalcon.build:
  cmd.run:
    - cwd: /usr/local/src/cphalcon/build
    - name: |
        sudo ./install        
        
phalcon.extension:
  file.managed:
    - template: jinja
    - name: /etc/php.d/phalcon.ini
    - source: salt://web/php/phalcon.ini

phalcon.tools.source:    
  git.latest:
    - name: git://github.com/phalcon/phalcon-devtools
    - rev: v2.0.8
    - target: /usr/local/src/phalcon-devtools
    - require:
      - pkg: git

phalcon.tools.install:    
  cmd.run:
    - cwd: /usr/local/src/phalcon-devtools
    - name: |                
        ln -s /usr/local/src/phalcon-devtools/phalcon.php /usr/bin/phalcon
        chmod ugo+x /usr/bin/phalcon        
        
phalcon.tools.bash:
  file.copy:
    - name: /etc/bash_completion.d/phalcon-completion.bash 
    - source: /usr/local/src/phalcon-devtools/phalcon-completion.bash 
          
extend:
  apache-restart:
    module:
      - watch:
        - file: phalcon.extension        
        