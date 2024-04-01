nodes = {
  :server01   => {
      :name    => "server01",
      :ip      => "192.168.56.11",
      :ssh_gport   => "22",
      :ssh_hport   => "2202",
      :http_gport   => "80",
      :http_hport   => "8080",
      :https_gport   => "443",
      :https_hport   => "8443",
      :cpus    => "2",
      :mem     => "1024"
  },
  :server02   => {
    :name    => "server02",
    :ip      => "192.168.56.12",
    :ssh_gport   => "22",
    :ssh_hport   => "2203",
    :http_gport   => "80",
    :http_hport   => "8081",
    :https_gport   => "443",
    :https_hport   => "8444",
    :cpus    => "2",
    :mem     => "1024"
},
  :server03   => {
      :name    => "server03",
      :ip      => "192.168.56.13",
      :ssh_gport   => "22",
      :ssh_hport   => "2204",
      :http_gport   => "80",
      :http_hport   => "8082",
      :https_gport   => "443",
      :https_hport   => "8445",
      :cpus    => "2",
      :mem     => "1024"
  }
}

Vagrant.configure("2") do |config|
  config.vm.box = "alse-vanilla-base/1.7.4uu1"
  config.ssh.forward_agent = true
  config.ssh.insert_key = false
  nodes.each do |node, cfg|
    config.vm.define node do |conf|
      conf.vm.hostname = cfg[:name]
      conf.vm.network "private_network", ip: cfg[:ip]
      conf.vm.network "forwarded_port", id: 'ssh', guest: cfg[:ssh_gport], host: cfg[:ssh_hport]
      conf.vm.network "forwarded_port", id: 'http', guest: cfg[:http_gport], host: cfg[:http_hport]
      conf.vm.network "forwarded_port", id: 'https', guest: cfg[:https_gport], host: cfg[:https_hport]
      conf.vm.provider "virtualbox" do |v|
        v.name = cfg[:name]
        v.cpus = cfg[:cpus]
        v.memory = cfg[:mem]
      end
      conf.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/tmp_public_key.pub"
      conf.vm.provision "shell", inline: <<-SHELL
        useradd -m -s /bin/bash imokretsov
        echo 'imokretsov ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/imokretsov
        chmod 0440 /etc/sudoers.d/imokretsov
        mkdir -p /home/imokretsov/.ssh
        cat /home/vagrant/tmp_public_key.pub > /home/imokretsov/.ssh/authorized_keys
        chown -R imokretsov:imokretsov /home/imokretsov/.ssh
        chmod 700 /home/imokretsov/.ssh
        chmod 600 /home/imokretsov/.ssh/authorized_keys
        rm /home/vagrant/tmp_public_key.pub
      SHELL
    end
  end
end