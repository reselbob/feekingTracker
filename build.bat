@echo off
setlocal EnableDelayedExpansion
echo %1

kubectl get service | findstr %1 > temp.txt

for /f "delims=" %%x in (temp.txt) do set myservice=%%x

type temp.txt
rem set /P myservice= < temp.txt

del temp.txt
echo The service return is: %myservice%

set n=0
for %%a in ( %myservice% ) do (
   set vector[!n!]=%%a
   set /A n+=1
)

set serviceurl=!vector[3]!
echo The service url is: %serviceurl%
