apt-get update && apt-get install -y openjdk-8-jdk

cd /opt 
wget https://archive.apache.org/dist/nifi/1.6.0/nifi-1.6.0-bin.tar.gz
tar zxvf ./nifi-1.6.0-bin.tar.gz

cat << EOF >> /etc/security/limits.conf
*  hard  nofile  50000
*  soft  nofile  50000
*  hard  nproc  10000
*  soft  nproc  10000
EOF

cat << EOF >> /etc/sysctl.conf
net.ipv4.ip_local_port_range="10000 65000"
net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait="1"
vm.swappiness = 0 
EOF


