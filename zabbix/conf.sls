zabbix_conf:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf
    - source: salt://zabbix/CentOS/zabbix_agentd.conf
    - template: jinja
zabbix_agentd:
  file.managed:
    - name: /etc/init.d/zabbix_agentd
    - source: salt://zabbix/CentOS/zabbix_agentd
    - mode: 655
{% if grains['osfinger'] == 'CentOS Linux-7' %}
zabbix_agent_service:
  file.managed:
    - name: /usr/lib/systemd/system/zabbix_agentd.service
    - source: salt://zabbix/zabbix_agentd.service
{% endif %}

zabbix_run:
  cmd.run:
    - names:
      - mkdir /var/run/zabbix && chown zabbix.zabbix /var/run/zabbix
      - mkdir /var/log/zabbix && chown zabbix.zabbix /var/log/zabbix
      - echo -e "nameserver 10.10.112.9 \nnameserver 10.10.112.8" > /etc/resolv.conf
      - service zabbix_agentd restart
      - chkconfig zabbix_agentd on
      - iptables -I INPUT -p tcp --dport 10050 -j ACCEPT && service iptables save
