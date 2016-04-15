#!/bin/bash

export HBASE_VER=hbase-0.98.15-SNAPSHOT
export HBASE_TAR=${HBASE_VER}-bin.tar.gz
export PDIR="/proj/End2end/loctx/tars"
export TARGET_HOST="aranb@users.emulab.net"

if [ "$#" -lt 1 ] 
then
	echo "Usage: `basename $0` tso|ycsb|hbase" 1>&2
	exit 1
fi

export target=$1

case ${target} in
ycsb)
scp ~/git/ycsb/distribution/target/ycsb-0.1.4.tar.gz ${TARGET_HOST}:${PDIR}
;;
hbase)
scp ~/git/hbase/hbase-assembly/target/${HBASE_TAR} ${TARGET_HOST}:${PDIR}
;;
tso)
scp ~/git/omid/tso-server/target/tso-server-*-bin.tar.gz ${TARGET_HOST}:${PDIR}
;;
all)
update-cluster.sh hbase
update-cluster.sh tso
update-cluster.sh ycsb
;;
esac	
