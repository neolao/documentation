#!/bin/bash

count=$(aptitude search '~U' | wc -l)
list=$(apt list --upgradable)


curl "http://my.url/core/api/jeeApi.php?apikey=1234&type=httpRemoteEvent&eqId=1&value=$count" > /dev/null 2>&1
#curl --data-urlencode "value=$list" "http://jeedom.url/core/api/jeeApi.php?apikey=1234&type=httpRemoteEvent&eqId=40" > /dev/null 2>&1
