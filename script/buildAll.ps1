$env:Path += ';C:\gstreamer\1.22.0\msvc_x86_64\bin'
$env:PKG_CONFIG_PATH = "C:\gstreamer\1.22.0\msvc_x86_64\lib\pkgconfig"

git submodule update --init --recursive

mkdir artifact

# install gstreamer
Invoke-WebRequest -Uri "https://github.com/thinkonmay/thinkremote-rtchub/releases/download/asset-gstreamer-1.22.0/lib.zip" -OutFile artifact/lib.zip 
Expand-Archive artifact/lib.zip -DestinationPath  package/hub


# build GO 
go clean --cache

Set-Location .\server\daemon
go build -ldflags -H=windowsgui -o daemon.exe
Set-Location ../../

Set-Location .\server\hub
go build -ldflags -H=windowsgui -o hub.exe  ./cmd/server/
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

robocopy .\server\daemon\tools .\package\tools thinkremote-svc.exe
robocopy .\server\daemon\scripts .\package\scripts 

Compress-Archive .\package -DestinationPath .\artifact\thinkremote.zip 