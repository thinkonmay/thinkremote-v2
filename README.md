Thinkremote
===================================
Thinkremote is the technology stack allow you to access your computer remotely

**Demo**

https://user-images.githubusercontent.com/64737125/146868760-6cb69504-ddca-4660-8be1-8d568b16f443.mp4


Features
--------------
- Based on WebRTC protocol and Gstreamer multimedia framework
- Is capable of H264 video streaming, OPUS audio codec audio streaming 
- Is capable of hardware accelerated video encoding for AMD,NVIDIA and Intel GPU

Join us
-----------
[Email](huyhoangdo0205@gmail.com)
[Document]()

Requirement to build
-------------------------
  - [Gstreamer 1.22.0](https://gstreamer.freedesktop.org/) - A complete, cross-platform solution to record, convert and stream audio and video.
    1. [Download Gstreamer package](https://gstreamer.freedesktop.org/data/pkg/windows/1.19.2/msvc/gstreamer-1.0-devel-msvc-x86_64-1.22.0.msi) 
    1. [Download Gstreamer development package](https://gstreamer.freedesktop.org/data/pkg/windows/1.19.2/msvc/gstreamer-1.0-msvc-x86_64-1.22.0.msi)
  - [Go 1.20](https://vb-audio.com/Cable) - Create a fake audio device for audio capturing.  
    1. [Download GO](https://go.dev/) 
  - [.NET 6.0](https://dotnet.microsoft.com/en-us/) - Build tool for HID module  
    1. [Download .NET from Microsoft](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) 



Client
----------------
We focus on browser first, and will keep this direction.

We have
* Browser client (you can access our production client [here](https://remote.thinkmay.net))
* Flutter client (we are working on this)


Worker 
--------------
A window service to host remote desktop application, we focus on window-first and will keep this direction.

We highly recommend you to deploy thinkremote worker on 
* OS Microsoft Windows 10 Pro 10.0.19045 Build 19045
* OS Microsoft Windows Server 2022 Standard Evaluation 10.0.20348 Build 20348 (we are still figuring out how to make gamepad running)

Following process would be deployed 
* [hid](https://dotnet.microsoft.com/en-us/) - stimulate gamepad / mouse / keyboard on worker
* [hub](https://dotnet.microsoft.com/en-us/) - capture, encode and stream to client
* [watcher](https://dotnet.microsoft.com/en-us/) - watch all running process and hardware status
* [daemon](https://dotnet.microsoft.com/en-us/) - Manage all child process and API call to subsystem

API server
----------------
We do provide API to deploy thinkremote quickly to your product, you can check the pricing plan [here](https://summerday11.notion.site/Pricing-f7926190285a4aacaceae0cfc862de3a) 



Build
--------------
We do have CICD pipeline that automate build and create github release, 99% of the time you won't have to build it by yourself


How to use
-----------
Thinkremote github repository is managed by Thinkmay organization

- Request a demo by email us: huyhoangdo0205@gmail.com

Licensing
-----------
Thinkremote is distributed uner GNU General Public License v3

Contributing
-----------
- If you want to contribute to this repository email us at huyhoangdo0205@gmail.com
