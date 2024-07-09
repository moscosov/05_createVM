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
MINIKUBE=100_minikube_lab

# Ks files URLs
MINIKUBE_KS_FILE=http://rocky9.repo.local/100minikube.cfg

# Repo URLs
REPO=http://rocky9.repo.local/BaseOS/x86_64/os/

#PATHS Storage
DIR_POOL=/mnt/ustore/kvm/kuber_pool/

#Libvirt Pool
LIVB_POOL=kuber_pool

# Storage names
VOL_MINIKUBE=100_minikube_lab.qcow2

echo -e "${GREEN} Poweroff VM\n"

# Shutdown VM
sudo /usr/bin/virsh destroy --domain $MINIKUBE

sleep 2

echo -e "${RED} Undefine current VM\n"

# Undefine current VM
sudo /usr/bin/virsh undefine --domain $MINIKUBE

sleep 2

echo -e "${GREEN} Delete current storage\n"

# Delete storage
sudo /usr/bin/virsh vol-delete --pool $LIVB_POOL --vol $VOL_MINIKUBE

sleep 2

echo -e "${RED} Create storage to VM\n"

# Create storage
sudo /usr/bin/virsh vol-create-as --pool $LIVB_POOL --name $VOL_MINIKUBE --format qcow2 --capacity 30G

sleep 2

date +%D-%T
echo -e
echo -e "${YELLOW} Install ${MINIKUBE}\n"

sudo virt-install \
-n ${MINIKUBE} \
-r ${MEM_SIZE} \
--vcpus ${VCPUS} \
--os-type=${OS_TYPE} \
--os-variant=${OS_VARIANT} \
--autostart  \
--disk ${DIR_POOL}${VOL_MINIKUBE},device=disk,bus=virtio \
--network network=default,mac=52:54:00:9a:cb:50 \
--location ${REPO} \
--vnc --autoconsole graphical \
--extra-args "inst.ksdevice=en1s0p inst.ks=${MINIKUBE_KS_FILE} inst.repo=${REPO} inst.noverifyssl"

exit 0
