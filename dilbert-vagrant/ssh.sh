#!/bin/sh
ssh vagrant@10.12.0.2 -i /Volumes/Projects/Projects/home/my-stack/dilbert-vagrant/.vagrant/machines/dilbert/virtualbox/private_key -o ForwardAgent=yes -o GSSAPIAuthentication=no
