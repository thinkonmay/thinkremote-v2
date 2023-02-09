$env:PKG_CONFIG_PATH = "C:\gstreamer\1.0\msvc_x86_64\lib\pkgconfig"


# build GO 
go clean --cache

Set-Location .\server\hub
go build  -o hub.exe  ./cmd/server/
Set-Location ../../

Remove-Item "./package/hub/bin/hub.exe"
robocopy .\server\hub package/hub/bin hub.exe
Remove-Item "./server/hub/hub.exe"
