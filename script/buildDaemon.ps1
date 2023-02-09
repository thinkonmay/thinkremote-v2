$env:PKG_CONFIG_PATH = "C:\gstreamer\1.0\msvc_x86_64\lib\pkgconfig"


# build GO 
go clean --cache

Set-Location .\daemon
go build  -o daemon.exe .
Set-Location ../

Remove-Item "./package/bin/daemon.exe"
robocopy .\Daemon package/bin daemon.exe
Remove-Item "./Daemon/daemon.exe"
