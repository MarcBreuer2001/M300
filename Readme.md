dokumentation M300 Multi VM 

Configuration VM 

+---------------------------------------------------------------+
! Notebook - Home Netz 192.168.10.0 und Host only 192.168.1.0   !                 
! Port: 8080 (192.158.55.101:80)                                !
! OS: Ubuntu 	                                                  !
!                                                               !	
!    +--------------------+          +---------------------+    !
!    ! Web Server         !          ! Datenbank Server    !    !       
!    ! Host: WEB001       !          ! Host: db01          !    !
!    ! IP: 192.168.1.101  ! <------> ! IP: 192.168.1.100   !    !
!    ! Port: 80           !          ! Port 3306           !    !
!    ! Nat: 8080          !          ! Nat: -              !    !
!    +--------------------+          +---------------------+    !
!                                                               !	
+---------------------------------------------------------------+

Sicherheit

Der Zugriff auf die Datenbank ist nur vom Webserver möglich. Der sonstige Zugriff auf die Datenbank ist unterdrückt. Der Root User wurde auf dem DB Server Deaktiviert. Zugriff nur noch mit Persöndlichem Admin möglich. (für genauere Infos Vagrantfile anschauen.)



