Vagrant.configure("2") do |config|

config.vm.define "WEB" do |subconfig|


    subconfig.vm.box = "ubuntu/xenial64"
  
    subconfig.vm.box_check_update = false
  
    subconfig.vm.network "private_network", ip: "192.168.1.10"
  
      subconfig.vm.provider "virtualbox" do |vb|
  
       vb.gui = false
  
       vb.memory = "1024"
       vb.cpus = "2"
    end
  
    subconfig.vm.provision "shell", inline: <<-SHELL
       apt-get update
       apt-get install -y apache2
        SHELL
  end
  config.vm.define "db" do |subconfig|
   
      subconfig.vm.box = "ubuntu/xenial64"
  
    subconfig.vm.box_check_update = false
 
    subconfig.vm.network "private_network", ip: "192.168.1.11"
    subconfig.disksize.size = "50GB"
 
         subconfig.vm.provider "virtualbox" do |vb|
 
       vb.gui = false
 
         vb.memory = "1024"
         vb.cpus = "2"
     end 

     subconfig.vm.provision "shell", inline: <<-SHELL
          apt-get update
         sudo apt-get install mysql-server

      SHELL
   end   




end
