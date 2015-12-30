#!/bin/bash

export HBASE_VER=hbase-0.98.15-SNAPSHOT
export HBASE_TAR=${HBASE_VER}-bin.tar.gz

if [ "$#" -lt 1 ] 
then
	echo "Usage: `basename $0` tso|ycsb|hbase" 1>&2
	exit 1
fi

export target=$1

case ${target} in
ycsb)
scp ~/git/YCSB/distribution/target/ycsb-0.1.4.tar.gz aran@master:~/inst
;;
hbase)
scp ~/git/hbase/hbase-assembly/target/${HBASE_TAR} aran@master:~/inst
;;
tso)
scp ~/git/omid/tso-server/target/tso-server-bin.tar.gz aran@master:~/inst
;;
all)
~/bin/update-cluster.sh hbase
~/bin/update-cluster.sh tso
~/bin/update-cluster.sh ycsb
;;
esac	
