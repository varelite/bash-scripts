#!/bin/bash
##Find some one liner command output
## sshpass is needed on server from where you are running the script
## ./run-commands.sh hostname
## run-commands.sh df -h

command="$*"

if [ -n "$command" ]
then
        for i in $(cat /root/ip.txt)
        do
                echo "Executing command on $i"
                out=$(sshpass -p 'password' ssh -o StrictHostKeyChecking=no root@$i "$command")
                echo "Output of ($i):"
                echo "$out"
        done
else
        echo "You haven't entered any command please run ./run-commands.sh command"

fi
