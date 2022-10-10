Vagrant.configure("2") do |config|
  (1..3).each do |i|
    config.vm.define "node-#{i}" do |node| 
      node.vm.box = "ubuntu/jammy64"
      node.vm.hostname = "node-#{i}"
      node.vm.network "forwarded_port", guest: 80, host: "808#{i}"
      node.vm.provider "virtualbox" do |v|
        v.name = "node-#{i}"
        v.memory = 512
        v.cpus = 2
      end
      node.vm.network "private_network", ip: "192.168.10.#{i}",
        virtualbox__intnet: true
      node.vm.provision "shell", path: "script.sh"
    end
  end
end
