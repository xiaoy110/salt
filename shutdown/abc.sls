salt-minion-shutdown:
  cmd.run:
{% if grains['os'] == 'Windows' %}
    - name: echo shutdown -s -t 0
{% else %}
    - name: echo poweroff
{% endif %}
