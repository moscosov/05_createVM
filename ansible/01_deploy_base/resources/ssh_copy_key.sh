#!/bin/bash

export file=$1

while read IP FQDN HOST POD_SUBNET SVC_SUBNET; do 
  ssh-copy-id -o StrictHostKeyChecking=no root@${IP}
done < /root/$file

exit 0
