zabbix_cs:
  file.managed:
    - name: D:\gawk-3.1.6-1-setup.exe
    - source: salt://zabbix/windows/gawk-3.1.6-1-setup.exe
zabbix_jb:
  file.managed:
    - name: D:\DiskMonitor.vbs
    - source: salt://zabbix/windows/DiskMonitor.vbs
#zabbix_conf:
#  file.managed:
#    - name: D:\zabbix\conf\zabbix_agentd.win.conf
#    - source: salt://zabbix/windows/zabbix_agentd.win.conf
