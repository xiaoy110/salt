/etc/zabbix/zabbix_agentd.conf.d/dns_monitor.conf:
  file.managed:
    - source: salt://zabbix/DNS/dns_monitor.conf
zabbix_restart:
  cmd.run:
    - name: /etc/init.d/zabbix_agentd restart
