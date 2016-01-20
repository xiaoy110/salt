import os
def do_something():
    '''
    get  ip and hostname

    CLI Example::

        salt '*' add_zabbix_agentd:do_something
    '''
    # do something!
    host=os.popen("echo $HOSTNAME")
    IP=os.popen("ifconfig eth0|grep 'inet addr'|awk -F '[:, ]' '{print $13}'")
    __salt__['event.send']('add/zabbix_agentd', {
        'finished': True,
        'message': "add zabbix_agentd is finished!",
        'host': host.read().strip(),
        'IP': IP.read().strip()
    })
    return True
