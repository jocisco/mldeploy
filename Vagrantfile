# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "mate"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210-nocm.box"

  config.vm.network :forwarded_port, guest: 8080, host: 8080
  config.vm.network :forwarded_port, guest: 8443, host: 8443

  $script = <<SCRIPT
  echo --- Provisioning...
  date >> /tmp//vagrant_provisioned_at
  sudo yum install git -y
  echo --- Dowloading deployment scripts...
  if [[ -d mldeploy ]]; then
    cd mldeploy
    sudo -u vagrant -s git pull                                                                            
  else
    sudo -u vagrant -s git clone https://github.com/jocisco/mldeploy.git 
    cd mldeploy
    sudo -u vagrant -s git remote add github https://jocisco@github.com/jocisco/mldeploy.git
  fi
  bash install.sh || { echo Failed to start the install process. Exiting; exit 1; }
SCRIPT

  config.vm.provision "shell", inline: $script

end
