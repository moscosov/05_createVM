#!/usr/bin/env bash

# Define echo color
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
BLUE="\033[1;34m"

# Define global variables
MEM_SIZE=4096
VCPUS=2
OS_VARIANT="rocky9.0"
OS_TYPE="linux"

# Node names
MASTER1=128_master1_kcna_lab
WORKER1=128_worker1_kcna_lab
WORKER2=128_worker2_kcna_lab

# Ks files URLs
MASTER1_KS_FILE=http://128ks.repo.local/master1.cfg
WORK1_KS_FILE=http://128ks.repo.local/worker1.cfg
WORK2_KS_FILE=http://128ks.repo.local/worker2.cfg

# Repo URLs
REPO=http://rocky9.repo.local/BaseOS/x86_64/os

#PATHS Storage
DIR_POOL=/mnt/ustore/kvm/kcna/

#Libvirt Pool
LIVB_POOL=kcna

# Storage names
VOL_MASTER1=128_master1_kcna.qcow2
VOL_WORKER1=128_worker1_kcna.qcow2
VOL_WORKER2=128_worker2_kcna.qcow2

echo -e "${GREEN} Poweroff VM\n"

# Shutdown VM
sudo /usr/bin/virsh destroy --domain $MASTER1
sudo /usr/bin/virsh destroy --domain $WORKER1
sudo /usr/bin/virsh destroy --domain $WORKER2 

sleep 2

echo -e "${RED} Undefine current VM\n"

# Undefine current VM
sudo /usr/bin/virsh undefine --domain $MASTER1
sudo /usr/bin/virsh undefine --domain $WORKER1
sudo /usr/bin/virsh undefine --domain $WORKER2

sleep 2

echo -e "${GREEN} Delete current storage\n"

# Delete storage
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_MASTER1
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_WORKER1
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_WORKER2

sleep 2

echo -e "${RED} Create storage to VM\n"

# Create storage
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_MASTER1 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_WORKER1 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_WORKER2 --format qcow2 --capacity 25G

sleep 2

date +%D-%T
echo -e
echo -e "${YELLOW} Install ${MASTER1}\n"

sudo virt-install \
-n ${MASTER1} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_MASTER1},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:ca:10 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${MASTER1_KS_FILE} inst.repo=${REPO} inst.noverifyssl"

sleep 10

date +%D-%T
echo -e
echo -e "${BLUE} Install ${WORKER1}\n"

sudo virt-install \
-n ${WORKER1} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_WORKER1},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:ca:11 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${WORK1_KS_FILE} inst.repo=${REPO} inst.noverifyssl"

sleep 10

date +%D-%T
echo -e
echo -e "${WHITE} Install ${WORKER2}\n"

sudo virt-install \
-n ${WORKER2} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_WORKER2},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:ca:12 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${WORK2_KS_FILE} inst.repo=${REPO} inst.noverifyssl"

exit 0
