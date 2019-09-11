@ECHO OFF

rem Some information about the service
regedit /S register.reg

rem Stop and unregister existing service
sc stop rhcsproxy
sc delete rhcsproxy

rem Register the service
sc create rhcsproxy start= demand type= own error= normal binPath= "C:\AEP\rhcsproxy.exe -s" DisplayName= "Red Hat Auto Enrollment Proxy"

rem Event log configuration
regedit /S service.reg

rem AEP Configuration
regedit /S config_aep.reg
