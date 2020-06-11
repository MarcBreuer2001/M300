    
      
       sudo apt-get update


       sudo apt-get -y install debconf-utils apache2 nmap
       sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password admin'
       sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password admin'

       sudo apt-get -y install php libapache2-mod-php php-curl php-cli php-mysql php-gd mysql-client  

       sudo mkdir /usr/share/adminer
       sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
       sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
       echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf

       sudo a2enconf adminer.conf 
       sudo service apache2 restart 
      echo '127.0.0.1 localhost web01\n192.168.36.100 DB001' > /etc/hosts