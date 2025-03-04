#!/usr/bin/env bash

# Define echo color
GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
BLUE="\033[1;34m"

# Define global variables
MEM_SIZE=3076
VCPUS=2
OS_VARIANT="rocky9.0"
OS_TYPE="linux"

# Node names
ANSWORKER1=30_answorker1_lab
ANSWORKER2=30_answorker2_lab
ANSWORKER3=30_answorker3_lab
ANSWORKER4=30_answorker4_lab
ANSWORKER5=30_answorker5_lab
ANSWORKER6=30_answorker6_lab
ANSWORKER7=30_answorker7_lab
ANSWORKER8=30_answorker8_lab

# Ks files URLs
ANSWORK_KS_FILE1=http://rocky9.repo.local/ansible/30_answorker1.cfg
ANSWORK_KS_FILE2=http://rocky9.repo.local/ansible/30_answorker2.cfg
ANSWORK_KS_FILE3=http://rocky9.repo.local/ansible/30_answorker3.cfg
ANSWORK_KS_FILE4=http://rocky9.repo.local/ansible/30_answorker4.cfg
ANSWORK_KS_FILE5=http://rocky9.repo.local/ansible/30_answorker5.cfg
ANSWORK_KS_FILE6=http://rocky9.repo.local/ansible/30_answorker6.cfg
ANSWORK_KS_FILE7=http://rocky9.repo.local/ansible/30_answorker7.cfg
ANSWORK_KS_FILE8=http://rocky9.repo.local/ansible/30_answorker8.cfg

# Repo URLs
REPO=http://rocky9.repo.local/BaseOS/x86_64/os/

#PATHS Storage
DIR_POOL=/mnt/ustore/kvm/ansible/

#Libvirt Pool
LIVB_POOL=ansible_pool

# Space storage 
CAPACITY=25G

# Storage names
VOL_ANSWORKER1=30_answorker1.qcow2
VOL_ANSWORKER2=30_answorker2.qcow2
VOL_ANSWORKER3=30_answorker3.qcow2
VOL_ANSWORKER4=30_answorker4.qcow2
VOL_ANSWORKER5=30_answorker5.qcow2
VOL_ANSWORKER6=30_answorker6.qcow2
VOL_ANSWORKER7=30_answorker7.qcow2
VOL_ANSWORKER8=30_answorker8.qcow2

echo -e "${GREEN} Poweroff VM\n"

# Shutdown VM
sudo /usr/bin/virsh destroy --domain $ANSWORKER1
sudo /usr/bin/virsh destroy --domain $ANSWORKER2
sudo /usr/bin/virsh destroy --domain $ANSWORKER3
sudo /usr/bin/virsh destroy --domain $ANSWORKER4
sudo /usr/bin/virsh destroy --domain $ANSWORKER5
sudo /usr/bin/virsh destroy --domain $ANSWORKER6
sudo /usr/bin/virsh destroy --domain $ANSWORKER7
sudo /usr/bin/virsh destroy --domain $ANSWORKER8

sleep 2

echo -e "${RED} Undefine current VM\n"

# Undefine current VM
sudo /usr/bin/virsh undefine --domain $ANSWORKER1
sudo /usr/bin/virsh undefine --domain $ANSWORKER2
sudo /usr/bin/virsh undefine --domain $ANSWORKER3
sudo /usr/bin/virsh undefine --domain $ANSWORKER4
sudo /usr/bin/virsh undefine --domain $ANSWORKER5
sudo /usr/bin/virsh undefine --domain $ANSWORKER6
sudo /usr/bin/virsh undefine --domain $ANSWORKER7
sudo /usr/bin/virsh undefine --domain $ANSWORKER8

sleep 2

echo -e "${GREEN} Delete current storage\n"

# Delete storage
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ANSWORKER1
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ANSWORKER2
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ANSWORKER3
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ANSWORKER4
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ANSWORKER5
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ANSWORKER6
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ANSWORKER7
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_ANSWORKER8

sleep 2

echo -e "${RED} Create storage to VM\n"

# Create storage
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ANSWORKER1 --format qcow2 --capacity $CAPACITY
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ANSWORKER2 --format qcow2 --capacity $CAPACITY
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ANSWORKER3 --format qcow2 --capacity $CAPACITY
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ANSWORKER4 --format qcow2 --capacity $CAPACITY
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ANSWORKER5 --format qcow2 --capacity $CAPACITY
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ANSWORKER6 --format qcow2 --capacity $CAPACITY
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ANSWORKER7 --format qcow2 --capacity $CAPACITY
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_ANSWORKER8 --format qcow2 --capacity $CAPACITY

sleep 2

date +%D-%T
echo -e
echo -e "${YELLOW} Install ${ANSWORKER1}\n"

sudo virt-install \
-n ${ANSWORKER1} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_ANSWORKER1},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:30 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${ANSWORK_KS_FILE1} inst.repo=${REPO} inst.noverifyssl"

sleep 30

date +%D-%T
echo -e
echo -e "${BLUE} Install ${ANSWORKER2}\n"

sudo virt-install \
-n ${ANSWORKER2} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_ANSWORKER2},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:31 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${ANSWORK_KS_FILE2} inst.repo=${REPO} inst.noverifyssl"

sleep 30

date +%D-%T
echo -e
echo -e "${YELLOW} Install ${ANSWORKER3}\n"

sudo virt-install \
-n ${ANSWORKER3} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_ANSWORKER3},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:32 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${ANSWORK_KS_FILE3} inst.repo=${REPO} inst.noverifyssl"

sleep 30

date +%D-%T
echo -e
echo -e "${WHITE} Install ${ANSWORKER4}\n"

sudo virt-install \
-n ${ANSWORKER4} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_ANSWORKER4},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:33 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${ANSWORK_KS_FILE4} inst.repo=${REPO} inst.noverifyssl"

sleep 30

date +%D-%T
echo -e
echo -e "${GREEN} Install ${ANSWORKER5}\n"

sudo virt-install \
-n ${ANSWORKER5} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_ANSWORKER5},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:34 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${ANSWORK_KS_FILE5} inst.repo=${REPO} inst.noverifyssl"

sleep 30

date +%D-%T
echo -e
echo -e "${BLUE} Install ${ANSWORKER6}\n"

sudo virt-install \
-n ${ANSWORKER6} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_ANSWORKER6},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:35 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${ANSWORK_KS_FILE6} inst.repo=${REPO} inst.noverifyssl"

sleep 30

date +%D-%T
echo -e
echo -e "${RED} Install ${ANSWORKER7}\n"

sudo virt-install \
-n ${ANSWORKER7} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_ANSWORKER7},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:36 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${ANSWORK_KS_FILE7} inst.repo=${REPO} inst.noverifyssl"

sleep 30

date +%D-%T
echo -e
echo -e "${YELLOW} Install ${ANSWORKER8}\n"

sudo virt-install \
-n ${ANSWORKER8} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_ANSWORKER8},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:37 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${ANSWORK_KS_FILE8} inst.repo=${REPO} inst.noverifyssl"

exit 0
