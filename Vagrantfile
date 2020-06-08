Vagrant.configure("2") do |config|

    config.vm.define :apache do |web|
        
        web.vm.box = "ubuntu/xenial64"
        web.vm.hostname = "srv-web"
        web.vm.network :forwarded_port, guest: 80, host: 4567
        web.vm.network "private_network" , ip: "192.168.1.25"
        config.vm.provider "virtualbox" do|vb|
            vb.memory = "1024"
            vb.name  = "WEB"
            vb.cpus = "1"


end

config.vm.provision  :shell, inline: <<-SHELL 
    sudo apt-get update
    sudo apt-get -y install apache2
SHELL