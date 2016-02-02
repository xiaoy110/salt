#!/bin/bash
date >> /tmp/nosaltshutdown.log
salt \* state.sls shutdown/noabc >> /tmp/nosaltshutdown.log
