sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password S3cr3tp4ssw0rd'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password S3cr3tp4ssw0rd'

# Installation MYSQL
sudo apt-get install -y mysql-server

# MySQL Port öffnen
sudo sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Auth für Remote Access vom WEB001 192.168.1.101
mysql -uroot -pS3cr3tp4ssw0rd <<%EOF%
	CREATE USER 'root'@'192.168.1.101' IDENTIFIED BY 'admin';
	GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.1.101';
	FLUSH PRIVILEGES;
%EOF%

# Restart SQL Service 
sudo service mysql restart