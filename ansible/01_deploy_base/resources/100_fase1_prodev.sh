#!/usr/bin/env bash

# Define echo color
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
BLUE="\033[1;34m"

# Define global variables
MEM_SIZE=3072
VCPUS=2
OS_VARIANT="rocky9.0"
OS_TYPE="linux"

# Node names
APP1=app_fase1_server_lab
DB1=db_fase1_server_lab

# Ks files URLs
APP1_KS_FILE=http://ks.lab.local/01_fase1_app_server.cfg
DB1_KS_FILE=http://ks.lab.local/02_fase1_db_server.cfg

# Repo URLs
REPO=http://rocky9.lab.local/BaseOS/x86_64/os

#PATHS Storage
DIR_POOL=/prodev01/pool_fase1VM/

#Libvirt Pool
LIVB_POOL=pool_fase1VM

# Storage names
VOL_APP1=app_fase1_server_lab.qcow2
VOL_DB1=db_fase1_server_lab.qcow2

echo -e "${RED} Poweroff VM\n"

# Shutdown VM
sudo /usr/bin/virsh destroy --domain $APP1
sudo /usr/bin/virsh destroy --domain $DB1

sleep 2

echo -e "${RED} Undefine current VM\n"

# Undefine current VM
sudo /usr/bin/virsh undefine --domain $APP1
sudo /usr/bin/virsh undefine --domain $DB1

sleep 2

echo -e "${REED} Delete current storage\n"

# Delete storage
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_APP1
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_DB1

sleep 2

echo -e "${GREEN} Create storage to VM\n"

# Create storage
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_APP1 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_DB1 --format qcow2 --capacity 25G

sleep 2

date +%D-%T
echo -e
echo -e "${YELLOW} Install ${APP1}\n"

sudo virt-install \
-n ${APP1} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_APP1},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:bb:05 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${APP1_KS_FILE} inst.repo=${REPO} inst.noverifyssl"

sleep 10

date +%D-%T
echo -e
echo -e "${BLUE} Install ${DB1}\n"

sudo virt-install \
-n ${DB1} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_DB1},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:bb:06 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${DB1_KS_FILE} inst.repo=${REPO} inst.noverifyssl"

sleep 10

date +%D-%T

exit 0
