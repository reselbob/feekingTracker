
setlocal EnableExtensions EnableDelayedExpansion
echo %1
ping -n 10 127.0.0.1 >nul

kubectl get service | findstr %1 > temp.txt

type temp.txt

for /f "delims=" %%x in (temp.txt) do set myservice=%%x
echo The service return is: %myservice%

set n=0
@for %%a in ( %myservice% ) do echo %%a



del temp.txt
