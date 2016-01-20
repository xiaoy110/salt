{% if data['data']['finished'] == True %}
add_zabbix_agentd:
  local.cmd.run:
    - tgt: 'ceph01'
    - arg:
       - python /data/zabbix/zabbix_ap/chost.py {{ data['data']['host'] }} {{ data['data']['IP'] }} 1 10001
{% endif %}
