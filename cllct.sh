#!/bin/bash


read -p "Enter your username : " user
read -s -p "Enter Password  : " pwd
list=`cat node_list.txt`
#user="musa"

#do the conf

for i in $list; do 
    echo "connecting to"$user"@"$i;
    ssh $user@$i "set cli screen-width 0;show config|display inheritance brief|no-more" >> ./conf/$i;
done


#do the intf

for i in $list; do 
    ssh $user@$i "set cli screen-width 0;show configuration system host-name | display inheritance;show interfaces|no-more;show interfaces terse|no-more" >> ./intf/$i;
done


#do the paths

for i in $list; do 
    ssh $user@$i "set cli screen-width 0;show configuration system host-name | display inheritance;show mpls lsp statistics ingress extensive logical-router all|no-more" >> ./path/$i;
done

#do the cli 

for i in $list; do 
    ssh $user@$i "set cli screen-width 0;show configuration system host-name | display inheritance;show version|no-more;show chassis hardware|no-more;show chassis fpc|no-more;show chassis hardware models|no-more" >> ./cli/$i;
done

