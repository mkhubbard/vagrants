acl:
  pkg:
    - name: acl
    - installed

curl:
  pkg:
    - name: curl
    - installed    
    
{% if grains['os_family'] == 'RedHat' %}
# Until the salt.module.firewalld is available this is the easiest way
# to deal with the firewall. (Pending for 2015.2.0)
firewalld:
  service:
    - dead
    - name: firewalld
    - enable: false          
{% endif %}