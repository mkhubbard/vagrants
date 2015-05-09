# see: https://github.com/mkhubbard/postgresql-formula/blob/master/pillar.example
postgres:
  use_upstream_repo: True

  pg_hba.conf: salt://postgres/pg_hba.conf

  # This section cover this ACL management of the pg_hba.conf file.
  # <type>, <database>, <user>, [host], <method>
  acls:
    - ['host', 'all', 'admin', '0.0.0.0/0']

  users:
    admin:
      password: 'password'
      createdb: True
      createroles: True
      createuser: True
      inherit: True
      replication: False
  
  # This section will append your configuration to postgresql.conf.
  postgresconf: |
    listen_addresses = 'localhost,*'