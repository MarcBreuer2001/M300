# dokumentation M300 Multi VM 

# Configuration VM 

 ### Notebook - Home Netz 192.168.10.0 und Host only 192.168.1.0 
 
                    


  ### Web Server                     
 - Host: WEB001 
 - OS: Linux/Ubuntu
 - IP: 192.168.1.101       
 - Port: 80                      
 - Nat: 8080                             

### Datenbank Server 
- Host: db01 
- OS: Linux/Ubuntu
- IP: 192.168.1.100
- Port 3306    
- Nat: -   


## Sicherheit

Der Zugriff auf die Datenbank ist nur vom Webserver möglich. Der sonstige Zugriff auf die Datenbank ist unterdrückt. Der Root User wurde auf dem DB Server Deaktiviert. Zugriff nur noch mit Persöndlichem Admin möglich. (für genauere Infos Vagrantfile anschauen.)


## Vagrant 

Das Vagrantfile ist so aufgebaut, dass die Provisionierung in einem Shell Script File festgehalten ist. Der Vorteil darin ist, dass das Vagrantfile so schlanker wird. und mann dort nur noch die Box Konfigurationen Vornehmen muss und die Provisionierung von Services in den jeweiligen Script macht. somit kann mann noch belibig viele VMs im Vagrant file hinzunehmen und dann die Konfiguration für services übernehmen und diese dann auch belibig viel einsetzten. 


