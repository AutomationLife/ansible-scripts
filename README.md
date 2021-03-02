# ansible-scripts

Ansible is also (IaaC) Infrastructure as a Code.
It is used for Configuration Management.
We can Provision any infrastructure with a set of tools or softwares installed in it.

Alternativers for Ansible are:

1. Ansible - Pure OSS
2. Puppet - Mostly Enterprise / OSS limited
3. Chef - Mostly Enterprise / OSS limited
4. salt

Ansible was introduced in 2012 by company Ansible Inc.
It was developed by Micheal Dehaan.
It was purely written in python but python knowledge is not needed to use it.
To use chef we need to learn RUBY and puppet needs puppet DSL which is backended with ruby.

Ansible is written in YAML - keyvalue pair.

* key:value
* normal
* library/dictionary
  * indentation using space
* list
  * written in format `- key: value`

Ansible was acquired by RedHat and later by IBM.

RedHart introduces Enterprise version of Ansible.
They even created **Ansible Tower** - Which is a UI for Ansible management.

This tool works on push mechanism, no agent needed to install. Where as puppet and chef works on pull Mechanism, it needs agents installed on target environment.

We need to have a server which acts as Ansible Master, which has Ansible Engine running in it. Ansible Engine use Modules, which writes playbooks written in YAML, which contain roles.
Playbooks has list of manage nodes which contain inventory. This is available under */etc/ansible/hosts*.

server
Ansible Engine (/etc/ansible)
Module (package, user, file, service, copy, fetch)
playbooks (YAML)
Roles
plugin to enhance Ansible.

Ansible Engine will Manage number of nodes, connection ports linux: 22, windows: 3589.

The two important file for ansible are **ansible.cfg**, **hosts** available in **/etc/ansible**.

## Sample ansible example

1. Create a folder **simple-application**.
2. Create file **hosts** and add the list of servers to connect.
3. Create file **ansible.cfg** to add the ansible configuration.
4. Add the *.pem* file to this folder to connect the target servers.
5. Change the file permission of .pem file to 400

        chmod 400 file.pem

6. Run the below command to check the connectivity with the servers.

        ansible all -m ping --key-file file.pem


## Installing java on target nodes

1. Run the below command to install java.

        ansible all -m apt -a "name=default-jre state=present update_cache=yes" --key-file file.pem --become

2. Run the below command to check the java version installed.

        ansible all -a "java -version" --key-file kul-labs.pem 

## Running using playbooks

1. create a yaml file which is a playbook.
2. Run below command to run the playbook.

        ansible-playbook myFirstPlaybook.yaml --key-file kul-labs.pem


## Ansible playbool commands

1. To do a dry-run of the playbook before executing it actually.

        ansible-playbook myFirstPlaybook.yaml --check

2. To get the list of hosts available for playbook to run.

        ansible-playbook myFirstPlaybook.yaml --list-hosts

3. To run the playbook with a keyfile when executing it.

        ansible-playbook myFirstPlaybook.yaml --key-file file.pem