# -*- mode: ruby -*-
# vi: set ft=ruby :

#  Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.

  #Configuring the HAProxy Load Balancer Node
  config.vm.define "hadoopnode" do |hadoopconfig|
    hadoopconfig.vm.box = "merikan/centos6.4-32bit-puppet-vbox"
    hadoopconfig.vm.hostname = "hadoopnode.local"
    hadoopconfig.vm.network "private_network", ip: "192.168.56.2"
    hadoopconfig.vm.provision :shell, :inline => "/etc/init.d/iptables stop"
    #Update /etc/hosts file
    hadoopconfig.vm.provision :hosts do |hahosts|
      hahosts.add_host '192.168.56.2',['hadoopnode.local']
    end
    #Configuring Puppet Masterless
    hadoopconfig.vm.provision "puppet" do |puppet|
      #puppet.options = "--verbose --debug"
      puppet.module_path = "modules"
      puppet.manifests_path = "manifests"
      puppet.manifest_file = "p_hadoop.pp"
    end
  end
end