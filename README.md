dockerfiles-centos-chrome
=========================

CentOS 7 dockerfile for Google Chrome

To build:

    # docker build --rm -t truhuynh/chrome:centos7 .

Run the chrome browser inside docker with a permanent storage (in this case ~/shared/data):
~/shared/data will be mapped to /data inside the container, and will provide the permanent storage for chrome.

    # docker run --rm -t --memory 512mb --net host -e DISPLAY=$DISPLAY -v /dev/snd:/dev/snd -v ~/shared/data:/data --privileged  truhuynh/chrome:centos7 

Run a pristine chrome browser inside docker, without any previous configuration:

    # docker run --rm -t --memory 512mb --net host -e DISPLAY=$DISPLAY -v /dev/snd:/dev/snd --privileged  truhuynh/chrome:centos7 

based on https://blog.jessfraz.com/posts/docker-containers-on-the-desktop.html


Display issue: 
1) [tru@home ~]$ docker run -t truhuynh/chrome:centos7
[1:1:0417/130908:ERROR:browser_main_loop.cc(171)] Running without the SUID sandbox! See https://code.google.com/p/chromium/wiki/LinuxSUIDSandboxDevelopment for more information on developing with the sandbox on.
[1:1:0417/130908:ERROR:browser_main_loop.cc(217)] Gtk: cannot open display

Please use/adapt the provided scripts at https://github.com/truatpasteurdotfr/chrome:
chrome-in-docker+keep-settings.sh and chrome-in-docker.sh 

Files owned by root:
2) ~/shared/data (the defined shared storage space) is owned by root :(

