ansible_ad-hoc: vm_prepare
	ansible all -i inventory.ini -u imokretsov -m ping

ansible_install_git:
	ansible-playbook -i inventory.ini playbook_install_git.yml

ansible_remove_git:
	ansible-playbook -i inventory.ini playbook_remove_git.yml

TAG ?= all
ansible_tags:
	ansible-playbook -i inventory.ini playbook_tags.yml -t $(TAG)

vm_prepare:
	vagrant up

vm_destroy:
	vagrant destroy -f