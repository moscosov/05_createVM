#!/bin/bash

while read IP FQDN HOST SUBNET; do 
  ssh-copy-id root@${IP}
done < /root/machine.txt

exit 0
