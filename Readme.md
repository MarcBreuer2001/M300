# Dokumentation M300 Multi VM 

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

### UFW einrichten 

Die Einrichtung von der UFW ist ganz simpel. die FW muss zuerst mit folgendem befehl installiert werden: 
$  sudo apt-get install ufw

Nach der installation des UFW muss mann diese dann auch noch aktivieren. Dies geschiet mit folgendem Befehl. 

$  sudo ufw enable

Danach kann mann anfangen Regeln zu definieren. der Nächste Command erstellt eine Regel für alle. Sprich er öffnet nur den Port zum Server.

$  sudo ufw allow 80/tcp

Hier öffne ich den Port 80 über das TCP Protokoll. 
Mann kann aber auch noch genauer Bestimmen wie und von welcher IP die Prots geöffnet werden z.b. Verbindung vom DB Server zum Web Server. Damit nur der Webserver auf die DB zugreifen kann. 
Hier ein Beispiel: 

$ sudo ufw allow from "IP Adresse oder Netzt"  to any port 22

Hier sagen wir dass von eine Bestimmten IP oder Netz auf den Port 22 zugeriffen werden darf. 



## Multi VM Vagrantfile Config

Das Vagrantfile ist so aufgebaut, dass die Provisionierung in einem Shell Script File festgehalten ist. Der Vorteil darin ist, dass das Vagrantfile so schlanker wird. und mann dort nur noch die Box Konfigurationen Vornehmen muss und die Provisionierung von Services in den jeweiligen Script macht. somit kann mann noch belibig viele VMs im Vagrant file hinzunehmen und dann die Konfiguration für services übernehmen und diese dann auch belibig viel einsetzten. 


## Usefull Vagrant Commands 


| Commands      | Description | 
| ------------- |-------------|
| Vagrant init  | erstellt im Aktuellen Directory ein Vagrant file|
| Vagrant up    | Wird gebraucht um die Config aus Vagrantfile zu laden. Achtung: nimmt immer das File aus akutellen Directory!! |
| Vagrant destroy| löscht die Komplette umgebung aus Vagrantfile. Wenn Multi VM Config dann sind alle VMs weg. kann aber spezialisiert werden|
|Vagrant ssh| Wird gebraucht um in VM zu gehen. Muss auch im verzeichniss vom Vagrant file ausgeführt werden.|
|Vagrant rdp| Wird gebraucht um eine RDP verbindung zu VM herzustellen. Funktioniert nur bei Windows Clients. |


## Tests for Multi VM Enviroment 

|Tests  | Successfull|
|-------|------------|
|VMs werden erstellt| JA |
|VMs Starten        |JA  |
|VMs sind per SSH erreichbar | Ja |
|Synced folder im Directory vorhanden | JA |
|DB Admin Protal erreichbar | JA |
|DB Admin login erfolgreich | JA |
|DB Direkt nich erreichbar  | JA |
|Root Deaktiviert |    Ja     |

Die Oben Ausgeführten Tests wurden alle mit "Ja" Bestätigt somit funktioniert die Umgebung einwandfrei.










