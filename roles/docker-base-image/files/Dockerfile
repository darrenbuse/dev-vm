FROM ubuntu
RUN apt-get install -y python-software-properties
RUN apt-add-repository ppa:rquillo/ansible
RUN apt-get update -y
RUN apt-get install -y ansible
ADD base.yml ./base.yml
RUN ansible-playbook base.yml --connection=local
