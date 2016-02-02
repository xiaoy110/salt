salt-minion-shutdown:
  cmd.run:
{% if grains['os'] == 'Windows' %}
    - name: shutdown -s -t 300
{% else %}
    - name: shutdown -h +5 &
{% endif %}
