#!/bin/bash
echo "[TASK 1] Join node to Kubernetes Cluster"
apt install -qq -y sshpass >/dev/null 2>&1
sshpass -p "rootroot" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no master.example.com:/joincluster.sh /joincluster.sh 2>/dev/null
bash /joincluster.sh >/dev/null 2>&1
