ansible_ad-hoc: vm_prepare
	ansible all -i inventory.ini -u imokretsov -m ping

vm_prepare:
	vagrant up

vm_destroy:
	vagrant destroy -f