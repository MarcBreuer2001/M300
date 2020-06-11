Vagrant.configure(2) do |config|
       #Database BOX Configuration
      config.vm.define "database" do |db|
       db.vm.box = "ubuntu/xenial64"
      
          db.vm.provider "virtualbox" do |vb|
            vb.memory = "512"  
            end
    
         db.vm.hostname = "DB001"
          db.vm.network "private_network", ip: "192.168.36.100"
          #Provisionierung Services in shell Script
         db.vm.provision "shell", path: "DB.sh"
      end
   
      config.vm.define "web" do |web|
      web.vm.box = "ubuntu/xenial64"
      web.vm.hostname = "web001"
      web.vm.network "private_network", ip:"192.168.36.101" 
      web.vm.network "forwarded_port", guest:80, host:8080, auto_correct: true
      
      web.vm.provider "virtualbox" do |vb|
      vb.memory = "512"  
      end
      web.vm.synced_folder ".", "/var/www/html"  
      
      #Provisionierung Services in shell Script
      web.vm.provision "shell", path: "WEB.sh"
       
   end
    
  end