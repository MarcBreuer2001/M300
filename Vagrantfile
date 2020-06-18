Vagrant.configure("2") do |config|
  config.vm.box = "StefanScherer/windows_2016"
  config.vm.hostname = "DC-win"
  winClientIP = "192.168.36.10"
  config.vm.network "private_network", ip: winClientIP

   config.vm.provider "virtualbox" do |vb|
      vb.name = "AD"
      vb.gui = false
      vb.memory = "2048"
      vb. cpus = "2"
   end 

 config.vm.provision "shell", path: "Set-up.ps1"



end
