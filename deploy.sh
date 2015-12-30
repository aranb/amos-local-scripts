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
cp ~/git/YCSB/distribution/target/ycsb-0.1.4.tar.gz ~/inst
cd ~/inst
tar xzvf ycsb-*.tar.gz
rm -R ycsb
mv ycsb-0.1.4 ycsb
cp hbase-site.xml ycsb
;;
hbase)
cp ~/git/hbase/hbase-assembly/target/${HBASE_TAR} ~/inst
cd ~/inst
cp ${HBASE_VER}/conf/* conf/
tar xzvf ${HBASE_TAR}
cp conf/* ${HBASE_VER}/conf/
;;
tso)
cp ~/git/omid/tso-server/target/tso-server-bin.tar.gz ~/inst
cd ~/inst
tar xvzf tso-server-bin.tar.gz
cp ~/inst/hbase-site.xml tso-server/conf/
;;
all)
source ~/bin/deploy.sh hbase
source ~/bin/deploy.sh tso
source ~/bin/deploy.sh ycsb
;;
esac	
