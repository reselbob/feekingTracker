@echo off
setlocal EnableDelayedExpansion
echo %1
echo ----
kubectl get service | findstr %1
echo ----
kubectl get service | findstr %1 > C:\Jenkins\temp.txt
set /P myservice= < C:\Jenkins\temp.txt
echo The service return is: %myservice%

set n=0
for %%a in ( %myservice% ) do (
   set vector[!n!]=%%a
   set /A n+=1
)

set serviceurl=!vector[3]!
echo The service url is: %serviceurl%
