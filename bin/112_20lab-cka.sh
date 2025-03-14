#!/usr/bin/env bash

date +%D-%T
echo -e
echo -e "${GREEN} Set Variables\n"

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
MASTER1=20controlplane1_hard_lab
MASTER2=20controlplane2_hard_lab
MASTER3=20controlplane3_hard_lab
WORKER1=20node1_hard_lab
WORKER2=20node2_hard_lab
WORKER3=20node3_hard_lab
WORKER4=20node4_hard_lab
WORKER5=20node5_hard_lab
WORKER6=20node6_hard_lab
ETCDM1=20_etcd_master1_hard_lab
ETCDM2=20_etcd_master2_hard_lab
ETCDM3=20_etcd_master3_hard_lab
LOADB=20_loadb_hard_lab


#PATHS Storage
DIR_POOL=/home/pablo/cka_pool

#Libvirt Pool
LIVB_POOL=cka_pool

# Path image ISO
IMAGE=/mnt/ustore/kvm/isos_pool/ubuntu-22.04-server-cloudimg-amd64.img

# Storage names
VOL_MASTER1=20controlplane1_hard.qcow2
VOL_MASTER2=20controlplane2_hard.qcow2
VOL_MASTER3=20controlplane3_hard.qcow2
VOL_WORKER1=20node1_hard.qcow2
VOL_WORKER2=20node2_hard.qcow2
VOL_WORKER3=20node3_hard.qcow2
VOL_WORKER4=20node4_hard.qcow2
VOL_WORKER5=20node5_hard.qcow2
VOL_WORKER6=20node6_hard.qcow2
VOL_ETCDM1=20_etcd_master1_hard.qcow2
VOL_ETCDM2=20_etcd_master2_hard.qcow2
VOL_ETCDM3=20_etcd_master3_hard.qcow2
VOL_LOADB=10_loadb_hard_lab.qcow2

# Master Config files
USER_DATA_M1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master1-user-data.yaml
NET_DATA_M1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master1-network-config.yaml
META_DATA_M1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master1-meta-data.yaml

USER_DATA_M2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master2-user-data.yaml
NET_DATA_M2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master2-network-config.yaml
META_DATA_M2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master2-meta-data.yaml

USER_DATA_M3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master3-user-data.yaml
NET_DATA_M3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master3-network-config.yaml
META_DATA_M3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/master3-meta-data.yaml

# Master Config files
USER_DATA_W1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker1-user-data.yaml
NET_DATA_W1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker1-network-config.yaml
META_DATA_W1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker1-meta-data.yaml

USER_DATA_W2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker2-user-data.yaml
NET_DATA_W2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker2-network-config.yaml
META_DATA_W2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker2-meta-data.yaml

USER_DATA_W3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker3-user-data.yaml
NET_DATA_W3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker3-network-config.yaml
META_DATA_W3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker3-meta-data.yaml

USER_DATA_W4=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker4-user-data.yaml
NET_DATA_W4=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker4-network-config.yaml
META_DATA_W4=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker4-meta-data.yaml

USER_DATA_W5=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker5-user-data.yaml
NET_DATA_W5=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker5-network-config.yaml
META_DATA_W5=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker5-meta-data.yaml

USER_DATA_W6=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker6-user-data.yaml
NET_DATA_W6=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker6-network-config.yaml
META_DATA_W6=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/worker6-meta-data.yaml

# etcd masters Config files
USER_DATA_E1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm1-user-data.yaml
NET_DATA_E1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm1-network-config.yaml
META_DATA_E1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm1-meta-data.yaml

USER_DATA_E2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm2-user-data.yaml
NET_DATA_E2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm2-network-config.yaml
META_DATA_E2=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm2-meta-data.yaml

USER_DATA_E3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm3-user-data.yaml
NET_DATA_E3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm3-network-config.yaml
META_DATA_E3=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/etcdm3-meta-data.yaml

# Load balance Config files
USER_DATA_LB1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/load1-user-data.yaml
NET_DATA_LB1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/load1-network-config.yaml
META_DATA_LB1=/home/pablo/github/05_createVM/cloud-init-files/20_k8s_cluster/load1-meta-data.yaml


date +%D-%T
echo -e "${BLUE} Poweroff VM\n"

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
sudo /usr/bin/virsh destroy --domain $LOADB

sleep 2

date +%D-%T
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
sudo /usr/bin/virsh undefine --domain $LOADB

sleep 2

date +%D-%T
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
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_LOADB
sleep 2

date +%D-%T
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

# Create loadb storage
qemu-img create -b $IMAGE -f qcow2 -F qcow2 ${DIR_POOL}${VOL_LOADB} $ETCDDS



sleep 2

date +%D-%T
echo -e
echo -e "${GREEN} Install ${LOADB}\n"

sudo virt-install \
-n ${LOADB} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--disk ${DIR_POOL}${VOL_LOADB},device=disk,bus=virtio \
--network network=default,mac=52:54:00:89:05:34 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_LB1},meta-data=${META_DATA_LB1},network-config=${NET_DATA_LB1}

sleep 5

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
--network network=default,mac=52:54:00:89:05:21 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_M1},meta-data=${META_DATA_M1},network-config=${NET_DATA_M1}

sleep 5

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
--network network=default,mac=52:54:00:89:05:22 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_M2},meta-data=${META_DATA_M2},network-config=${NET_DATA_M2}

sleep 5

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
--network network=default,mac=52:54:00:89:05:23 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_M3},meta-data=${META_DATA_M3},network-config=${NET_DATA_M3}

sleep 5

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
--network network=default,mac=52:54:00:89:05:81 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W1},meta-data=${META_DATA_W1},network-config=${NET_DATA_W1}

sleep 5

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
--network network=default,mac=52:54:00:89:05:82 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W2},meta-data=${META_DATA_W2},network-config=${NET_DATA_W2}

sleep 5

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
--network network=default,mac=52:54:00:89:05:83 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W3},meta-data=${META_DATA_W3},network-config=${NET_DATA_W3}

sleep 5

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
--network network=default,mac=52:54:00:89:05:84 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W4},meta-data=${META_DATA_W4},network-config=${NET_DATA_W4}

sleep 5

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
--network network=default,mac=52:54:00:89:05:85 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W5},meta-data=${META_DATA_W5},network-config=${NET_DATA_W5}

sleep 5

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
--network network=default,mac=52:54:00:89:05:86 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_W6},meta-data=${META_DATA_W6},network-config=${NET_DATA_W6}

sleep 5

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
--network network=default,mac=52:54:00:89:05:31 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_E1},meta-data=${META_DATA_E1},network-config=${NET_DATA_E1}

sleep 5

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
--network network=default,mac=52:54:00:89:05:32 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_E2},meta-data=${META_DATA_E2},network-config=${NET_DATA_E2}

sleep 5

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
--network network=default,mac=52:54:00:89:05:33 \
--vnc --autoconsole graphical \
--cloud-init user-data=${USER_DATA_E3},meta-data=${META_DATA_E3},network-config=${NET_DATA_E3}



