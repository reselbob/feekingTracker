@echo off
setlocal EnableDelayedExpansion
echo %1
timeout 10
kubectl get service | findstr %1 > temp.txt
timeout 2
set /P myservice=<temp.txt
echo The service return is: %myservice%

set n=0
for %%a in ( %myservice% ) do (
   set vector[!n!]=%%a
   set /A n+=1
)

set serviceurl=!vector[3]!
echo The service url is: %serviceurl%
