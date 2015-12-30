#!/bin/bash

bash stop-hbase.sh
bash ~/bin/deploy.sh hbase
bash start-hbase.sh
hbase version
