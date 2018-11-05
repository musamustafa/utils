#!/bin/bash

list=(`cat node_list.txt`)
read -p "Enter your username : " user
read -s -p "Enter Password  : " pwd

mkdir conf
mkdir intf
mkdir path
mkdir cli
mkdir ospf

#do the conf
for i in ${list[@]}; do 
    echo "getting conf of " $i 
    ./conf.exp $user $i $pwd  >> ./conf/$i &
    echo "getting interfaces of " $i 
    ./intf.exp $user $i $pwd  >> ./intf/$i &
    echo "getting tunnels of " $i 
    ./path.exp $user $i $pwd  >> ./path/$i &
    echo "getting equipment of " $i 
    ./cli.exp $user $i $pwd  >> ./cli/$i &
    echo "getting ospf neighbor of " $i 
    ./ospf.exp $user $i $pwd  >> ./ospf/$i &
done

# TED
 echo "getting TED "
./ted.exp $user ${list[0]} $pwd &>> ./ted.txt





