#!/bin/bash
date >> /tmp/saltshutdown.log
salt \* state.sls shutdown/abc >> /tmp/saltshutdown.log
sleep 180
echo poweroff
