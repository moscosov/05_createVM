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
OS_VARIANT="ubuntu22.04"
OS_TYPE="linux"

# Node names
MASTER1=10_master1_hard_lab
MASTER2=10_master2_hard_lab
MASTER3=10_master3_hard_lab
WORKER1=10_worker1_hard_lab
WORKER2=10_worker2_hard_lab
WORKER3=10_worker3_hard_lab
WORKER4=10_worker4_hard_lab
WORKER5=10_worker5_hard_lab
WORKER6=10_worker6_hard_lab
ETCDM1=10_etcd_master1_hard_lab
ETCDM2=10_etcd_master2_hard_lab
ETCDM3=10_etcd_master3_hard_lab


# Ks files URLs
MASTER1_KS_FILE=http://10ks.repo.local/master1.cfg
MASTER2_KS_FILE=http://10ks.repo.local/master2.cfg
MASTER3_KS_FILE=http://10ks.repo.local/master3.cfg
WORK1_KS_FILE=http://10ks.repo.local/worker1.cfg
WORK2_KS_FILE=http://10ks.repo.local/worker2.cfg
WORK3_KS_FILE=http://10ks.repo.local/worker3.cfg
WORK4_KS_FILE=http://10ks.repo.local/worker4.cfg
WORK5_KS_FILE=http://10ks.repo.local/worker5.cfg
WORK6_KS_FILE=http://10ks.repo.local/worker6.cfg
ETCDM1_KS_FILE=http://10ks.repo.local/etcd1.cfg
ETCDM2_KS_FILE=http://10ks.repo.local/etcd2.cfg
ETCDM3_KS_FILE=http://10ks.repo.local/etcd3.cfg


#PATHS Storage
DIR_POOL=/mnt/ustore/kvm/10_hard_lab/

#Libvirt Pool
LIVB_POOL=10_hard_lab

# Path image ISO
ISO_PATH="/mnt/ustore/kvm/isos_pool/ubuntu-22.04.5-live-server-amd64.iso"

# Storage names
VOL_MASTER1=10_master1_hard.qcow2
VOL_MASTER2=10_master2_hard.qcow2
VOL_MASTER3=10_master3_hard.qcow2
VOL_WORKER1=10_worker1_hard.qcow2
VOL_WORKER2=10_worker2_hard.qcow2
VOL_WORKER3=10_worker3_hard.qcow2
VOL_WORKER4=10_worker4_hard.qcow2
VOL_WORKER5=10_worker5_hard.qcow2
VOL_WORKER6=10_worker6_hard.qcow2
VOL_ETCDM1=10_etcd_master1_hard.qcow2
VOL_ETCDM2=10_etcd_master2_hard.qcow2
VOL_ETCDM3=10_etcd_master3_hard.qcow2

echo -e "${GREEN} Poweroff VM\n"

# Shutdown VM
sudo /usr/bin/virsh destroy --domain $MASTER1
sudo /usr/bin/virsh destroy --domain $MASTER2
sudo /usr/bin/virsh destroy --domain $MASTER3
sudo /usr/bin/virsh destroy --domain $WORKER1
sudo /usr/bin/virsh destroy --domain $WORKER2 
sudo /usr/bin/virsh destroy --domain $WORKER3 
sudo /usr/bin/virsh destroy --domain $WORKER4 
sudo /usr/bin/virsh destroy --domain $WORKER5 
sudo /usr/bin/virsh destroy --domain $WORKER6 
sudo /usr/bin/virsh destroy --domain $ETCDM1 
sudo /usr/bin/virsh destroy --domain $ETCDM2 
sudo /usr/bin/virsh destroy --domain $ETCDM3 

sleep 2

echo -e "${RED} Undefine current VM\n"

# Undefine current VM
sudo /usr/bin/virsh undefine --domain $MASTER1
sudo /usr/bin/virsh undefine --domain $MASTER2
sudo /usr/bin/virsh undefine --domain $MASTER3
sudo /usr/bin/virsh undefine --domain $WORKER1
sudo /usr/bin/virsh undefine --domain $WORKER2 
sudo /usr/bin/virsh undefine --domain $WORKER3 
sudo /usr/bin/virsh undefine --domain $WORKER4 
sudo /usr/bin/virsh undefine --domain $WORKER5 
sudo /usr/bin/virsh undefine --domain $WORKER6 
sudo /usr/bin/virsh undefine --domain $ETCDM1 
sudo /usr/bin/virsh undefine --domain $ETCDM2 
sudo /usr/bin/virsh undefine --domain $ETCDM3 

sleep 2

echo -e "${GREEN} Delete current storage\n"

# Delete storage
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_MASTER1
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_MASTER2
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_MASTER3
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_WORKER1
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_WORKER2
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_WORKER3
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_WORKER4
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_WORKER5
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_WORKER6
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ETCDM1
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ETCDM2
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ETCDM3

sleep 2

echo -e "${RED} Create storage to VM\n"

# Create storage
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_MASTER1 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_MASTER2 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_MASTER3 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_WORKER1 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_WORKER2 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_WORKER3 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_WORKER4 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_WORKER5 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_WORKER6 --format qcow2 --capacity 25G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ETCDM1 --format qcow2 --capacity 15G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ETCDM3 --format qcow2 --capacity 15G
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ETCDM3 --format qcow2 --capacity 15G

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
--disk ${DIR_POOL}${VOL_MASTER1},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:60 \
--location={$ISO_PATH} \
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
--disk ${DIR_POOL}${VOL_WORKER1},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:61 \
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
--disk ${DIR_POOL}${VOL_WORKER2},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:62 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${WORK2_KS_FILE} inst.repo=${REPO} inst.noverifyssl"

exit 0
