@echo off
setlocal EnableDelayedExpansion
echo %1

kubectl get service | findstr %1 > temp.txt

ping -n 10 127.0.0.1 >nul

type temp.txt

del temp.txt