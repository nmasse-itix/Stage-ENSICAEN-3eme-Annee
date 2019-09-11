@ECHO OFF

sc stop rhcsproxy

sleep 1

copy rhcsproxy.exe c:\AEP
copy messages.dll c:\AEP

sc start rhcsproxy
