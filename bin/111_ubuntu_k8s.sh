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
JUMPBOX=10_jumpbox_hard_lab


#PATHS Storage
DIR_POOL=/mnt/ustore/kvm/10_hard_lab/

#Libvirt Pool
LIVB_POOL=10_hard_lab

# Path image ISO
IMAGE=/mnt/ustore/kvm/isos_pool/ubuntu-22.04-server-cloudimg-amd64.img

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
VOL_JUMPBOX=10_jumpbox_hard_lab.qcow2

# Master Config files
USER_DATA_M1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master1-user-data.yaml
NET_DATA_M1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master1-network-config.yaml
META_DATA_M1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master1-meta-data.yaml

USER_DATA_M2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master2-user-data.yaml
NET_DATA_M2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master2-network-config.yaml
META_DATA_M2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master2-meta-data.yaml

USER_DATA_M3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master3-user-data.yaml
NET_DATA_M3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master3-network-config.yaml
META_DATA_M3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/master3-meta-data.yaml

# Master Config files
USER_DATA_W1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker1-user-data.yaml
NET_DATA_W1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker1-network-config.yaml
META_DATA_W1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker1-meta-data.yaml

USER_DATA_W2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker2-user-data.yaml
NET_DATA_W2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker2-network-config.yaml
META_DATA_W2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker2-meta-data.yaml

USER_DATA_W3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker3-user-data.yaml
NET_DATA_W3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker3-network-config.yaml
META_DATA_W3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker3-meta-data.yaml

USER_DATA_W4=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker4-user-data.yaml
NET_DATA_W4=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker4-network-config.yaml
META_DATA_W4=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker4-meta-data.yaml

USER_DATA_W5=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker5-user-data.yaml
NET_DATA_W5=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker5-network-config.yaml
META_DATA_W5=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker5-meta-data.yaml

USER_DATA_W6=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker6-user-data.yaml
NET_DATA_W6=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker6-network-config.yaml
META_DATA_W6=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/worker6-meta-data.yaml

# etcd masters Config files
USER_DATA_E1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm1-user-data.yaml
NET_DATA_E1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm1-network-config.yaml
META_DATA_E1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm1-meta-data.yaml

USER_DATA_E2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm2-user-data.yaml
NET_DATA_E2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm2-network-config.yaml
META_DATA_E2=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm2-meta-data.yaml

USER_DATA_E3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm3-user-data.yaml
NET_DATA_E3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm3-network-config.yaml
META_DATA_E3=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/etcdm3-meta-data.yaml

# jumbox Config files
USER_DATA_J1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/jumpbox1-user-data.yaml
NET_DATA_J1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/jumpbox1-network-config.yaml
META_DATA_J1=/home/pablo/documentos/informatica/linux/certificaciones/05_createVM/cloud-init-files/ubuntu_server/jumpbox1-meta-data.yaml

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
sudo /usr/bin/virsh destroy --domain $JUMPBOX

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
sudo /usr/bin/virsh undefine --domain $JUMPBOX

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
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_JUMPBOX

sleep 2

echo -e "${RED} Create storage to VM\n"
# Create master storage
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_MASTER1} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_MASTER1}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_MASTER2} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_MASTER2}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_MASTER3} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_MASTER3}

# Create worker storage
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_WORKER1} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_WORKER1}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_WORKER2} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_WORKER2}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_WORKER3} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_WORKER3}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_WORKER4} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_WORKER4}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_WORKER5} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_WORKER5}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_WORKER6} $NODEDS
#chown pablo:users ${DIR_POOL}${VOL_WORKER6}

# Create etcd master storage
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_ETCDM1} $ETCDDS
#chown pablo:users ${DIR_POOL}${VOL_ETCDM1}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_ETCDM2} $ETCDDS
#chown pablo:users ${DIR_POOL}${VOL_ETCDM2}
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_ETCDM3} $ETCDDS
#chown pablo:users ${DIR_POOL}${VOL_ETCDM3}

# Create jumpbox storage
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_JUMPBOX} $NODEDS


sleep 2

date +%D-%T
echo -e
echo -e "${GREEN} Install ${JUMPBOX}\n"

sudo virt-install \
-n ${JUMPBOX} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_JUMPBOX},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:211 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_J1},meta-data=${META_DATA_J1},network-config=${NET_DATA_J1}

sleep 10

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
--network network=default,mac=52:54:00:9a:cc:71 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_M1},meta-data=${META_DATA_M1},network-config=${NET_DATA_M1}

sleep 10

date +%D-%T
echo -e
echo -e "${WHITE} Install ${MASTER2}\n"

sudo virt-install \
-n ${MASTER2} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_MASTER2},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:72 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_M2},meta-data=${META_DATA_M2},network-config=${NET_DATA_M2}

sleep 10

date +%D-%T
echo -e
echo -e "${GREEN} Install ${MASTER3}\n"

sudo virt-install \
-n ${MASTER3} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_MASTER3},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:73 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_M3},meta-data=${META_DATA_M3},network-config=${NET_DATA_M3}

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
--network network=default,mac=52:54:00:9a:cc:51 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W1},meta-data=${META_DATA_W1},network-config=${NET_DATA_W1}

sleep 10

date +%D-%T
echo -e
echo -e "${RED} Install ${WORKER2}\n"

sudo virt-install \
-n ${WORKER2} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_WORKER2},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:52 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W2},meta-data=${META_DATA_W2},network-config=${NET_DATA_W2}

sleep 10

date +%D-%T
echo -e
echo -e "${YELLOW} Install ${WORKER3}\n"

sudo virt-install \
-n ${WORKER3} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_WORKER3},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:53 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W3},meta-data=${META_DATA_W3},network-config=${NET_DATA_W3}

sleep 10

date +%D-%T
echo -e
echo -e "${WHITE} Install ${WORKER4}\n"

sudo virt-install \
-n ${WORKER4} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_WORKER4},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:54 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W4},meta-data=${META_DATA_W4},network-config=${NET_DATA_W4}

sleep 10

date +%D-%T
echo -e
echo -e "${BLUE} Install ${WORKER5}\n"

sudo virt-install \
-n ${WORKER5} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_WORKER5},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:55 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W5},meta-data=${META_DATA_W5},network-config=${NET_DATA_W5}

sleep 10

date +%D-%T
echo -e
echo -e "${GREEN} Install ${WORKER6}\n"

sudo virt-install \
-n ${WORKER6} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_WORKER6},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:56 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W6},meta-data=${META_DATA_W6},network-config=${NET_DATA_W6}

sleep 10

date +%D-%T
echo -e
echo -e "${RED} Install ${ETCDM1}\n"

sudo virt-install \
-n ${ETCDM1} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_ETCDM1},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:31 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_E1},meta-data=${META_DATA_E1},network-config=${NET_DATA_E1}

sleep 10

date +%D-%T
echo -e
echo -e "${RED} Install ${ETCDM2}\n"

sudo virt-install \
-n ${ETCDM2} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_ETCDM2},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:32 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_E2},meta-data=${META_DATA_E2},network-config=${NET_DATA_E2}

sleep 10

date +%D-%T
echo -e
echo -e "${YELLOW} Install ${ETCDM3}\n"

sudo virt-install \
-n ${ETCDM3} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_ETCDM3},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cc:33 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_E3},meta-data=${META_DATA_E3},network-config=${NET_DATA_E3}


