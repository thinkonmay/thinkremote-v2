# build GO 
go clean --cache

Set-Location .\server\daemon
go build  -o daemon.exe .
Set-Location ../../

Remove-Item "./package/bin/daemon.exe"
robocopy .\server\daemon package daemon.exe
Remove-Item "./server/daemon/daemon.exe"
