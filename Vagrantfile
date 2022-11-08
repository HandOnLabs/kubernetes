# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

VAGRANT_BOX         = "generic/ubuntu2204"
VAGRANT_BOX_VERSION = "4.0.2"
CPUS_MASTER_NODE    = 2
CPUS_WORKER_NODE    = 1
MEMORY_MASTER_NODE  = 2048
MEMORY_WORKER_NODE  = 1048
WORKER_NODES_COUNT  = 2


Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "install_k8s.sh"

  # Kubernetes Master Server
  config.vm.define "master" do |node|
    node.vm.box               = VAGRANT_BOX
    node.vm.box_check_update  = false
    node.vm.box_version       = VAGRANT_BOX_VERSION
    node.vm.hostname          = "master.example.com"
    node.vm.network "private_network", ip: "192.168.56.10"
  
    node.vm.provider :virtualbox do |v|
      v.name    = "master"
      v.memory  = MEMORY_MASTER_NODE
      v.cpus    = CPUS_MASTER_NODE
    end
  
    node.vm.provision "shell", path: "init_master.sh"
  
  end


  # Kubernetes Worker Nodes
  (1..WORKER_NODES_COUNT).each do |i|

    config.vm.define "worker#{i}" do |node|

      node.vm.box               = VAGRANT_BOX
      node.vm.box_check_update  = false
      node.vm.box_version       = VAGRANT_BOX_VERSION
      node.vm.hostname          = "worker#{i}.example.com"

      node.vm.network "private_network", ip: "192.168.56.1#{i}"

      node.vm.provider :virtualbox do |v|
        v.name    = "worker#{i}"
        v.memory  = MEMORY_WORKER_NODE
        v.cpus    = CPUS_WORKER_NODE
      end

      node.vm.provision "shell", path: "join_worker.sh"

    end

  end

end
