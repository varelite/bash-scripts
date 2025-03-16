#!/bin/bash
## varelite: Print status of ping with hostname
## where vms.txt is the file having VM lists.

for i in $(cat /home/varelite/scripts/files/vms.txt)
do
        ping -c 3 $i > /dev/null
        if [ $? == 0 ]
        then
                echo -e "\e[32m$i is reachable\e[0m"
        else
                echo -e "\e[31m$i is not reachable\e[0m"
        fi

done
