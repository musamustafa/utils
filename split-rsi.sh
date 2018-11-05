#!/bin/bash

flist=`ls -ltr | grep txt | awk '{print $9}'`

touch name-map

for file in $flist; do
    hostname=`cat $file | grep Hostname | awk '{print $2}'`;
    echo $file $hostname >>name-map;
    csplit -k -f $hostname $file /\>\ show/ '{30}';
done
