
setlocal EnableExtensions EnableDelayedExpansion
echo %1
ping -n 45 127.0.0.1 >nul

kubectl get service | findstr %1 > temp.txt

type temp.txt

for /f "delims=" %%x in (temp.txt) do set myservice=%%x
echo The service return is: %myservice%

set n=0
for %%a in ( %myservice% ) do (
set vector[!n!]=%%a
set /A n+=1
)
set serviceurl=!vector[3]!
echo The service url is: %serviceurl%

del temp.txt