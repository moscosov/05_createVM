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
NODEDS="25G"
ETCDDS="15G"

# Node names
MASTER1=10_master1_hard_lab
#MASTER2=10_master2_hard_lab
#MASTER3=10_master3_hard_lab
#WORKER1=10_worker1_hard_lab
#WORKER2=10_worker2_hard_lab
#WORKER3=10_worker3_hard_lab
#WORKER4=10_worker4_hard_lab
#WORKER5=10_worker5_hard_lab
#WORKER6=10_worker6_hard_lab
#ETCDM1=10_etcd_master1_hard_lab
#ETCDM2=10_etcd_master2_hard_lab
#ETCDM3=10_etcd_master3_hard_lab


#PATHS Storage
DIR_POOL=/home/pablo/02_pool_vm/

#Libvirt Pool
LIVB_POOL=vm

# Path image ISO
IMAGE=/home/pablo/01_pool_isos/jammy-server-cloudimg-amd64.img

# Storage names
VOL_MASTER1=10_master1_hard.img
#VOL_MASTER2=10_master2_hard.qcow2
#VOL_MASTER3=10_master3_hard.qcow2
#VOL_WORKER1=10_worker1_hard.qcow2
#VOL_WORKER2=10_worker2_hard.qcow2
#VOL_WORKER3=10_worker3_hard.qcow2
#VOL_WORKER4=10_worker4_hard.qcow2
#VOL_WORKER5=10_worker5_hard.qcow2
#VOL_WORKER6=10_worker6_hard.qcow2
#VOL_ETCDM1=10_etcd_master1_hard.qcow2
#VOL_ETCDM2=10_etcd_master2_hard.qcow2
#VOL_ETCDM3=10_etcd_master3_hard.qcow2

# Config files
USER_DATA=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/user-data.yaml
NET_DATA=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/network-config.yaml
META_DATA=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/meta-data.yaml

echo -e "${GREEN} Poweroff VM\n"

# Shutdown VM
sudo /usr/bin/virsh destroy --domain $MASTER1
#sudo /usr/bin/virsh destroy --domain $MASTER2
#sudo /usr/bin/virsh destroy --domain $MASTER3
#sudo /usr/bin/virsh destroy --domain $WORKER1
#sudo /usr/bin/virsh destroy --domain $WORKER2 
#sudo /usr/bin/virsh destroy --domain $WORKER3 
#sudo /usr/bin/virsh destroy --domain $WORKER4 
#sudo /usr/bin/virsh destroy --domain $WORKER5 
#sudo /usr/bin/virsh destroy --domain $WORKER6 
#sudo /usr/bin/virsh destroy --domain $ETCDM1 
#sudo /usr/bin/virsh destroy --domain $ETCDM2 
#sudo /usr/bin/virsh destroy --domain $ETCDM3 

sleep 2

echo -e "${RED} Undefine current VM\n"

# Undefine current VM
sudo /usr/bin/virsh undefine --domain $MASTER1
#sudo /usr/bin/virsh undefine --domain $MASTER2
#sudo /usr/bin/virsh undefine --domain $MASTER3
#sudo /usr/bin/virsh undefine --domain $WORKER1
#sudo /usr/bin/virsh undefine --domain $WORKER2 
#sudo /usr/bin/virsh undefine --domain $WORKER3 
#sudo /usr/bin/virsh undefine --domain $WORKER4 
#sudo /usr/bin/virsh undefine --domain $WORKER5 
#sudo /usr/bin/virsh undefine --domain $WORKER6 
#sudo /usr/bin/virsh undefine --domain $ETCDM1 
#sudo /usr/bin/virsh undefine --domain $ETCDM2 
#sudo /usr/bin/virsh undefine --domain $ETCDM3 

sleep 2

echo -e "${GREEN} Delete current storage\n"

# Delete storage
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_MASTER1

sleep 2

echo -e "${RED} Create storage to VM\n"

# Create storage
#sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_MASTER1 --format qcow2 --capacity 25G

sudo qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_MASTER1} $NODEDS
sudo chown pablo:users ${DIR_POOL}${VOL_MASTER1}

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
--network network=default,mac=52:54:00:9a:cc:70 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA},meta-data=${META_DATA},network-config=${NET_DATA}
#--qemu-commandline="smbios type=1,serial=ds=nocloud"
