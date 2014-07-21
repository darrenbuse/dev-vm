#!/bin/sh
docker run -i -t -v=`pwd`:/data -w=/data darrenbuse/ansible-test sh -e -c -i "ansible-playbook $1 -i inventory && bash"
