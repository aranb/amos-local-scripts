#!/bin/bash

export TABLE="usertable"
export CF="fam"
export VERSIONS="1000000"

start-dfs.sh
wait
start-yarn.sh
wait
start-hbase.sh
wait

bash ~/bin/run_omid.sh
