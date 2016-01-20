disk_io_conf:
  file.managed:
    - name: /etc/zabbix/zabbix_agentd.conf.d/disk_io.conf
    - source: salt://zabbix/disk_io/disk_io.conf
disk_io_scripts:
  file.managed:
    - name: /etc/zabbix/scripts.tgz
    - source: salt://zabbix/disk_io/scripts.tgz
zabbix_restart:
  cmd.run:
    - cwd: /etc/zabbix/
    - name: tar zxf scripts.tgz && /etc/init.d/zabbix_agentd restart
