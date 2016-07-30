#!/bin/bash

percent=$(df -hl | awk '/^\/dev\/sd[ab]/ { sum+=$5 } END { print sum }');

curl "http://my.url/core/api/jeeApi.php?apikey=1234&type=httpRemoteEvent&eqId=1&value=$percent"
