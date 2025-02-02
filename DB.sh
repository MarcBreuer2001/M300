sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password S3cr3tp4ssw0rd'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password S3cr3tp4ssw0rd'

# Installation MYSQL
sudo apt-get install -y mysql-server

# MySQL Port öffnen
sudo sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Auth für Remote Access vom WEB001 192.168.36.101
mysql -uroot -pS3cr3tp4ssw0rd <<%EOF%
	CREATE USER 'root'@'192.168.36.101' IDENTIFIED BY 'admin';
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.36.101';
	FLUSH PRIVILEGES;
%EOF%

#FW Config für DB
   sudo apt-get install ufw
   sudo ufw enable
#Ganzer Verkehr auf 3306/TCP blocken 
   sudo ufw deny 3306/tcp
#Nur vom WebServer access zulassen. 
   sudo ufw allow from 192.168.36.101 to any port 3306

# Restart SQL Service 
sudo service mysql restart