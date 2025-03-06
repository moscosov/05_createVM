#!/bin/bash

while read IP FQDN HOST POD_SUBNET SVC_SUBNET; do 
  ssh-copy-id root@${IP}
done < /root/machine.txt

exit 0
