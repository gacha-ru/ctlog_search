#!/bin/sh

SCRIPT_PATH=`dirname ${0}`

ansible-playbook \
    --private-key=${SCRIPT_PATH}/../.vagrant/machines/ctkibana/virtualbox/private_key \
    -i hosts \
    sites.yml \
    --diff

    #--private-key=~/.vagrant.d/insecure_private_key \
