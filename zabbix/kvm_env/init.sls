/etc/zabbix/zabbix_agentd.conf.d/kvm_env.conf:
  file.managed:
    - source: salt://zabbix/kvm_env/kvm_env.conf
/etc/sudoers:
  file.managed:
    - source: salt://zabbix/kvm_env/sudoers
zabbix_restart:
  cmd.run:
    - name: service zabbix_agentd restart

