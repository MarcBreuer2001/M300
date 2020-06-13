# Dokumentation M300 

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


## Usefull Vagrant Commands 


| Commands      | Description | 
| ------------- |-------------|
| Vagrant init  | erstellt im Aktuellen Directory ein Vagrant file|
| Vagrant up    | Wird gebraucht um die Config aus Vagrantfile zu laden. Achtung: nimmt immer das File aus akutellen Directory!! |
| Vagrant destroy| löscht die Komplette umgebung aus Vagrantfile. Wenn Multi VM Config dann sind alle VMs weg. kann aber spezialisiert werden|
|Vagrant ssh| Wird gebraucht um in VM zu gehen. Muss auch im verzeichniss vom Vagrant file ausgeführt werden.|
|Vagrant rdp| Wird gebraucht um eine RDP verbindung zu VM herzustellen. Funktioniert nur bei Windows Clients. |


# LB02 Dokumentation

## Configuration VM 

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


## Multi VM Vagrantfile Config

Das Vagrantfile ist so aufgebaut, dass die Provisionierung in einem Shell Script File festgehalten ist. Der Vorteil darin ist, dass das Vagrantfile so schlanker wird. und mann dort nur noch die Box Konfigurationen Vornehmen muss und die Provisionierung von Services in den jeweiligen Script macht. somit kann mann noch belibig viele VMs im Vagrant file hinzunehmen und dann die Konfiguration für services übernehmen und diese dann auch belibig viel einsetzten. 

### Set-up 
Für genaue Informationen was genau passiert wenn mann die VMs Provisioniert, bitte dirket in den Konfigfiles nachschauen. 

## Firwall Konfig 

### Konfig WEB
Der Webserver wurde mit der Universal Firewall eingerichtet. Bei dieser wurde nur der Port 80 über TCP Freigegeben. 
Folgende Befehle wurden auf dem WEB Server ausgeführt.

$ sudo apt-get install ufw

$ sudo ufw enable

$ sudo ufw allow 80/tcp

### Konfig Database 
Die FW Konfiguration des Datenbaken Server war etwas komplizierter. Dies ist so weil ich mir es zum Ziel gesetzt habe, dass mann nur über den Webserver auf die Datenbank zugreifen kann. Darum habe ich mich dazu entschieden auch eine UFW einzusetzten auf diesem Server. Dort habe ich folgende Befehle ausgeführt: 

Um die UFW zu installieren und Aktivieren habe ich folgende Befehle verwendet: 

$ sudo apt-get install ufw
$ sudo ufw enable

Danach habe ich den Kompletten Verkehr auf den Port 3306 geblockt. 3306 ist der Port auf welcher gebraucht um auf die MYSQL Database zuzugreifen. Dies habe ich mich folgendem Befehl gemacht: 

$ sudo ufw deny 3306/tcp

Somit ist der ganze verkehr auf den Port 3306 via TCP geblockt, Somit kann niemand mehr auf die Datenbanken zugreifen. Darum habe ich noch eine speziefische Regel erstellt, welche dem Webserver den Zugriff auf den DB Server erlaubt: 

$ sudo ufw allow from 192.168.36.101 to any port 3306


Um den Zugriff zu Testen kann mann ganz einfach folgende Befehle Ausfüren: 
Auf einem Windows gerät: $ telnet 192.168.136.100 3306
Dies sollte dann die Rückmeldung geben, dass die Conncetion Refused wurde für diese Host. 

Wenn mann dies vom Webserver dann testen tut, dann sollte die verbindung möglich sein.

Befehl um dies zu testen Linux: 
$ curl -f 192.168.36.100:3306




## Tests for Multi VM Enviroment 

|Tests  | Successfull|
|-------|------------|
|VMs werden erstellt| JA |
|VMs Starten        |JA  |
|VMs sind per SSH erreichbar | JA |
|Synced folder im Directory vorhanden | JA |
|DB Admin Protal erreichbar | JA |
|DB Admin login erfolgreich | JA |
|DB Direkt nich erreichbar  | JA |
|Zugriff auf Prot 3306 blockiert| JA|
|Zugriff vom Webserver möglich |JA|

Dies sind die Tests um nachzuschauen ob die VMs erfolgreich Provisioniert werden. Wenn einer dieser Tests nicht das Gewünschte resultat ausgibt kann die Umgebung nicht eingesetzt werden.











