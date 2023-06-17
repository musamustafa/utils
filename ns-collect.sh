#!/bin/bash

list-juniper=(`cat juniper_node_list.txt`)
list-xr=(`cat xr_node_list.txt`)
list-ios=(`cat ios_node_list.txt`)
read -p "Enter your username : " user
read -s -p "Enter Password  : " pwd

mkdir conf
mkdir intf
mkdir cli
mkdir ospf

#do the conf interface and equipment for Juniper
for i in ${list-juniper[@]}; do 
    echo "getting conf of " $i 
    ./conf.exp $user $i $pwd  >> ./conf/$i &
    echo "getting interfaces of " $i 
    ./intf.exp $user $i $pwd  >> ./intf/$i &
    echo "getting equipment of " $i 
    ./cli.exp $user $i $pwd  >> ./cli/$i &
done


#do the conf interface and equipment for xr
for i in ${list-xr[@]}; do 
    echo "getting conf of " $i 
    ./xr-conf.exp $user $i $pwd  >> ./conf/$i &
    echo "getting interfaces of " $i 
    ./xr-intf.exp $user $i $pwd  >> ./intf/$i &
    echo "getting equipment of " $i 
    ./xr-cli.exp $user $i $pwd  >> ./cli/$i &
done


#do the conf interface and equipment for ios
for i in ${list-ios[@]}; do 
    echo "getting conf of " $i 
    ./ios-conf.exp $user $i $pwd  >> ./conf/$i &
    echo "getting interfaces of " $i 
    ./ios-intf.exp $user $i $pwd  >> ./intf/$i &
    echo "getting equipment of " $i 
    ./ios-cli.exp $user $i $pwd  >> ./cli/$i &
done