
setlocal EnableDelayedExpansion
echo %1

kubectl get service | findstr %1 > temp.txt

ping -n 20 127.0.0.1 >nul

type temp.txt

for /f "delims=" %%x in (temp.txt) do set myservice=%%x
echo The service return is: %myservice%

del temp.txt