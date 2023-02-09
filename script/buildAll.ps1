$env:PKG_CONFIG_PATH = "C:\gstreamer\1.0\msvc_x86_64\lib\pkgconfig"

Remove-Item -Recurse -Force "./package/"

# install gstreamer
# Invoke-WebRequest -Uri "https://github.com/OnePlay-Internet/webrtc-proxy/releases/download/asset-gstreamer/gstreamer-1.21.3.zip" -OutFile artifact/gstreamer.zip 
Expand-Archive artifact/gstreamer.zip -DestinationPath  package/hub


# build GO 
go clean --cache

Set-Location .\server\daemon
go build -o daemon.exe
Set-Location ../../

Set-Location .\server\hub
go build  -o hub.exe  ./cmd/server/
Set-Location ../../



robocopy .\server\daemon package daemon.exe
robocopy .\server\hub package/hub/bin hub.exe

Remove-Item "./server/hub/hub.exe"
Remove-Item "./server/daemon/daemon.exe"

# build .NET
Set-Location .\server\hid
dotnet build . --output "bin" --self-contained true --runtime win-x64
Set-Location ../..

robocopy .\server\hid\bin package/hid
