ansible_ad-hoc:
	ansible all -i inventory.ini -u imokretsov -m ping

ansible_install_git:
	ansible-playbook -i inventory.ini playbook_install_git.yml

ansible_install_git_wo_facts:
	ansible-playbook -i inventory.ini playbook_install_git_wo_facts.yml

ansible_remove_git:
	ansible-playbook -i inventory.ini playbook_remove_git.yml

TAG ?= all
ansible_tags:
	ansible-playbook -i inventory.ini playbook_tags.yml -t $(TAG)

ansible_nginx:
	ansible-playbook -i inventory.ini playbook_nginx.yml

ansible_loop:
	ansible-playbook playbook_loop.yml

add_known_hosts:
	ssh-keyscan -H 192.168.1.104 >> ~/.ssh/known_hosts
	ssh-keyscan -H 192.168.1.58 >> ~/.ssh/known_hosts
	ssh-keyscan -H 192.168.1.65 >> ~/.ssh/known_hosts
