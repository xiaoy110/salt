zabbix_user:
  user.present:
    - name: zabbix
    - createhome: False
    - gid_from_name: True
    - shell: /sbin/nologin
zabbix_cs:
  file.managed:
    - name: /tmp/zabbix-2.4.5.tar.gz
    - source: salt://zabbix/CentOS/zabbix-2.4.5.tar.gz
zabbix_install:
  cmd.run:
  - cwd: /tmp
  - names:
#    - echo 'nameserver 10.10.112.9' >> /etc/resolv.conf && yum install net-snmp-devel net-snmp-utils net-snmp curl curl-devel -y && yum groupinstall "Development Tools" -y && tar zxf zabbix-2.4.5.tar.gz && cd /tmp/zabbix-2.4.5 && ./configure sysconfdir=/etc/zabbix --enable-agent && make install
    - yum install net-snmp-devel net-snmp-utils net-snmp curl curl-devel -y && yum groupinstall "Development Tools" -y && tar zxf zabbix-2.4.5.tar.gz && cd /tmp/zabbix-2.4.5 && ./configure sysconfdir=/etc/zabbix --enable-agent && make install
