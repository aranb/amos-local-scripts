#!/bin/bash

export TABLE="usertable"
export CF="fam"
export VERSIONS="1000000"

hbase shell << EOF
   list
   disable '${TABLE}'
   drop '${TABLE}'
   n_splits = 2
   create '${TABLE}', '${CF}', {SPLITS => (1..n_splits).map {|i| "user#{1000+i*(9999-1000)/n_splits}"}}
   alter '${TABLE}', {NAME=>'${CF}', VERSIONS=>${VERSIONS}}
   describe '${TABLE}'
EOF

~/inst/tso-server/bin/omid.sh create-hbase-commit-table -numSplits 16
~/inst/tso-server/bin/omid.sh create-hbase-timestamp-table

hbase shell << EOF
   list
EOF
