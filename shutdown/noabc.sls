salt-minion-shutdown:
  cmd.run:
{% if grains['os'] == 'Windows' %}
    - name: shutdown -a
{% else %}
    - name: kill -9 `ps -ef|grep 'shutdown -h'|grep -v 'grep' |awk '{print $2}'`
{% endif %}
